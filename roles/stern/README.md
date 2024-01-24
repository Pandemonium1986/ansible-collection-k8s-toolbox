# Ansible role : stern

---

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

---

[![Ansible Role](https://img.shields.io/ansible/role/d/pandemonium1986/stern?logo=Ansible&color=blue)](https://galaxy.ansible.com/ui/standalone/roles/pandemonium1986/stern/)
[![Molecule](https://github.com/Pandemonium1986/ansible-role-stern/actions/workflows/molecule.yml/badge.svg)](https://github.com/Pandemonium1986/ansible-role-stern/actions/workflows/molecule.yml)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-stern.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-stern.svg?logo=github)

Install and configure stern from GitHub repository.

## Requirements

This role is self contained and install stern for debian, ubuntu, linux mint, centos.

## Role Variables

From defaults/main.yml :

```yaml
stern_installation_path: "/opt/github/stern"
stern_checksum: "sha256:e0b39dc26f3a0c7596b2408e4fb8da533352b76aaffdc18c7ad28c833c9eb7db"
stern_version: "1.11.0"
```

## Example Playbook

```yaml
- name: stern installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.stern
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-stern/tags).

## Authors

- **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
