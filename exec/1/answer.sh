#!/bin/bash
#1. 先通过kubectl get sa -n xxxx 获取当前命名空间所有的sa

#2. 通过 kubectl get pod -o yaml | grep ${当前命名空间的sa}

#3. 如果有sa没被过滤出来证明该SA没有被使用

#4. 删除无人使用的目标SA

#5. 创建SA

#6. 修改已有Yaml文件并指定该Pod使用刚刚创建的SA

