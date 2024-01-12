# Ansible role : minikube

---

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

---

[![Ansible Role](https://img.shields.io/ansible/role/d/pandemonium1986/minikube?logo=Ansible&color=blue)](https://galaxy.ansible.com/ui/standalone/roles/pandemonium1986/minikube/)
[![Molecule](https://github.com/Pandemonium1986/ansible-role-minikube/actions/workflows/molecule.yml/badge.svg)](https://github.com/Pandemonium1986/ansible-role-minikube/actions/workflows/molecule.yml)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-minikube.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-minikube.svg?logo=github)

Install and configure minikube.

## Requirements

This role is self contained and install minikube via package manager for debian, ubuntu, linux mint, centos.

## Role Variables

From defaults/main.yml :

```yaml
minikube_version: "1.17.1"
```

## Example Playbook

```yaml
- name: minikube installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.minikube
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-minikube/tags).

## Authors

- **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
