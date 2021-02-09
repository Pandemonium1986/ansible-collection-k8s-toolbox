# Ansible role : kubectl

* * *

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

* * *

![Ansible Role](https://img.shields.io/ansible/role/50928?logo=ansible)
![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectl/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-kubectl.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-kubectl.svg?logo=github)
![Ansible Quality Score](https://img.shields.io/ansible/quality/50928?logo=ansible)

Install and configure kubectl.

## Requirements

This role is self contained and install kubectl via package manager for debian, ubuntu, linux mint, centos.

## Role Variables

From defaults/main.yml :

```yaml
kubectl_version: "1.20.0"
```

## Example Playbook

```yaml
- name: kubectl installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.kubectl
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-kubectl/tags).

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
