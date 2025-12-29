
.gitlab-ci.yaml - in gitlab
jenkinsfile - in jenkins
workflows folder - in github actions

gitlab managed runners uses ruby image to start the container 

organisations dont use shared runners. they configure their own Project Runners

to configure Project runners
create an ec2 instance
t2medium
ubuntu
SG
80 http,443 https,9000 sonarqube

why use docker executors/agents instead of a vm
security
no need for configuration always
you use only one vm to spin many containers

installations in ec2
1 docker - bcos we need a docker executor
sonarqube

login to sonarqbe and under security create the token
why am i creating a token in sonarqube
bcos in the ci step we are aksing sonarqube to perform codescanning/analysis on our code, hence it needs access to the code pm instance
store the securituy codegenerated on docker in gitlab as a secret


stages
entire ci pipeline is not built in on piece, their are pieces

build - using maven i will build a jar file
testing - test the application that cde change doesnt diturb exiting unit test
sonarqube - where i pass application to sonar, execute static code anaylsis steps 

configure gitlab runner using instalation steps under gitlab setting cicd runners
figma
