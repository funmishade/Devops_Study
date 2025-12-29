## Concept
IAM solves the problem of authentication and authorisation.
You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources. 
IAM allows you to assign granular permissions, enabling you to control exactly what actions different users can perform on specific resources.

Multi-factor authentication (MFA) - With MFA you or your users must provide not only a password or access key to work with your account, but also a code from a specially configured device.

Identity federation - You can allow users who already have passwords elsewhere—for example, in your corporate network or with an internet identity provider—to access your AWS account.


Users - can be human / service account
-Root users
-Federated principal - managed by another identity provider, such Okta.| Temporary credential
-IAM Users - created by root user by default without permission
-Users in AWS IAM Identity Center directory(not federated)– Users created directly in the IAM Identity Center default directory sign in(used in managing work force)
-
Policies - what users can do | 7 types
- identity bssed policy
    - managed (aws managed/customer managed) | standalone, add to many entities
    - inline | add directly to entity as per 1:1 relationship 
Resource-based policies – Attach inline policies to resources. e.g s3 bucket
Groups - dev, QA,dbadmin, others - makes group easier
Roles - temporary, similar to usergroup but created for temporary users.

## Key Commands / Syntax
## Example
## Takeaway
IAM Cost is a free aws service

## New Learnings
- federated users and users created under iam identity centre
- Temporary credentials should be assigned to these two as well as ROLES

## Cross account access


## Questions
1. A user can login and access an aws service but cannot carry out a task, what could be the issue?
Authentication has been given, hence access to login, but werethey given any permission? As a devops engineer, i will check if permissions has been given