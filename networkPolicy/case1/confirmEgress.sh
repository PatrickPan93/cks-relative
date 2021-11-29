#!/bin/bash
# busybox因为规则无法访问外部
kubectl create namespace test
kubectl run busybox --image=busybox -n test -- sleep 12h
kubectl exec busybox -n test -- ping baidu.com
kubectl delete pod busybox
