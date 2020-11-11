# Ansible Collection - k8s toolbox

![Ansible Collection](https://img.shields.io/badge/collection-pandemonium1986.k8s__toolbox-blue?logo=ansible)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-collection-k8s-toolbox.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-collection-k8s-toolbox.svg?logo=github)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)

This [Ansible Collection](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html) "k8s toolbox" contains roles and playbooks to deploy and configured tools to managed a kubernetes cluster.


## Getting Started

This collection contains the following ressources.

| Ressources         | Comment                                                                                    | Privilege |                                                                    CI Status                                                                    |
| :----------------- | :----------------------------------------------------------------------------------------- | :-------: | :---------------------------------------------------------------------------------------------------------------------------------------------: |
| **roles/helm**     | Install helm from the github package and make a symbolic link in /usr/local/bin.           |    true   |   ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-helm/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)   |
| **roles/k9s**      | Install k9s from the github package and make a symbolic link in /usr/local/bin.            |    true   |    ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-k9s/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)   |
| **roles/kubectl**  | Install kubectl from google repositories (centos or debian supported).                     |    true   |  ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectl/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg) |
| **roles/kubectx**  | Install kubectx/kubens from the github package and make a symbolic link in /usr/local/bin. |    true   |  ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectx/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg) |
| **roles/minikube** | Install minikube from google repositories (centos or debian supported).                    |    true   | ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-minikube/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg) |
| **roles/stern**    | Install stern from the github package and make a symbolic link in /usr/local/bin.          |    true   |   ![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-stern/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)  |

### Prerequisites

The only prerequisite is to have an [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) >= 2.9

### Installing

```sh
ansible-galaxy collection install pandemonium1986.k8s_toolbox
```

## Deployment

There are no specific prerequisites for the use of the collection.

Simply create a playbook that may be briefly similar to this one :

```yaml
---
- name :                                     K8s Toolbox deployement
  hosts:                                     local
  become:                                    true
  collections:
    - pandemonium1986.k8s_toolbox
  tasks:
    - import_role:
        name:    pandemonium1986.minikube
    - import_role:
        name:    pandemonium1986.kubectx
    - import_role:
        name:    pandemonium1986.k9s
    - import_role:
        name:    pandemonium1986.stern
    - import_role:
        name:    pandemonium1986.helm
```

Available variables are :

```yaml
helm_cache_path:        "/var/cache/github"
helm_installation_path: "/opt/github/helm"
helm_checksum:          "sha256:b664632683c36446deeb85c406871590d879491e3de18978b426769e43a1e82c"
helm_version:           "v3.3.4"

k9s_cache_path:        "/var/cache/github"
k9s_installation_path: "/opt/github/k9s"
k9s_checksum:          "sha256:42d8aef6b839a9bc60de29d2461521596ce2d1f66347dbf5196983229cfeafd2"
k9s_version:           "v0.22.1"

kubectx_path:    "/opt/github"
kubectx_version: master

stern_installation_path: "/opt/github/stern"
stern_checksum:          "sha256:e0b39dc26f3a0c7596b2408e4fb8da533352b76aaffdc18c7ad28c833c9eb7db"
stern_version:           "1.11.0"
```

## Contributing

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

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
