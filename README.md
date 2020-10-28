# Ansible Collection - k8s toolbox

![](https://img.shields.io/github/release/Pandemonium1986/ansible-collection-openstack.svg)
![](https://img.shields.io/github/repo-size/Pandemonium1986/ansible-collection-openstack.svg)
![](https://img.shields.io/github/release-date/Pandemonium1986/ansible-collection-openstack.svg)
![](https://img.shields.io/github/license/Pandemonium1986/ansible-collection-openstack.svg)

![Ansible Role](https://img.shields.io/ansible/role/51080?logo=ansible)
![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-helm/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-helm.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-helm.svg?logo=github)
![Ansible Quality Score](https://img.shields.io/ansible/quality/51080?logo=ansible)

This [Ansible Collection](https://docs.ansible.com/ansible/latest/user_guide/collections_using.html) "k8s toolbox" contains roles and playbooks to deploy and configured tools to managed a kubernetes cluster.

## Getting Started

This collection contains the following ressources.

| Ressources         | Comment                                                                        | Privilege |
| :----------------- | :----------------------------------------------------------------------------- | :-------: |
| **roles/helm**     | Install and configures python pip globally.                                    |    true   |
| **roles/k9s**      | Install openstacksdk and checks if clouds.yaml is available to the local user. |    true   |
| **roles/kubectl**  | Generate resources in an openstack tenant from the local user's runtime.       |    true   |
| **roles/kubectx**  | Deploying vms in the openstack tenant from the local 's runtime.               |    true   |
| **roles/minikube** | Deploying vms in the openstack tenant from the local 's runtime.               |    true   |

### Prerequisites

The only prerequisite is to have an [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) >= 2.9

### Installing

```sh
ansible-galaxy collection install pandemonium1986.k8s_toolbox
```

## Deployment

TBD

Next, you need to create a playbook that may be briefly similar to this one :

```yaml
---
- name :                                     K8s Toolbox deployement
  hosts:                                     local
  become:                                    true
  collections:
   - pandemonium1986.k8s_toolbox
  vars:
    TBD
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
TBD
```

## Contributing

<https://github.com/hraban/tomono>
<https://github.com/splitsh/lite>

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
