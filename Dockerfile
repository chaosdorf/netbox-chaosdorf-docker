FROM netboxcommunity/netbox:v3.5.4

COPY configuration.py /etc/netbox/config/configuration.py
RUN apt update && apt install -y build-essential
RUN /opt/netbox/venv/bin/pip install --no-cache-dir netbox-secretstore
RUN apt purge -y build-essential
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
