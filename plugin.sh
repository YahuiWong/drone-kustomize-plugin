#!/bin/sh
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "${PLUGIN_GITOPS_SSHKEY}" | base64 -d > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
git config user.email ${PLUGIN_GITOPS_EMAIL}
git config user.name ${PLUGIN_GITOPS_NAME}
git clone ${PLUGIN_GITOPS_URL} GitOps --config core.sshCommand="ssh -i ~/.ssh/id_rsa"
cd GitOps/kustomize-guestbook
kustomize edit set image gcr.io/heptio-images/ks-guestbook-demo:0.1
git add .
git commit -m 'update'
git push 