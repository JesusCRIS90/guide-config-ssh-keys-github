SHELL := /bin/bash


# Create new ssh-key
create-ssh-keys:
	# Invoke generate.sh bash script here

# Show current SSH-Keys
show-ssh-keys:
	ssh-add -l

# Add SSH-Keys
add-ssh-keys:
	./bash-scripts/add-ssh-keys.sh ./keys

# Generate SSH-Config

