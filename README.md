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
```
Click here to open the [menu](https://github.com/settings/ssh/new)
```
