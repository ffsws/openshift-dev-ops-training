package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"log"
	"openshift3/internal"
	"os"
	"time"
)

var applyCommand = &cobra.Command{

}

func GetApplyCommand() *cobra.Command {
	cmd := &cobra.Command{
		Use: "apply",
	}

	return cmd
}

func CreateArchitecture(arch string, count int) {
	log.Printf("Creating %d of architecture %s", count, arch)
	pwd, err := os.Getwd()
	if err != nil {
		log.Fatalf("error with pwd: %v", err)
	}

	workdir := pwd + BASE + arch
	dir, err := os.Stat(workdir)
	if err != nil || !dir.IsDir() {
		log.Fatal("architecture not found")
	}

	conf := pwd + BASE + arch + ".json"
	confStat, err := os.Stat(conf)
	if err != nil || confStat.IsDir() {
		log.Fatal("cannot find configuration")
	}

	terraform := internal.CreateTerraform(workdir, conf)
	log.Println("Init terraform")
	err = terraform.Init()
	if err != nil {
		fmt.Print(terraform.InitError.String())
		log.Fatalf("error on terraform init: %v", err)
	}

	var queue *internal.WorkQueue = internal.CreateWorkQueue(CONCURRENCY)
	for i := 0; i <= count; i++ {
		work := func(index int) internal.Work {
			return func() {
				start := time.Now()
				log.Printf("Start creating #%d\n", index)
				cmd, err := terraform.Apply(index)
				if err == nil {
					err = cmd.Wait()
				}

				if err != nil {
					log.Printf("Error while processing #%d\n%s", index, internal.GetStderr(cmd))
				} else {
					log.Printf("Finished creation of #%d / Duration: %v", index, time.Now().Sub(start))
				}
			}
		}(i)

		queue.AddWork(work)
	}

	queue.Run()
}
