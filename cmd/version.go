package cmd

import (
	"fmt"
	"runtime/debug"

	"github.com/spf13/cobra"
)

// versionCmd represents the version command
var versionCmd = &cobra.Command{
	Use:   "version",
	Short: "print the version number and exit (also --version)",
	Run:   printVersion,
}

func init() {
	rootCmd.AddCommand(versionCmd)
}

func printVersion(cmd *cobra.Command, args []string) {
	var bi, ok = debug.ReadBuildInfo()
	if ok {
		fmt.Printf("dive %s from %s\n", bi.Main.Version, bi.Main.Path)
	} else {
		fmt.Printf("dive (unknown version)")
	}

}
