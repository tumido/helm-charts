# Helm Chart: Thoth Pipelines for Meteor

This Helm Chart will deploy Project Thoth's Tekton Pipelines. They are a reusable capability for
Open Data Hub, Meteor and they are a part of [AICoE-CI](https://github.com/apps/aicoe-ci).

## Prerequisites

TODO min tekton version, or min openshift pipelines version, where do they have to be deployed?

## Installation

You deployment of the Thoth Pipelines needs some credentials: to push to a
container registry, to create issues and pull requests on GitHub or to publish
Python modules to a Python Index.

These deployment specefic values could be provided in a `deployment-values.yaml` file:

```bash
echo <<EOT >deployment-values.yaml
github:
  username: sesheta
  token: token
  webhooksecret: password
quay:
  registry: quay.io
  username: someone
  password: password
  email: someone@example.com
pypi:
  username: sesheta
  password: password
EOT
```

TODO: describe what the credentials are, how they are encoded and where/how to get them from.

All the pipelines resources will be installed into one specific namespace (in our case it is
called `thoth-aidevsecops-pipelines`), this namespace will also be used for running
pipelines (and thus all the pods originated from tasks).

```bash
helm repo add thoth-station https://thoth-station.ninja/helm-charts/
oc new-project thoth-aidevsecops-pipelines
helm install thoth-pipelines -f deployment-values.yaml thoth-station/meteor-pipelines
```

## Usage

### How to deliver a Python Module to pypi.org

TODO

### How to tag-release a container image to quay.io

TODO
