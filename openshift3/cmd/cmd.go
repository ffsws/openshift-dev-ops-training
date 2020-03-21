package cmd

import (
	"fmt"
	"github.com/spf13/cobra"
	"log"
	"os"
)

const BASE = "/architecture/"
var CONCURRENCY int = 4

var rootCmd = &cobra.Command{
	Use:   "root [sub]",
	Short: "Version information",
	Long: `Some information`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("Version: 0.1")
	},
}

func Execute() {
	rootCmd.AddCommand(GetApplyCommand())

	if err := rootCmd.Execute(); err != nil {
		log.Println(err)
		os.Exit(1)
	}
}
