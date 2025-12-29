# Task: Create an AWS EC2 Key Pair using Terraform

## Objective
Securely access EC2 instances via SSH by creating a key pair. This is essential for managing AWS instances safely without using passwords.

## Tools Used
- Terraform
- AWS CLI
- SSH

## Steps Taken

### 1. Generate RSA key pair locally
Run the following command to generate the key pair:
```bash
ssh-keygen -t rsa -b 4096 -f ~/xfusion-kp.pem
Enter a passphrase (optional)

Private key saved as ~/xfusion-kp.pem

Public key saved as ~/xfusion-kp.pem.pub

2. Set proper permissions for the private key
bash

chmod 400 ~/xfusion-kp.pem
3. Verify the key files
bash

ls -l ~/xfusion-kp.pem*
Expected output:

css
-r-------- 1 bob bob 3243 xfusion-kp.pem
-rw-r--r-- 1 bob bob  743 xfusion-kp.pem.pub
4. Upload public key to AWS using Terraform
Create a Terraform configuration:

hcl

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "xfusion" {
  key_name   = "xfusion-kp"
  public_key = file("~/xfusion-kp.pem.pub")
}
5. Apply Terraform configuration
bash

terraform init
terraform apply
Verify that the key pair exists in AWS Console → EC2 → Key Pairs

Challenges & Solutions
Issue: Private key was initially generated without .pem extension.

Solution: Renamed file to xfusion-kp.pem and applied chmod 400 for proper permissions.

Outcome / Result
Key pair successfully created and verified on AWS.

Ready to use for launching and accessing EC2 instances securely via SSH.

Summary
Creating a keypair on aws requires 2 steps, first you create the public and private keys using ssh keygen locally. Then using terraform to upload the keypair to aws is the second step.

refers to the number of bits in the RSA key — basically the key’s size or strength.

Breakdown:

RSA is the encryption algorithm.

-b 4096 tells SSH to generate a 4096-bit key.

Why it matters:

The larger the key, the more secure it is.

Common key sizes:

2048 bits → standard, secure for most uses

4096 bits → very secure, recommended if you want extra protection

Trade-off:

Bigger keys = stronger security

Slightly slower encryption/decryption, but negligible for SSH access

💡 In short: 4096 means this key is extra strong.

If you want, I can explain why people sometimes use 2