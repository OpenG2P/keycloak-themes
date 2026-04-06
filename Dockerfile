FROM openg2p/keycloak:24.0.5-debian-12-r1

COPY g2p-advisor /opt/bitnami/keycloak/themes/g2p-advisor
COPY staff-portal-admin /opt/bitnami/keycloak/themes/staff-portal-admin
COPY staff-portal-login /opt/bitnami/keycloak/themes/staff-portal-login
# COPY openg2p-admin /opt/bitnami/keycloak/themes/openg2p-admin
