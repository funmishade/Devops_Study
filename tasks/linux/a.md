# Task 1 – Creating a Non-Interactive User on App Server 1

## 🎯 Objective
Create a new user named `mark` on App Server 1 with a **non-interactive shell** to prevent SSH logins, following best practices for service/non-login accounts.

---

## 📖 Task Description
Create a user on App Server 1 that **cannot log in interactively**.  
This is commonly required for **service accounts** or **automation users** in DevOps environments.

---

## 🛠️ Implementation Steps

### 1. SSH to App Server 1
```bash
ssh tony@172.16.238.10
Replace tony and 172.16.238.10 with your actual username and server IP.

Verify you are on the correct server:

bash
Copy code
hostname
2. Create the non-interactive user
bash
Copy code
sudo adduser -s /sbin/nologin mark
-s /sbin/nologin ensures the user cannot log in interactively.

3. Verify the user was created
bash
Copy code
id mark
grep mark /etc/passwd
✅ Lessons Learned
Always confirm the hostname or IP before making server changes.

Non-interactive shells prevent login but allow the user to exist for ownership or automation tasks.

SSH requires the actual IP or hostname, not descriptive names like “App Server 1”.

⚠️ Notes
This user cannot log in via SSH or terminal.

Automated tasks requiring this user need careful permission management.

Task 2 – Creating a User with Expiry on App Server 1
🎯 Objective
Create a user named kirsty with a password expiry date of 2024-11-03.

🛠️ Implementation Steps
1. Add user with expiry
bash
Copy code
sudo useradd -e 2024-11-03 kirsty
2. Verify expiry date
bash
Copy code
chage -l kirsty
The expiry date should show 2024-11-03.

✅ Notes
The user will become inactive after the specified expiry date.

Useful for temporary accounts or contractor access.

yaml
Copy code

---