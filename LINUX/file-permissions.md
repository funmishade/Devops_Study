# File Permission

There are different file permissions on linux by default, they can be modified using `chmod` and `chown`

ls -ltr
-/d → - file d directoruy

rw- → owner can read + write

r-- → group can read only

r-- → others can read only

10 characters
first character is file or directory
remaining characters is 3each for user, group, other
r=read
w=write
x=execute
if you see dash it means the right is not given
u = user
g = group user be;png to
o = others

# Managing permissions
chmod u=rwx
chmod o=rwx
chmod u=rwx,g-rwx,o=rwx

numbering format
r=4 , w =2, x=1
total - 7

rwx|rwx|rwx|

task give rx permission to users and groups only

chmod 550
becsause 4+1 = 5 for both user and group


If a file is inside a folder each with different permissions.
Which is applicable?
It’s like you want to access a file in a locker in a bank. You need access to the bank(folder) first before the Afeez’s to the locker. The permission to the folder takes the highest priority

chown - change file ownership