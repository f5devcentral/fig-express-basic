ARG base_container=f5devcentral/f5-icontrol-gateway

FROM "${base_container}"

ENV app_name=fig-express-basic
RUN mkdir -p "/var/lib/${app_name}"
COPY / "/var/lib/${app_name}/"
RUN chown -R nginx:nginx "/var/lib/${app_name}"
RUN ln -s /usr/lib/node_modules/unit-http "/var/lib/${app_name}/node_modules/unit-http"
RUN chmod +x "/var/lib/${app_name}/unitapp.js"

COPY unit_config.conf "/etc/unit/${app_name}.conf"
