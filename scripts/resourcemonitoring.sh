#!/bin/sh

# necessary for storage info
df_check_location='/home'

resources () {
	# get all the infos first to avoid high resources usage
	free_output=$(free -h | grep Mem)
	df_output=$(df -h $df_check_location | tail -n 1)
	# Used and total memory
	MEMUSED=$(echo $free_output | awk '{print $3}')
	MEMTOT=$(echo $free_output | awk '{print $2}')
	# Usage of CPU
	CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
	# Used and total storage
	STOUSED=$(echo $df_output | awk '{print $3}')
	STOTOT=$(echo $df_output | awk '{print $2}')

	printf "CPU %s" "$CPU"
	printf "\nMEM %s/%s" "$MEMUSED" "$MEMTOT"
	printf "\nSTO %s/%s" "$STOUSED" "$STOTOT"
	printf "\n"
}

resources
