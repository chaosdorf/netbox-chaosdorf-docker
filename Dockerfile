FROM netboxcommunity/netbox:v3.2.4

COPY configuration.py /etc/netbox/config/configuration.py
RUN apk add --no-cache --virtual .build-deps gcc musl-dev
RUN /opt/netbox/venv/bin/pip install --no-cache-dir netbox-secretstore
RUN apk del .build-deps gcc musl-dev
RUN SECRET_KEY="dummy" /opt/netbox/venv/bin/python /opt/netbox/netbox/manage.py collectstatic --no-input
