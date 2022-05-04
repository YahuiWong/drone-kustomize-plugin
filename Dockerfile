FROM alpine:3.7
ENV KUSTOMIZE_VERSION v4.5.4

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories && apk add git curl bash openssh
RUN  curl -L --output /tmp/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
  && echo "1159c5c17c964257123b10e7d8864e9fe7f9a580d4124a388e746e4003added3  /tmp/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" | sha256sum -c \
  && tar xzf /tmp/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/local/bin \
  && chmod +x /usr/local/bin/kustomize