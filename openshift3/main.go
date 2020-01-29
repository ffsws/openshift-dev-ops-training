package main

import (
	"flag"
	"fmt"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"regexp"
	"strconv"
	"strings"
)

const BASE = "/architecture/"

func main() {
	arch := flag.String("arch", "", "Architecture to deploy")
	count := flag.Int("count", 0, "Number of training participants")
	minimal := flag.Bool("minimal", false, "Creates only trainer instances")
	del := flag.Bool("delete", false, "Flag to delete architecture")
	flag.Parse()

	if arch == nil {
		log.Fatal("invalid architecture given")
		return
	}

	if del != nil && *del {
		DeleteArchitectures(*arch)
		return
	}

	if minimal != nil && *minimal {
		CreateArchitecture(*arch, 0)
		return
	}

	if count != nil {
		CreateArchitecture(*arch, *count)
		return
	}

	log.Fatal("invalid count given")
}

func CreateArchitecture(arch string, count int) {
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

	terraform := CreateTerraform(workdir, conf)
	log.Println("Init terraform")
	err = terraform.Init()
	if err != nil {
		fmt.Print(terraform.InitError.String())
		log.Fatalf("error on terraform init: %v", err)
	}

	runningCommands := make([]*exec.Cmd, 0)
	for i := 0; i <= count; i++ {
		log.Printf("Start building #%d\n", i)
		cmd, err := terraform.Apply(i)

		if err != nil {
			if stdErr, ok := cmd.Stderr.(*strings.Builder); ok {
				fmt.Print(stdErr.String())
			}

			log.Fatalf("error running apply: %v", err)
		}

		runningCommands = append(runningCommands, cmd)
	}

	for _, cmd := range runningCommands {
		err = cmd.Wait()

		if err != nil {
			if stdErr, ok := cmd.Stderr.(*strings.Builder); ok {
				fmt.Print(stdErr.String())
			}

			log.Printf("error running apply: %v\n\n\n", err)
		}
	}
}

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

	terraform := CreateTerraform(workdir, conf)
	log.Println("Init terraform")
	err = terraform.Init()
	if err != nil {
		fmt.Print(terraform.InitError.String())
		log.Fatalf("error on terraform init: %v", err)
	}

	regex := regexp.MustCompile("state-(\\d+)\\.tfstate$")
	var count int = -1
	statePath := pwd + BASE + arch + "/states"
	if states, err := os.Stat(statePath); err != nil || !states.IsDir() {
		log.Fatalf("invalid state path: %s", statePath)
	}

	err = filepath.Walk(statePath, func(path string, info os.FileInfo, err error) error {
		if match := regex.FindString(info.Name()); len(match) > 0 {
			parsed, err := strconv.Atoi(match)
			if err != nil {
				count = max(count, parsed)
			}
		}

		return nil
	})

	if count < 0 {
		log.Fatal("cannot determine number of valid states")
	}

	runningCommands := make([]*exec.Cmd, 0)
	for i := 0; i <= count; i++ {
		log.Printf("Start destroying #%d\n", i)
		cmd, err := terraform.Destroy(i)

		if err != nil {
			if stdErr, ok := cmd.Stderr.(*strings.Builder); ok {
				fmt.Print(stdErr.String())
			}

			log.Fatalf("error running apply: %v", err)
		}

		runningCommands = append(runningCommands, cmd)
	}

	for i, cmd := range runningCommands {
		err = cmd.Wait()

		if err != nil {
			if stdErr, ok := cmd.Stderr.(*strings.Builder); ok {
				fmt.Print(stdErr.String())
			}

			log.Printf("error running destroy (%d): %v\n\n\n", i, err)
		}
	}
}

func max(a int, b int) int {
	if a > b {
		return a
	}
	return b
}