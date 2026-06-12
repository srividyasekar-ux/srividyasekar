#!/usr/bin/env bash

# The authoritative version of this file lives in
# lib/helpers.bash in the instacart/buildkite-plugin-template repository

set -euo pipefail

function log {
  >&2 echo "$(date +"%T"): ${1}"
}

# Used to read a string and/or array Buildkite plugin configuration variable.
# Example use case is for the "my-plugin" plugin is:
#   mapfile -t items < <(read_array_option BUILDKITE_PLUGIN_MY_PLUGIN_FOO)
# This would take
# instacart/my-plugin#latest:
#   foo:
#     - bar
#     - baz
# and populate the bash variable `items` with ("bar", "baz") as an array
# The array can then be iterated as:
# for item in "${items[@]}"; do
#   echo "$item"
# done
function read_array_option {
  # Read a (string, array) type variable with the given prefix
  local option_prefix="$1"

  # it's a single string, print it out and exit
  if [[ -n "${!option_prefix:-}" ]]; then
    echo "${!option_prefix}"
  else
    local i=0
    local option_key="${option_prefix}_${i}"

    while [[ -n "${!option_key:-}" ]]; do
      echo "${!option_key}"
      i=$((i + 1))
      option_key="${option_prefix}_${i}"
    done
  fi
}
