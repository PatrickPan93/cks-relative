#!/bin/bash
kubectl get pod -o yaml | grep -w serviceAccount: | awk -F ':' '{print $2}' | uniq
