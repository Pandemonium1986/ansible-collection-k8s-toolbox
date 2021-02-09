# Ansible role : kubectx

* * *

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

* * *

![Ansible Role](https://img.shields.io/ansible/role/51012?logo=ansible)
![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-kubectx/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-kubectx.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-kubectx.svg?logo=github)
![Ansible Quality Score](https://img.shields.io/ansible/quality/51012?logo=ansible)

Installs kubectx and kubens from github repository.

## Requirements

This role is not self contained. He requires pandemonium1986.kubectl to work correctly.

```sh
  ansible-galaxy install -f pandemonium1986.kubectl
```

## Role Variables

From defaults/main.yml :

```yaml
kubectx_installation_path: "/opt/github/kubectx"
kubectx_version:           "master"
```

## Example Playbook

```yaml
- name: kubectx installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.kubectx
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-kubectx/tags).

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
