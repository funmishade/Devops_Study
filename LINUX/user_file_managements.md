# Linux User Management & SSH Notes

---

## Concepts Covered
- Create Users
- Set up passwords
- Login as individual users
- Groups

---

## User Management Tips
- Come up with a **naming convention** to create unique names
- Grant **permissions as per task**

---

## User Management Files
- **`/etc/shadow`** — secret credentials of created users go here  
- **`/etc/passwd`** — user account info  
- **`/etc/gshadow`** — group secret info  
- **`/etc/gpasswd`** — group info  

### Example: `/etc/passwd`

```bash
cat /etc/passwd
blessed:x:1001:1001::/home/blessed:/bin/sh
Meaning of fields:

Field	Meaning
blessed	username
x	password stored in /etc/shadow
1001	user ID (regular user)
1001	group ID
(empty)	no extra user info
/home/blessed	home directory
/bin/sh	default login shell

Managing User Passwords
Set/change password:

bash
Copy code
passwd username
Enforce password expiration:

bash
Copy code
chage -M 90 username
Lock account:

bash
Copy code
passwd -l username
Unlock account:

bash
Copy code
passwd -u username
Delete a user:

bash
Copy code
userdel username
Managing Groups
Groups help manage users with shared permissions.

Create a new group:

bash
Copy code
groupadd devops
See created groups:

bash
Copy code
cat /etc/group
Add a user to a group:

bash
Copy code
usermod -aG groupname username
How to Connect to a Linux Server Using SSH
<details> <summary>Click to expand SSH explanation</summary>
1️⃣ SSHD — Server-side
SSHD = Secure Shell Daemon

Runs by default on Linux servers

Allows secure remote login

Without SSHD, SSH connection fails

2️⃣ SSH Client — Your side
Installed on your laptop or WSL

Examples:

Linux/macOS → ssh (pre-installed)

Windows → Git Bash, PuTTY, OpenSSH

3️⃣ Connection workflow
SSH client runs on your laptop

Connects to Linux server via port 22

Authenticates you via:

Password

SSH key pair

Once authenticated → remote shell

4️⃣ Example
bash
Copy code
ssh funmi@<public_ip>
</details>
File Management Basics
mkdir → create directory

cp → copy files

touch → create file

mv → move/rename files

cat filename → view file contents

Vim Management
Insert mode → type/edit text

Command mode → run commands (:wq, :q!)

Default mode → normal navigation

Jump to line:

vim
Copy code
:0   # go to line 0
:400 # go to line 400
Key Commands / Syntax
whoami → show current user

su - funmi → switch user

New Learnings
useradd is useful for scripts (no interactive prompts)

shadow- is a backup of /etc/shadow

Questions
What is the difference between adduser and useradd?

If a user forgets the password, can the Linux administrator retrieve it?

Where are passwords stored?

Where is the folder/path to see the users?

How do you delete a user?

How do you create a user?

How do you create a user without a home directory?

Takeaways
Linux separates user info (/etc/passwd) from passwords (/etc/shadow) for security.

SSH allows secure remote login using password or key-based authentication.

Groups make permission management easier.

Always check permissions and ownership when managing users or files.

yaml
Copy code

---

## Concepts Covered
- Create Users
- Set up passwords
- Login as individual users
- Groups

# User Management Tips
- Come up with a naming convention to create unique names
- Grant permissions as per task

# User Management files
- /etc/shadow - secretn credentials of created user goes in here
- /etc/passwd
- /etc/gshadow
- /etc/gpasswd

`cat /etc/passswd`
blessed:x:1001:1001::/home/blessed:/bin/sh

Meaning:

blessed → username

x → password stored in /etc/shadow

1001 → user ID (regular user)

1001 → group ID

(empty) → no extra user info

/home/blessed → home directory

/bin/sh → default login shell

# Managing User Passwords
To set or change a user's password
passwd username

# Enforcing Password Policies
For password expiration - change a user's password
`chage -M 90 username`

To lock a user account
`passwd -l username`

To unlock a user account
`passwd -u username`

To delete a user
`userdel username`

# Managing Groups
We need groups to manage userswith same permission at the group level

- create a new group
`groupadd devops`

to see the created group
`cat /etc/group`

to add a user to a group
usermod 

How to Connect to a Linux Server Using SSH
1️⃣ SSHD — the server-side

SSHD stands for Secure Shell Daemon.

It’s a service (process) running on the Linux server by default.

Its job: allow remote users to log in securely.

Without SSHD running on the server, you cannot connect via SSH.

2️⃣ SSH Client — your side

On your personal laptop, you need an SSH client.

This is software that talks to the SSHD service on the server.

Examples:

Linux/macOS → ssh is already installed in the terminal.

Windows → Popular choices:

Git Bash (includes ssh)

PuTTY

Windows Terminal / OpenSSH

3️⃣ How the connection works

SSH client runs on your laptop.

SSH client connects to Linux server via port 22 (default).

SSH client authenticates you:

With password

Or SSH key pair

Once authenticated, you get a remote shell on the server.


how to `ssh username@public ip`

ssh funmi@32.14.55.22
- 
# File Management
mkdir
copy
toich
mv
complete aall

# Vim Management
Insert mode
command mode
default mode

escape :0 - takes you to line 0
escape :400 - takes you to line 400

cat funmi.txt

## Key Commands / Syntax

- `whoami`
- `su - funmi`
## Example
## Takeaway



## New Learnings
- useradd is useful when writing scripts bcos you dont want prompt to ask input
- There is a shadow file and shadow- file, shadow- is the backup file of shadow incase it gets corrupt.

## Questions
- What is the difference between `adduser` and `useradd`
- if a user forgets the password, can the linux administrator see the password and retrieve it?
- where is the path/folder to see the passwords?
- where is the folder/path to see the users
- How do you delete the user
- how do you create a user
- if you want to create a user without an home directory what should you do?