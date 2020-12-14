# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM k8s.gcr.io/debian-base:v2.0.0

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
        ca-certificates \
        coreutils \
        socat \
        git \
        openssh-client \
    && rm -rf /var/lib/apt/lists/*

# By default we will run as this user...
RUN echo "git-sync:x:65533:65533::/tmp:/sbin/nologin" >> /etc/passwd
# ...but the user might choose a different UID and pass --add-user
# which needs to be able to write to /etc/passwd.
#RUN chmod 0666 /etc/passwd

ADD .go/bin/git-sync /git-sync
COPY run-git-sync.sh /run-git-sync.sh
RUN chmod +x /run-git-sync.sh

WORKDIR /tmp
USER 65533:65533
ENTRYPOINT ["/run-git-sync.sh"]
