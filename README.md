# Shbang - Server Orchestration
Lays the foundational feces of your cybernetic garden. Does the dirty work so that you don't have to.
Sets up a secure Ubuntu Linux Server.


## Requirements

	- Bash-compatible shell (including Z shell)
	- Access to an Ubuntu Linux server

## Instructions

	1. Clone this project directory
	2. In the shell, `cd` into the root of this project
	3. Have your SSH authorized keys for the server in a file somewhere. Let's say `~/tmp/authorized_keys`, for example.
	4. Then execute:
		```
		host=localhost                                # (required)
		authorized_keys=$(cat ~/tmp/authorized_keys)  # (optional; no default value)
		port=22                                       # (optional; default value is 22)
		user=root                                     # (optional; default value is root)
		ssh_key=~/.ssh/id_rsa                         # (optional; default value is ~/.ssh/id_rsa)
		new_user=ada                                  # (optional; default value is smith)

		./setup-server -h "$host" -p "$port" -i "$ssh_key" -k "$authorized_keys" -u "$user" -n "$new_user"
		```

### One-liner

	If using hard-coded arguments directly in the command, then...

	- On bash-compatible shell, execute:
		```
		./setup-server -h "$host" -n "$new_user" -k "$(cat ~/tmp/authorized_keys)"
		```

	- On non-bash-compatible shell (such as fish), execute:
		```
		bash -c "./setup-server -h '$host' -n '$new_user' -k \"\$(cat ~/tmp/authorized_keys)\""
		```

