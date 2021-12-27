FROM buluma/ubuntu:latest
MAINTAINER buluma "me@buluma.me.ke"

ENV DEBIAN_FRONTEND=noninteractive

# ENV pip_packages "ansible cryptography"

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 --no-cache-dir install --upgrade pip \
  && rm -rf /var/lib/apt/lists/*
  
# Install Ansible via pip.
# RUN pip install $pip_packages

# COPY initctl_faker .
# RUN chmod +x initctl_faker && rm -fr /sbin/initctl && ln -s /initctl_faker /sbin/initctl

# Install Ansible inventory file.
# RUN mkdir -p /etc/ansible
# RUN echo "[local]\nlocalhost ansible_connection=local" > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]

ENTRYPOINT ["python3"]
