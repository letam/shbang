# Shbang

💥 "It all started with a shell..."

Shbang is a library of scripts to orchestrate the deployment of secure,
production-ready applications on Linux servers, via Linux commands and Bash
scripts.

So far, it's tested/guaranteeed to work on **CentOS 8** and **Ubuntu 18.04**

It also strives to be a reference of best-practices for scripting with Bash and
Unix-based tools.


A hack? ... Perhaps.

As is the combination of energy and magic that powers the personal computer,
and possibly the universe...

But hey, with love and perseverance, it works!

Elegance is not about perfection, but about doing well with what we have.

... Speaking of which. This project is in dire need of tests.
And documentation. Coming soon!


Contributions welcome.


## Requirements

- A machine with SSH, Bash 4.4+, sed, grep
- SSH access to server or VM running either CentOS 8 or Ubuntu 18.04 LTS

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

