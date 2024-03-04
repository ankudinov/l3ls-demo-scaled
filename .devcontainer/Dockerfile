ARG FROM_IMAGE
ARG FROM_VARIANT

FROM ${FROM_IMAGE}:${FROM_VARIANT}

ARG USERNAME
ARG CLAB_VERSION
ARG CV_API_TOKEN

USER root

# install some basic tools inside the container
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    sshpass \
    iputils-ping \
    htop \
    && rm -rf /var/lib/apt/lists/* \
    && rm -Rf /usr/share/doc && rm -Rf /usr/share/man \
    && apt-get clean

USER ${USERNAME}

# install the latest containerlab, yamllint, cook-and-cut and eos-downloader
RUN bash -c "$(curl -sL https://get.containerlab.dev)" -- -v ${CLAB_VERSION} \
    && pip3 install --user yamllint \
    && pip install --user eos-downloader \
    && pip install --user passlib \
    && pip3 install git+https://github.com/ankudinov/cook_and_cut.git

RUN CVTOKEN=$(curl -H "Authorization: Bearer ${CV_API_TOKEN}" "https://www.cv-staging.corp.arista.io/api/v3/services/admin.Enrollment/AddEnrollmentToken" -d '{"enrollmentToken":{"reenrollDevices":["*"],"validFor":"24h"}}' | sed -n 's|.*"token":"\([^"]*\)".*|\1|p') \
    && mkdir -p /home/${USERNAME}/tmp \
    && echo "$CVTOKEN" > /home/${USERNAME}/tmp/cv-onboarding-token
