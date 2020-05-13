FROM ubuntu:bionic

# Install prerequisities for Ansible
RUN apt-get update
RUN apt-get -y install python3 python3-nacl python3-pip libffi-dev sudo cron

# Upgrade pip3 to the latest one
# RUN pip3 install --upgrade pip

# Install ansible
RUN pip3 install ansible

# Copy ansible configuration into the image
COPY . /ansible

# Run ansible to configure things
RUN ansible-playbook \
  --connection=local \
  --inventory 127.0.0.1, \
  --limit 127.0.0.1 \
  -i /ansible/config.yml /ansible/playbook.yml
