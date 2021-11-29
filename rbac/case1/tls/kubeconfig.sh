
kubectl config set-cluster kubernetes \
  --certificate-authority=/etc/kubernetes/pki/ca.crt \
  --embed-certs=true \
  --server=https://192.168.40.50:6443 \
  --kubeconfig=aliang.kubeconfig
 
# 设置客户端认证
kubectl config set-credentials aliang \
  --client-key=aliang-key.pem \
  --client-certificate=aliang.pem \
  --embed-certs=true \
  --kubeconfig=aliang.kubeconfig

# 设置默认上下文
kubectl config set-context kubernetes \
  --cluster=kubernetes \
  --user=aliang \
  --kubeconfig=aliang.kubeconfig

# 设置当前使用配置
kubectl config use-context kubernetes --kubeconfig=aliang.kubeconfig
