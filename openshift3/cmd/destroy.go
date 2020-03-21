package cmd

import (
	"fmt"
	"log"
	"openshift3/internal"
	"os"
	"path/filepath"
	"regexp"
	"strconv"
	"time"
)

func DeleteArchitectures(arch string) {
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

	regex := regexp.MustCompile(`state-(\d+)\.tfstate$`)
	var count int = -1
	statePath := pwd + BASE + arch + "/states"
	if states, err := os.Stat(statePath); err != nil || !states.IsDir() {
		log.Fatalf("invalid state path: %s", statePath)
	}

	err = filepath.Walk(statePath, func(path string, info os.FileInfo, err error) error {
		matches := regex.FindStringSubmatch(info.Name())

		if len(matches) > 1 {
			parsed, err := strconv.Atoi(matches[1])
			if err == nil && parsed > count{
				count = parsed
			}
		}

		return nil
	})

	if count < 0 {
		log.Fatal("cannot determine number of valid states")
	}

	var queue *internal.WorkQueue = internal.CreateWorkQueue(CONCURRENCY)
	for i := 0; i <= count; i++ {
		work := func(index int) internal.Work {
			return func() {
				start := time.Now()

				log.Printf("Start destroying #%d\n", index)
				cmd, err := terraform.Destroy(index)
				if err == nil {
					err = cmd.Wait()
				}

				if err != nil {
					log.Printf("Error while processing #%d\n%s", index, internal.GetStderr(cmd))
				} else {
					log.Printf("Finished destruction of #%d / Duration: %v", index, time.Now().Sub(start))
				}
			}
		}(i)

		queue.AddWork(work)
	}

	queue.Run()
}
