# Ansible role : k9s

* * *

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

* * *

![Ansible Role](https://img.shields.io/ansible/role/51049?logo=ansible)
![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-k9s/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-k9s.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-k9s.svg?logo=github)
![Ansible Quality Score](https://img.shields.io/ansible/quality/51049?logo=ansible)

Install and configure k9s from github repository.

## Requirements

This role is self contained and install k9s for debian, ubuntu, linux mint, centos.

## Role Variables

From defaults/main.yml :

```yaml
k9s_cache_path:        "/var/cache/github"
k9s_installation_path: "/opt/github/k9s"
k9s_checksum:          "sha256:42d8aef6b839a9bc60de29d2461521596ce2d1f66347dbf5196983229cfeafd2"
k9s_version:           "v0.22.1"
```

## Example Playbook

```yaml
- name: k9s installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.k9s
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-k9s/tags).

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
