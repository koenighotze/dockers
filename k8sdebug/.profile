
K8S_SERVICEACCOUNT_DIR=/var/run/secrets/kubernetes.io/serviceaccount
if [ -d "${K8S_SERVICEACCOUNT_DIR}" ]; then
  export CURL_CA_BUNDLE="${K8S_SERVICEACCOUNT_DIR}/ca.crt"
  export TOKEN=$(cat "${K8S_SERVICEACCOUNT_DIR}/token")
  export BEARER_HEADER="Authorization: Bearer ${TOKEN}"

  export K8S_API=https://kubernetes.default
fi

