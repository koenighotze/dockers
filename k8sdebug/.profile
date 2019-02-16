
K8S_SERVICEACCOUNT_DIR=/var/run/secrets/kubernetes.io/serviceaccount
if [ -d "${K8S_SERVICEACCOUNT_DIR}" ]; then
  export CURL_CA_BUNDLE="${K8S_SERVICEACCOUNT_DIR}/ca.crt"
  export TOKEN=$(cat "${K8S_SERVICEACCOUNT_DIR}/token")
  export BEARER_HEADER="Authorization: Bearer ${TOKEN}"
  export NS=$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace)

  export K8S_API=https://kubernetes.default

  API_SERVER="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT"
  CA_CRT="/var/run/secrets/kubernetes.io/serviceaccount/ca.crt"

  ./kubectl proxy --server="$API_SERVER" --certificate-authority="$CA_CRT" --token="$TOKEN" --accept-paths='^.*' &

  echo "Kube proxy is running at localhost:8001"
fi

