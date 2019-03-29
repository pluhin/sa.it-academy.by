#!/usr/bin/env bash

function get_ip_interface {
    TYPE=$1
    INTERFACE=$2
    if [ -n "$INTERFACE" ]; then
      IP=$(ip -o -4 addr list $INTERFACE | head -n1 | awk '{print $4}' | awk -F '/' '{print $1}')
      if [ -z "$INTERFACE" ]; then
        echo "ERROR: Could not find IP for interface '$INTERFACE'"
        exit 1
      fi
      echo "-${TYPE}=${IP}"
    fi
}

main() {
	set -eo pipefail
	case "$1" in
	*)           exec /bin/consul agent -config-file=/consul/config.json -config-dir=/consul/config $CONSUL_ADVERTISE $CONSUL_BIND $CONSUL_CLIENT $@;;
	esac
}

CONSUL_ADVERTISE="$(get_ip_interface advertise $CONSUL_INTERFACE_ADVERTISE)"
CONSUL_BIND="$(get_ip_interface bind $CONSUL_INTERFACE_BIND)"
CONSUL_CLIENT="$(get_ip_interface client $CONSUL_INTERFACE_CLIENT)"

main "$@"
