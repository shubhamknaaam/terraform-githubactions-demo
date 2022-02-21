# Terraform Github Actions Demo for BHS Assessment

This repository contains Terraform configuration and Github Action workflow 

## USE CASE

 - Create a Github repo
 - Use Github Actions 
 - SP-SECRETS - Your teammates should be able to work on the infrastructure components simultaneously
                    
                'Do not use your own Azure user for rollout, use a dedicated one'
      Terraform - for provisioning infrastructure in Azure
      Provision a virtual machine (Ubuntu)
      Create network
      Add a public IP
       Create your own ssh key and add it for accessing the machine
          Make the access secure

 - Ssh into the machine
      Install docker 
      Start an Nginx container and add your own page
      The content of the page should be: Hello BHS!
      Assign a DNS name so the page is public reachable
      Call the page in a browser
 
## Prerequisites

* Azure Account.
* GitHub Account

### Setup & Explanation

*   Repo Structure
```
.
├── README.md
└── .github/workflows
|   └── terraform-workflow.yml
├── terraform
│   ├── backend.tf
│   ├── dns.tf
│   ├── main.tf
│   ├── network.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   ├── variables.tf
│   └── vm.tf
└── variables
    ├── dev
    │   └── backend.tfvars
    └── uat
        └── backend.tfvars

```
*	GitHUb
		Branching Strategy 			
			Main, Develop, feature/feature1, 
			Pull requests 
				Feature/f1 > Dev 
				Dev > Main
*	Azure -
		Backend handling - Storage a/c / Container / env / $env / .tfstate
		KV / secrets - For Secure connectivity
		

### GitHub Configuration

APP ID Generaton using SP

Secrets - SP configurations within Repo against Cloud Subscription 
```
Add 4 secrets

    AZURE_AD_CLIENT_ID 
    AZURE_AD_CLIENT_SECRET 
    AZURE_AD_TENANT_ID 
    AZURE_SUBSCRIPTION_ID
```
Terraform as IaaC
GitHub Action Workflows - for Terraform Deployment

## Status
```
DONE      Create a Github repo
DONE      Use Github Actions 
DONE      SP-SECRETS - Your teammates should be able to work on the infrastructure components 
          simultaneously. Do not use your own Azure user for rollout, use a dedicated one
DONE      Terraform - for provisioning infrastructure in Azure
DONE      Provision a virtual machine (Ubuntu)
DONE      Create network
DONE      Add a public IP
DONE       Create your own ssh key and add it for accessing the machine
          Make the access secure

DONE      Ssh into the machine
DONE      Install docker 
DONE      Start an Nginx container and add your own page
DONE      The content of the page should be: Hello BHS!
DONE      Assign a DNS name so the page is public reachable
DONE      Call the page in a browser
```
