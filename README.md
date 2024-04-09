[![cd](https://github.com/ansible/community-ansible-devspaces-image/actions/workflows/cd.yml/badge.svg?branch=main)](https://github.com/ansible/community-ansible-devspaces-image/actions/workflows/cd.yml)

# Community Ansible Dev Spaces Image

An OpenShift Dev Spaces image specifically for Ansible development.

This comes pre-built with the [Ansible Development Tools](https://github.com/ansible/ansible-dev-tools) package.
For documentation on how to use these tools, please refer to [ADT docs](https://ansible.readthedocs.io/projects/dev-tools/).

This image is built and published on a nightly basis. Grab this image using:

```bash
podman pull ghcr.io/ansible/community-ansible-devspaces-image:latest
```

## Base Image

The [Universal Developer Image](https://quay.io/repository/devfile/universal-developer-image) is used as the base image.

## Code of Conduct

We ask all of our community members and contributors to adhere to the [Ansible code of conduct](http://docs.ansible.com/ansible/latest/community/code_of_conduct.html).

## LICENSE

See [LICENSE](https://github.com/ansible-collections/cisco.nxos/blob/main/LICENSE) to see the full text.
