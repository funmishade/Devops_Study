
## Concept

Root - administrative access, unrestricted

default user in ec2 instance with ubuntu ami is ubuntu user which is different from the root user

funmi@LAPTOP-361GUSK8:~$
root@ubuntu-dev:/#
user@hostname

Explanation: 
funmi/root - user which is loggedin
LAPTOP-361GUSK8/ubuntu-dev - Hostname 
: - separator
/ - path or present working directory


The difference between ~ and / in lines 11 and 12

 - The ~ represents the current users home directory 
 - The ~ is a shortcut for the full path to the home folder of the current user
Examples:
    (1) funmi@LAPTOP-361GUSK8:~$ - ~ here means /home/funmi

- The / is the root 
- To go to the root directory of the file system cd /


## Folders in Linux

1. Sbin - System Binaries - System Binaries are commands found in the folder that a Linux administrator can use to grant administrative rights
2. bin -Binaries - are commands used to grand nonadministrative rights
3. usr - user installed applications - The sbin and bin are found in the parent folder called /usr. 
4. boot -are commands used in starting/booting the linux  system
5. srv - configuration files for server, by default empty
6. opt - third party tools and dependencies should be stored in /opt
7. mnt - mount - used to mount new volumes new disk
8. var - fstores logs, caches and temporary files
9. opt - for installing optional third party sofetware
10. home - default location for user home directories
11. tmp - for temporary files cleared on reboot
12. run - runtime data for processes
13. root - home directory of the root
14. etc - all system configuration files e.g settings on phone

home directory of ubuntu is /home/ubuntu
home directory of funmi is /home/funmi
home directory of root is /root

echo $PATH

## Key Commands / Syntax


## Example
## Takeaway


## New Learnings



## Questions

## Linux Basics — Notes 


Root – administrative access, unrestricted.

The default user in an EC2 instance with Ubuntu AMI is usually ubuntu, which is different from root.

funmi@LAPTOP-361GUSK8:~$       # regular user
root@ubuntu-dev:/#               # root user
user@hostname                    # general format


Explanation:

funmi/root → the user that is currently logged in

LAPTOP-361GUSK8/ubuntu-dev → hostname

: → separator

/ → present working directory

Difference between ~ and /:

## Symbol	Meaning	Example
~	Shortcut for current user’s home directory	funmi@LAPTOP-361GUSK8:~$ → /home/funmi
/	Root of the filesystem	cd / → go to root directory

## Important Folders in Linux
Folder	Purpose
/sbin	System binaries — commands for administrative tasks
/bin	Binaries — commands for non-administrative users
/usr	User-installed applications; contains /usr/bin and /usr/sbin
/boot	Files needed for booting the Linux system
/srv	Server configuration files (default usually empty)
/opt	Optional third-party tools and dependencies
/mnt	Mount point for external volumes or disks
/var	Stores logs, caches, and temporary files
/home	Default location for user home directories
/tmp	Temporary files cleared on reboot
/run	Runtime data for processes
/root	Home directory for the root user
/etc	System configuration files

## Home directories:

Ubuntu default: /home/ubuntu

User funmi: /home/funmi

Root user: /root

Check your current path:

echo $PATH

## Key Commands / Syntax

(You can expand this section with your notes later)

Examples / Takeaways

cd ~ → go to your home directory

cd / → go to root directory

ls /bin → list binaries for non-admin users

ls /sbin → list binaries for admin tasks

New Learnings / Practical Exercises (WSL)

Since you’re on WSL, you can try these practical checks:

Check current user

whoami


Check hostname

hostname


See home directory

echo $HOME


List root directory contents

ls /


Check PATH variable

echo $PATH


Navigate between directories

cd /tmp
pwd
cd ~
pwd


Check which binaries are available

ls /bin
ls /sbin


Check free disk space (practical WSL check)

df -h

Questions / Did I Miss Anything?

I covered most of the basic Linux filesystem structure and key commands.

Practical checks in WSL help reinforce understanding.

Optional: You can also document file permissions with ls -l and process info with ps aux for a more hands-on approach.


Linux Basics — Notes
Concept

Root – administrative access, unrestricted.
The default user in an EC2 instance with Ubuntu AMI is usually ubuntu, which is different from the root user.

Examples:

funmi@LAPTOP-361GUSK8:~$      # regular user
root@ubuntu-dev:/#            # root user
user@hostname                 # general format

Explanation

funmi/root → user that is logged in

LAPTOP-361GUSK8/ubuntu-dev → hostname

: → separator

/ → present working directory

Difference Between ~ and /
Symbol	Meaning	Example
~	Shortcut for current user’s home directory	funmi@LAPTOP-361GUSK8:~$ → /home/funmi
/	Root of the filesystem	cd / to go to root
Folders in Linux
Folder	Purpose
/sbin	System binaries (admin commands)
/bin	Binaries for non-admin users
/usr	User-installed apps (/usr/bin, /usr/sbin)
/boot	Files used in booting Linux
/srv	Server configuration files (often empty)
/opt	Third-party apps and dependencies
/mnt	Mount point for external disks
/var	Logs, caches, temp data
/home	Home directories for normal users
/tmp	Temporary files (cleared on reboot)
/run	Runtime process data
/root	Home directory for the root user
/etc	System configuration files
Home Directories

Ubuntu default user → /home/ubuntu

User funmi → /home/funmi

Root → /root

Check your current PATH:

echo $PATH

Key Commands / Syntax (Add more as you learn)
cd ~          # go to home directory
cd /          # go to root directory
ls /bin       # list non-admin binaries
ls /sbin      # list admin binaries

Practical WSL Exercises

Try these in your WSL terminal:

User & environment
whoami
hostname
echo $HOME

Explore the filesystem
ls /
ls /bin
ls /sbin
ls /etc

Check disk and paths
echo $PATH
df -h

Navigation practice
cd /tmp
pwd
cd ~
pwd

Extra useful checks
ls -l        # file permissions
ps aux       # running processes

Takeaways / New Learnings

Write your reflections here each time:

What I learned today:

Commands that stood out:

Where I got confused:

What I want to practice next:

Questions

Did I miss anything?

Any folder you want to explore deeper?

Should I add permissions, processes, or services next?

0000000000000000000000000000000000000000000000000
# Linux Basics — Notes

## Concept

Root = administrative, unrestricted access.

The default user in an EC2 instance with Ubuntu AMI is **ubuntu**, which is different from **root**.

Examples of prompts:

funmi@LAPTOP-361GUSK8:~$ # regular user
root@ubuntu-dev:/# # root user
user@hostname # general format

yaml
Copy code

### Explanation

- **funmi / root** → the user that is logged in  
- **LAPTOP-361GUSK8 / ubuntu-dev** → hostname  
- **:** → separator  
- **/** → present working directory  

---

## Difference Between `~` and `/`

| Symbol | Meaning | Example |
|--------|---------|---------|
| `~` | Shortcut for current user's home directory | `funmi@LAPTOP-361GUSK8:~$` → `/home/funmi` |
| `/` | Root of the filesystem | `cd /` goes to the root directory |

---

## Folders in Linux

| Folder | Purpose |
|--------|---------|
| /sbin | System binaries (admin commands) |
| /bin | Binaries for non-admin users |
| /usr | User-installed apps (`/usr/bin`, `/usr/sbin`) |
| /boot | Files needed for booting Linux |
| /srv | Server configuration files (often empty) |
| /opt | Third-party apps & dependencies |
| /mnt | Mount point for external disks |
| /var | Logs, caches, temp files |
| /home | Home directories for normal users |
| /tmp | Temporary files (cleared on reboot) |
| /run | Runtime process data |
| /root | Home directory for the root user |
| /etc | All system configuration files |

---

## Home Directories

- Ubuntu default user → `/home/ubuntu`
- User funmi → `/home/funmi`
- Root user → `/root`

Check your PATH:

echo $PATH

yaml
Copy code

---

## Key Commands / Syntax

cd ~ # go to your home directory
cd / # go to root directory
ls /bin # list non-admin binaries
ls /sbin # list admin binaries

yaml
Copy code

---

## Practical WSL Exercises

### User & Environment

whoami
hostname
echo $HOME

shell
Copy code

### Explore the Filesystem

ls /
ls /bin
ls /sbin
ls /etc

shell
Copy code

### Check Disk and Paths

echo $PATH
df -h

shell
Copy code

### Navigation Practice

cd /tmp
pwd
cd ~
pwd

shell
Copy code

### Extra Useful Checks

ls -l # file permissions
ps aux # running processes

yaml
Copy code

---

## Takeaways / New Learnings
Write your reflections here:

- What I learned today:
- Commands that stood out:
- Where I got confused:
- What I want to practice next:

---

## Questions

- Did I miss anything?
- Any folder you want to explore deeper?
- Should we add permissions, processes, or services next?
✅ This version WILL render perfectly on GitHub
Because:

✔ Proper Markdown tables
✔ Blank lines added where GitHub requires
✔ Code blocks fenced with triple backticks
✔ Clean headings
✔ No broken formatting

