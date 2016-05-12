#!/bin/bash

# Check if command exists
function comex {
  which $1 >/dev/null 2>&1
}

export -f comex
