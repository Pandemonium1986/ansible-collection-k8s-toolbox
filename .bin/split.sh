#!/usr/bin/env bash

set -e
#set -x

if [ -z "$1" ]
then
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
else
  CURRENT_BRANCH=$1
fi

function split()
{
  if [[ "$OSTYPE" == "darwin"* ]]; then
    SHA1=$(splitsh-lite-darwin --prefix="$1")
  else
    SHA1=$(splitsh-lite --prefix="$1")
  fi
  git push "$2" "$SHA1:refs/heads/$CURRENT_BRANCH" -f --no-verify
}

function remote()
{
  git remote add "$1" "$2" > /dev/null 2>&1 || true
}

#git pull origin $CURRENT_BRANCH || true

remote ansible-role-helm git@github.com:Pandemonium1986/ansible-role-helm.git
remote ansible-role-k9s git@github.com:Pandemonium1986/ansible-role-k9s.git
remote ansible-role-kubectl git@github.com:Pandemonium1986/ansible-role-kubectl.git
remote ansible-role-kubectx git@github.com:Pandemonium1986/ansible-role-kubectx.git
remote ansible-role-minikube git@github.com:Pandemonium1986/ansible-role-minikube.git
remote ansible-role-stern git@github.com:Pandemonium1986/ansible-role-stern.git

split 'roles/helm' ansible-role-helm
split 'roles/k9s' ansible-role-k9s
split 'roles/kubectl' ansible-role-kubectl
split 'roles/kubectx' ansible-role-kubectx
split 'roles/minikube' ansible-role-minikube
split 'roles/stern' ansible-role-stern
