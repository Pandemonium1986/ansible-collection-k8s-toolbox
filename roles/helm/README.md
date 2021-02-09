# Ansible role : helm

* * *

**Disclaimer**  
All contributions made directly in this repository will be deleted by force push. If you want to contribute, go to [ansible-collection-k8s-toolbox](https://github.com/Pandemonium1986/ansible-collection-k8s-toolbox)

* * *

![Ansible Role](https://img.shields.io/ansible/role/51080?logo=ansible)
![Github pipeline status](https://github.com/Pandemonium1986/ansible-role-helm/workflows/Molecule:%20Github%20actions%20pipeline/badge.svg)
![GitHub release](https://img.shields.io/github/release/Pandemonium1986/ansible-role-helm.svg?logo=github)
![Github license](https://img.shields.io/github/license/Pandemonium1986/ansible-role-helm.svg?logo=github)
![Ansible Quality Score](https://img.shields.io/ansible/quality/51080?logo=ansible)

Install and configure helm from helm registry.

## Requirements

This role is self contained and install helm for debian, ubuntu, linux mint, centos.

## Role Variables

From defaults/main.yml :

```yaml
helm_cache_path:        "/var/cache/github"
helm_installation_path: "/opt/github/helm"
helm_checksum:          "sha256:b664632683c36446deeb85c406871590d879491e3de18978b426769e43a1e82c"
helm_version:           "v3.3.4"
```

## Example Playbook

```yaml
- name: helm installation
  hosts: all
  become: true
  tasks:
    - import_role:
        name: pandemonium1986.helm
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/Pandemonium1986/ansible-role-helm/tags).

## Authors

-   **Michael Maffait** - _Initial work_ - [Pandemonium1986](https://github.com/Pandemonium1986)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
