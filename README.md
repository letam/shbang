# Shbang

💥 "It all started with a shell..."

Shbang is a library of scripts to orchestratate the deployment of secure,
production-ready web applications on Linux servers (infrastructure as code)
via scripts of Bash shell and Linux commands, but is ultimately a polyglot framework.

Open to using any code within reach, whether Perl, Python, PHP, Go, Deno, etc.

So far, Shbang is tested/guaranteeed to work on **Ubuntu 22.04**. (and partially on **CentOS 8**)

This project strives to be an ever-improving reference of best-practices
for scripting with Bash and Unix-based tools.


A hack? ... Perhaps.

As is the combination of energy and magic that powers the personal computer,
and possibly the universe...

But hey, with love and perseverance, it works!

Elegance is not about perfection, but about doing well with what we have.

... Speaking of which. This project is in dire need of tests.
But you can examine the results of script actions in the logs, which are placed in `/var/log/setup`.

Documentation is WIP. But you're encouraged to explore the code, which aims
to be as self-documenting as possible.


Contributions welcome.


## Requirements

- A machine with SSH, Bash 4.4+ or ZSH, sed, grep
- SSH access to server or VM running Ubuntu LTS (for remote setup), or run locally with `--local`

## Instructions

1. Clone this project directory
2. In the shell, `cd` into the root of this project
3. Have your SSH authorized keys for the server in a file somewhere. Let's say `~/tmp/authorized_keys`, for example.
4. Then execute (or place into a script):
	```
	# Specify domain name or IP address of target server (required)
	host=localhost

	# Specify value of SSH authorized_keys to transfer (optional; default='')
	authorized_keys=$(cat ~/tmp/authorized_keys)

	# Specify SSH Port (optional; default: 22)
	port=22

	# Specify login user (optional; default: root)
	user=root

	# Specify ssh_key for connection to host (optional; default: ~/.ssh/id_rsa)
	ssh_key=~/.ssh/id_rsa

	# Specify username of newly created user (optional; default: smith)
	new_user=ada

	# Execute
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

### Local Setup

To run the setup script directly on the local machine (without SSH):
```
authorized_keys=$(cat ~/.ssh/authorized_keys); new_user=bob; ./setup-server --local -k "$authorized_keys" -n "$new_user"
```

## Testing

Scan a server's logs for errors via:
```
## Direct SSH command
ssh $user@$host "grep -r -i 'error[:!]' /var/log/setup"
```
OR
```
## Script provided by library (abstracts away command)
./remote/run-sbin $user@$host scan-logs-for-errors /var/log/setup
```

## Homework Test

1. What happens when you run the command, but `~/tmp/authorized_keys` doesn't exist?


## Notes

