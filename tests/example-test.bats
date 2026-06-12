#!/usr/bin/env bats

# TEMPLATE: Delete me if not used

load "$BATS_PLUGIN_PATH/load.bash"

# Uncomment the following line to debug stub failures
# export BUILDKITE_AGENT_STUB_DEBUG=/dev/tty

@test "Test for test failure reason" {
  run bash -c "exit 0"
  
  assert_success
}
