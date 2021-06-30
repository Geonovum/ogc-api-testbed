#!/bin/bash
#
# Cleanup dangling Docker stuff, ignore any errors.
#
# Just van den Broecke - 2021
#

# Remove all exited containers
for c in $(docker ps -a -f status=exited -q)
do
	docker rm ${c} 2>/dev/null | true
done

# And dangling images
for i in $(docker images -f dangling=true -q)
do
	docker rmi ${i} 2>/dev/null | true
done
