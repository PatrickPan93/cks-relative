from kubernetes import client, config

with open('/var/run/secrets/kubernetes.io/serviceaccount/token') as f:
     token = f.read()

configuration = client.Configuration()
configuration.host = "https://kubernetes"  # APISERVER地址
configuration.ssl_ca_cert="/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"  # CA证书 
configuration.verify_ssl = True   # 启用证书验证
configuration.api_key = {"authorization": "Bearer " + token}  # 指定Token字符串
client.Configuration.set_default(configuration)
apps_api = client.AppsV1Api() 
core_api = client.CoreV1Api() 
try:
  print("###### Deployment列表 ######")
  #列出default命名空间所有deployment名称
  for dp in apps_api.list_namespaced_deployment("default").items:
    print(dp.metadata.name)
except:
  print("没有权限访问Deployment资源！")

try:
  #列出default命名空间所有pod名称
  print("###### Pod列表 ######")
  for po in core_api.list_namespaced_pod("default").items:
    print(po.metadata.name)
except:
  print("没有权限访问Pod资源！")

