# drone-kustomize-plugin

Demo

```yaml
-   name: kustomize gitops
    image: yahuiwong/drone-kustomize-plugin:master-4682364
    environment:
      GITOPS_SSHKEY:
        from_secret: gitops_sshkey # base64
      GITOPS_EMAIL:
        from_secret: gitops_email
      GITOPS_NAME:
        from_secret: gitops_name
      GITOPS_URL:
        from_secret: gitops_url
      GITOPS_DIRECTORY: kustomize-guestbook
      KUSTOMIZE_COMMAND: kustomize edit set image gcr.io/heptio-images/ks-guestbook-demo:0.2
      GITOPS_COMMIT: set image gcr.io/heptio-images/ks-guestbook-demo:0.2
```
