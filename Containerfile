ARG IMAGE_NAME="${IMAGE_NAME:-silverblue}"
ARG SOURCE_IMAGE="${SOURCE_IMAGE:-silverblue}"
ARG SOURCE_ORG="${SOURCE_ORG:-fedora-ostree-desktops}"
ARG BASE_IMAGE="quay.io/${SOURCE_ORG}/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION}
#FROM quay.io/fedora-ostree-desktops/silverblue:39

ARG IMAGE_NAME="${IMAGE_NAME:-silverblue}"
ARG FEDORA_MAJOR_VERSION="${FEDORA_MAJOR_VERSION:-39}"
ARG RPMFUSION_MIRROR=""

COPY install.sh \
     post-install.sh \
     packages.sh \
     packages.json \
        /tmp/

RUN /tmp/install.sh && \
    /tmp/post-install.sh && \
    rm -rf /tmp/* /var/* && \
    ostree container commit

