package main

import (
	"github.com/gruntwork-io/terratest/modules/test-structure"
	"testing"
)

func TestWaf(t *testing.T) {
	t.Parallel()

	wafTfDir := "../examples/whitelist"

	defer test_structure.RunTestStage(t, "teardown", func() { teardown(t, wafTfDir) })
	test_structure.RunTestStage(t, "deploy", func() { deploy(t, wafTfDir, map[string]interface{}{}) })
}
