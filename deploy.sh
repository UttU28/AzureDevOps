#!/bin/bash
az group create --name DevOpsRG --location westus
az containerapp env create --name aca-environment --resource-group DevOpsRG --location westus
az containerapp create --name album-backend-api --resource-group DevOpsRG --environment aca-environment --image mcr.microsoft.com/azuredocs/containerapps-helloworld:latest --target-port 80 --ingress 'external'
az group show --name DevOpsRG --query id -o tsv
# Use the above data in the below, use RBAC to set the role as contributor for that suscription
az ad sp create-for-rbac -n "spn-aca-azure-pipelines" --role Contributor --scope /subscriptions/fb03483b-eece-41f0-8fca-b16b9e75cb43/resourceGroups/DevOpsRG

# {
#   "appId": "98b5470b-3433-41fe-ac3a-75efc00e45555560e",
#   "displayName": "spn-aca-azure-pipeli55555nes",
#   "password": "U258Q~-dCHBIiPjZXGsVKsWKCOPlaLPH6JhLW55555btF",
#   "tenant": "a8d3e12a-a4f9-47c3-b7bd-0f18f50c555554713"
# }