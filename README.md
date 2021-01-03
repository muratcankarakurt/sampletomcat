# Create a CI/CD pipeline for sample application

This tutorial includes helm and jenkins scripts to do the following operations:
- Building a docker image for [tomcat sample application](https://tomcat.apache.org/tomcat-8.0-doc/appdev/sample/)
- Deploying built image to an EKS Cluster using the custom helm chart.

> Assuming that you have accounts on Github, DockerHub and AWS.

## Prerequisites

Following tools must be installed on your environment:
- kubectl
- helm

You can simply install these tools on macOS with Homebrew:
> brew install kubernetes-cli helm

If you are not coming from my another tutorial [Create an EKS Cluster and a Jenkins Server with Terraform and Helm](https://github.com/muratcankarakurt/terraform), you will be needed to run following command to create a service account on EKS with sufficient permissions. If you do not have an EKS cluster yet, please follow the steps in the link to create it easily.
```console
kubectl apply -f helm-user-rbac.yaml
```

### Creating a DockerHub Access Key
```
Account Settings -> Security -> New Access Token
Enter a description in the prompted screen and click create.
```
### Creating a Github SSH Key
```console
# Generate SSH Keys
ssh-keygen -t rsa -f keyfile
```
Paste the content of keyfile.pub in the [menu](https://github.com/settings/ssh/new)

## Jenkins Configurations
```
Dashboard -> Manage Jenkins -> Manage Credentials -> Jenkins -> Global -> Add Credentials
```

| Key    | Value                           | 
| -------| --------------------------------|
| Kind   | Secret text                     | 
| Scope  | Global                          | 
| Secret | -docker hub secret you created- | 
| ID     | eks-dockerhub-secret            | 

| Key         | Value                          | 
| ------------| -------------------------------|
| Kind        | SSH Username with private key  | 
| Scope       | Global                         | 
| ID          | tomcat-sample-github-key       | 
| Private Key | -use the generated keyfile-    | 


```
Dashboard -> New Item -> Multibranch Pipeline
Give a name to the pipeline. Click Save.
```
| Key                     | Value                                                  | 
| ------------            | -------------------------------                        |
| Branch Sources          | Git                                                    | 
| Project Repository      | git@github.com:muratcankarakurt/sampletomcat.git (SSH) | 
| Behaviours              | Discover branches.                                     | 
| Behaviours (Add)        | Filter by name (with wildcards) / Include: master      | 

