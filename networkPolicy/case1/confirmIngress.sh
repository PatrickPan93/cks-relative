#!/bin/bash
kubectl create namespace test
kubectl run centos --image=centos -n test -- sleep 12h
kubectl run centos --image=centos -- sleep 12h
kubectl run web --image=nginx:1.18.0 -n test

while [ $(kubectl get pod | grep centos | grep Running | wc -l) -lt 1 ] && [ $(kubectl get pod -n test | grep -E 'centos|web'| grep Running | wc -l) -lt 2 ]
do
    sleep 1
    echo "waiting pod ready"
done
sleep 1
webIP=$(kubectl get pod -n test -o wide | grep web | awk '{print $6}')
# 测试外部pod访问
echo ${webIP} | xargs kubectl exec centos -- curl --connect-timeout 3

# 测试内部（same namespace）访问
echo ${webIP} | xargs kubectl exec centos -n test -- curl --connect-timeout 3

kubectl delete pod centos
kubectl delete pod centos -n test
kubectl delete pod web -n test
