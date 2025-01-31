#!/bin/bash

validate_directory() {
  if [ -z "$1" ]; then
    printf "Error: No directory provided."
    exit 1
  fi
}
