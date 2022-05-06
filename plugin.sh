#!/bin/sh
set -xv
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "${GITOPS_SSHKEY}" | base64 -d > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
git config user.email ${GITOPS_EMAIL}
git config user.name ${GITOPS_NAME}
git clone ${GITOPS_URL} GitOps --config core.sshCommand="ssh -i ~/.ssh/id_rsa"
cd GitOps/${GITOPS_DIRECTORY}
`${KUSTOMIZE_COMMAND}`
git add .
git commit -m "${GITOPS_COMMIT}"
git push 