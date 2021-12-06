#!/bin/bash
echo "modify api-server's config to enable PSP admission controller: PodSecurityPolicy"
echo "1. create psp policy"
echo "2. create clusterrole use psp rule."
echo "3. create sa in staging"
echo "4. create clusterrolebinding with clusterrole created in step2 and sa created in step3"
