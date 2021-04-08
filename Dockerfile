ARG ARGOCD_VERSION

FROM argoproj/argocd:$ARGOCD_VERSION

ARG VCS_REF
ARG BUILD_DATE
ARG SOPS_VERSION
ARG HELM_SECRETS_VERSION

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.name="helm-secrets" \
      org.label-schema.url="https://hub.docker.com/r/dteamdev/argocd-helm-secrets/" \
      org.label-schema.vcs-url="https://github.com/dteamdev/argocd-helm-secrets" \
      org.label-schema.build-date=$BUILD_DATE

USER root
COPY helm-wrapper.sh /usr/local/bin/
RUN apt-get update  --allow-insecure-repositories --allow-unauthenticated && \
    apt-get install -y \
    curl \
    gpg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    curl -o /usr/local/bin/sops -L https://github.com/mozilla/sops/releases/download/${SOPS_VERSION}/sops-${SOPS_VERSION}.linux && \
    chmod +x /usr/local/bin/sops && \
    cd /usr/local/bin && \
    mv helm helm.bin && \
    mv helm2 helm2.bin && \
    mv helm-wrapper.sh helm && \
    ln helm helm2 && \
    chmod +x helm helm2

# helm secrets plugin should be installed as user argocd or it won't be found
USER argocd
RUN /usr/local/bin/helm.bin plugin install https://github.com/jkroepke/helm-secrets --version ${HELM_SECRETS_VERSION}
ENV HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/"