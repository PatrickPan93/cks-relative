#!/bin/bash
kubectl apply -f privileged-pod.yaml --as=system:serviceaccount:staging:psp-denial-sa -n staging
