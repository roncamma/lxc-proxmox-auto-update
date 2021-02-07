#!/bin/bash
# update all containers

# list of container ids we need to iterate through
containers=$(pct list | grep "running" | cut -f1 -d' ')

function update_container() {
  container=$1
  echo "Updating $container..."
  # to chain commands within one exec we will need to wrap them in bash
  pct exec $container -- bash -c "apt update && apt upgrade -y"
}

for container in $containers
do
  update_container $container
done
