# Ansible Collection - k8s toolbox

![Ansible Collection](https://img.shields.io/badge/collection-pandemonium1986.k8s__toolbox-blue?logo=ansible)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-collection-k8s-toolbox.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-collection-k8s-toolbox.svg?logo=github)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This [Ansible Collection](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html) "k8s toolbox" contains roles and playbooks to deploy and configured tools to managed a kubernetes cluster.

## Getting Started

This collection contains the following ressources.

| Ressources                                                                     | Comment                                                                                    | Privilege |                                                    CI Status                                                     |
| :----------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------- | :-------: | :--------------------------------------------------------------------------------------------------------------: |
| **[roles/helm](https://github.com/pandemonium1986/ansible-role-helm)**         | Install helm from the github package and make a symbolic link in /usr/local/bin.           |   true    |   ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-helm/workflows/Molecule/badge.svg)   |
| **[roles/k9s](https://github.com/pandemonium1986/ansible-role-k9s)**           | Install k9s from the github package and make a symbolic link in /usr/local/bin.            |   true    |   ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-k9s/workflows/Molecule/badge.svg)    |
| **[roles/kubectl](https://github.com/pandemonium1986/ansible-role-kubectl)**   | Install kubectl from google repositories (centos, debian, openSUSE supported).             |   true    | ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectl/workflows/Molecule/badge.svg)  |
| **[roles/kubectx](https://github.com/pandemonium1986/ansible-role-kubectx)**   | Install kubectx/kubens from the github package and make a symbolic link in /usr/local/bin. |   true    | ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectx/workflows/Molecule/badge.svg)  |
| **[roles/minikube](https://github.com/pandemonium1986/ansible-role-minikube)** | Install minikube from google repositories (centos, debian, openSUSE supported).            |   true    | ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-minikube/workflows/Molecule/badge.svg) |
| **[roles/stern](https://github.com/pandemonium1986/ansible-role-stern)**       | Install stern from the github package and make a symbolic link in /usr/local/bin.          |   true    |  ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-stern/workflows/Molecule/badge.svg)   |

### Prerequisites

The only prerequisite is to have an [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) >= 2.10

### Installing

```sh
ansible-galaxy collection install pandemonium1986.k8s_toolbox
```

## Deployment

There are no specific prerequisites for the use of the collection.

Simply create a playbook that may be briefly similar to this one :

```yaml
---
- name: K8s Toolbox deployement
  hosts: local
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.k8s_toolbox.minikube
    - import_role:
        name: pandemonium1986.k8s_toolbox.kubectx
    - import_role:
        name: pandemonium1986.k8s_toolbox.k9s
    - import_role:
        name: pandemonium1986.k8s_toolbox.stern
    - import_role:
        name: pandemonium1986.k8s_toolbox.helm
```

Available variables are :

```yaml
helm_cache_path: "/var/cache/github"
helm_installation_path: "/opt/github/helm"
helm_checksum: "sha256:bbb6e7c6201458b235f335280f35493950dcd856825ddcfd1d3b40ae757d5c7d"
helm_version: "v3.13.3"

k9s_cache_path: "/var/cache/github"
k9s_installation_path: "/opt/github/k9s"
k9s_checksum: "sha256:3904f39c9ff4eaedfa35c81e2fa9e42817505375fbbce9932d01bfbc4c2673d8"
k9s_version: "v0.31.5"

kubectl_version: "1.29.0"

kubectx_installation_path: "/opt/github/kubectx"
kubectx_version: "master"

minikube_version: "1.32.0"

stern_cache_path: "/var/cache/github"
stern_installation_path: "/opt/github/stern"
stern_checksum: "sha256:1501989591f7cf9b946ff38c24453cda0c672932acf2271ef6e894f5cfb384ed"
stern_version: "1.28.0"
```

## Contributing

### Pre-commit

I use pre commit to manage the commit-msg commit and pre-push hooks.
To install the hooks proceed as follows

```sh
pre-commit install --hook-type commit-msg && \
pre-commit install --hook-type pre-push && \
pre-commit install
```

### Monorepo

The ansible collections are composed of a set of roles/plug-ins/modules ...
My choice was made to group all the roles in a "monorepo", the collection itself, and to ensure the building of the roles in "manyrepo".

This section is not only aimed at the collection itself, but potentially at all of them.

First of all if you start from a set of roles existing in "manyrepo" you have to group them in the roles directory of the collection.

I use [tomono](https://github.com/hraban/tomono) to create the monorepo from the manyrepos

To generate the monorepo folder (assuming that the user `pandemonium` exists and his homedir is /home/pandemonium):

```sh
mkdir -p ~/git/Pandemonium1986/ansible-collection-k8s-toolbox && git init

git clone https://github.com/hraban/tomono.git ~/git/github/hraban/tomono

vim ~/Documents/workspace/repos.txt

git@github.com:Pandemonium1986/ansible-role-helm ansible-role-helm roles/helm
git@github.com:Pandemonium1986/ansible-role-k9s ansible-role-k9s roles/k9s
git@github.com:Pandemonium1986/ansible-role-kubectl ansible-role-kubectl roles/kubectl
git@github.com:Pandemonium1986/ansible-role-kubectx ansible-role-kubectx roles/kubectx
git@github.com:Pandemonium1986/ansible-role-minikube ansible-role-minikube roles/minikube
git@github.com:Pandemonium1986/ansible-role-stern ansible-role-stern roles/stern

export MONOREPO_NAME=/home/pandemonium/git/Pandemonium1986/ansible-collection-k8s-toolbox
cd / && cat ~/Documents/workspace/repos.txt | /home/pandemonium/git/github/hraban/tomono/tomono.sh --continue
```

To ensure the synchronisation of the manyrepos from the monorepo I use
[splitsh-lite](https://github.com/splitsh/lite)

An example of repo helm synchronisation :

```sh
cd ~/git/Pandemonium1986/ansible-collection-k8s-toolbox
SHA1=`splitsh-lite --prefix=roles/ansible-role-helm`
git push ansible-role-helm $SHA1\:refs/heads/CURRENT_BRANCH -f --no-verify
```

Each role can be tested independently via molecule.

### Guidelines

Feel free to consul before you're contributing

- [Guidelines](https://github.com/Pandemonium1986/.github/blob/main/CONTRIBUTING.md)
- [Code of conduct](https://github.com/Pandemonium1986/.github/blob/main/CODE_OF_CONDUCT.md)
- [Security policy](https://github.com/Pandemonium1986/.github/blob/main/SECURITY.md)

## Authors

- **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
