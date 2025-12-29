# 📌 DevOps Error & Troubleshooting Notes

This document summarizes **common errors** encountered in DevOps projects, the root causes, and how to prevent them. Use it as a personal reference and cheat sheet.

---

## 1️⃣ VPC Blackhole (AWS Networking Issue)

### **Scenario**
Some EC2 instances or services within a VPC could **not reach each other** or the **internet**, causing traffic to “disappear.”  

---

### **Why it happens**
- **Route table misconfiguration**: Subnets missing a route to the Internet Gateway (IGW) or NAT Gateway.  
- **Missing routes**: Private subnets require NAT to access the internet.  
- **Security groups / NACLs**: Firewall rules blocking traffic.  
- **Overlapping CIDR blocks**: Confusing routing for AWS.  

---

### **How to prevent**
1. **Plan your VPC carefully**: define subnets, CIDR blocks, and purposes (public/private).  
2. **Associate route tables correctly**:
   - **Public subnets** → Internet Gateway (IGW)  
   - **Private subnets** → NAT Gateway for outbound internet access  
3. **Check security groups and NACLs** to allow required traffic.  
4. Use **VPC Reachability Analyzer** to verify connections before launching workloads.  
5. **Document your network design**: which subnets host which services.

---

## 2️⃣ GitLab SHA-256 Mismatch Error

### **Scenario**
While pushing/pulling from GitLab:



The local repository cannot communicate with GitLab.

---

### **Why it happens**
- **Global Git version** supports SHA-256 ✅  
- **Local repository** was created with SHA-1 ❌  
- Git **cannot convert SHA-1 repos to SHA-256** automatically  
- All push/pull operations fail because the hashing algorithms differ.

---

### **How to prevent**
1. **Always create new GitLab repos empty** (do not initialize with README)  
2. **Enable SHA-256** when creating the repo in GitLab UI  
3. **Clone fresh** rather than reusing old SHA-1 repos  
4. Keep Git **up-to-date**, though the main issue is repo format, not Git version

---

## 🧠 **Quick Takeaways**

| Error / Scenario | Cause | Solution | Prevention |
|-----------------|-------|---------|------------|
| VPC Blackhole | Misconfigured route tables, missing NAT, security blocks, overlapping CIDRs | Fix route tables, check SG/NACLs, add NAT for private subnets | Plan subnets & routes carefully, use Reachability Analyzer |
| GitLab SHA-256 mismatch | Local repo created with SHA-1 | Clone fresh from GitLab, commit & push | Always create new repos empty, enable SHA-256, avoid reusing old SHA-1 repos |

---

> **Tip:** Maintaining an error log like this helps track **lessons learned** and prevents repeating the same mistakes.


so whats the essense of this step

Great question — this is exactly the right moment to ask it.
Let me explain the essence in plain DevOps terms, not commands.

🧠 What is the essence of the NGINX step?
Short answer:

NGINX makes SonarQube reachable, reliable, and production-ready for CI/CD tools like GitLab.

🔴 The real problem you had (simplified)

SonarQube runs on port 9000

Your browser could reach it

GitLab CI could NOT

CI traffic is stricter than browsers

Non-standard ports like 9000 are often blocked

So even though you could see SonarQube:
❌ GitLab pipeline could not talk to it

🟢 What NGINX actually does here

NGINX acts as a reverse proxy:

GitLab CI  ──►  Port 80 (NGINX)  ──►  Port 9000 (SonarQube)

In simple words:

GitLab talks to NGINX

NGINX forwards traffic to SonarQube

SonarQube never talks directly to the internet

🎯 Why this step is important (the essence)
1️⃣ Standard ports (80 / 443)

CI systems always allow:

HTTP → 80

HTTPS → 443

They may block:

9000

8080

3000

NGINX fixes this.

2️⃣ Production-grade architecture

In real companies:

SonarQube is never exposed directly

It’s always behind:

NGINX

ALB

Ingress Controller

So this step shows real-world DevOps design, not a demo setup.

3️⃣ Security

Without NGINX:

Internet ──► SonarQube JVM (9000)


With NGINX:

Internet ──► NGINX ──► SonarQube


Benefits:

You can add HTTPS

Rate limiting

IP restrictions

Authentication

4️⃣ CI/CD reliability

Before:

Pipeline ❌ randomly times out

After:

Pipeline ✅ stable

Quality Gate works

No flaky builds

This is huge in interviews.

🧩 Why this matters to YOUR project

Your project is no longer:

“I installed SonarQube”

It is now:

“I integrated SonarQube into a CI/CD pipeline using a reverse proxy for secure and reliable access.”

That’s senior-level wording.

🗣️ Interview-ready explanation (memorize this)

“We placed SonarQube behind NGINX to expose it over standard HTTP/HTTPS ports. This ensured reliable connectivity from GitLab CI runners, improved security, and aligned the setup with production-grade DevOps practices.”

🏁 What this step unlocked

Now you can:

✅ Enforce Quality Gates

✅ Add HTTPS later

✅ Add multiple services behind NGINX

✅ Use the same pattern for Jenkins, apps, APIs