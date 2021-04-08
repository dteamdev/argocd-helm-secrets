# argocd-helm-secrets
# helm-kubernetes Docker hub image

[![](https://img.shields.io/microbadger/layers/dteamdev/argocd-helm-secrets)]()
[![](https://img.shields.io/microbadger/image-size/dteamdev/argocd-helm-secrets)](https://microbadger.com/images/dteamdev/argocd-helm-secrets "Get your own version badge on microbadger.com")
[![Build Status](https://img.shields.io/github/workflow/status/dteamdev/argocd-helm-secrets/ci?style=flat)](https://github.com/dteamdev/argocd-helm-secrets/actions/workflows/build.yml)
[![Docker Stars](https://img.shields.io/docker/stars/dteamdev/argocd-helm-secrets.svg?style=flat)](https://hub.docker.com/r/dteamdev/argocd-helm-secrets/)
[![Docker Pulls](https://img.shields.io/docker/pulls/dteamdev/argocd-helm-secrets.svg)]()

Supported tags and release links

* [2.0.0](https://github.com/dteamdev/argocd-helm-secrets/releases/tag/2.0.0) - ArgoCD v2.0.0, Helm secrets v3.6.1, Sops v3.7.0

## Overview

This is ArgoCD custom image with support of helm secrets. If you want to use gpg keys for SOPS, you need to add it to your deployment
This image use:
* [Argo CD](https://github.com/argoproj/argo-cd)
* [Helm Secrets](https://github.com/jkroepke/helm-secrets)
* [sops](https://github.com/mozilla/sops)

## Run

You can look on [this](https://hackernoon.com/how-to-handle-kubernetes-secrets-with-argocd-and-sops-r92d3wt1) article for tutorial about usage custom image for Argo CD. Or you can find this instructions in ArgoCD documentation

## Build

This image is now fully automated via github actions.

If want to request version upgrade open PR with new versions in `.github/workflows/build.yml`