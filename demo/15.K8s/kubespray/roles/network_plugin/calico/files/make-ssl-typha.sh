#!/bin/bash

# Author: Smana smainklh@gmail.com
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

set -o errexit
set -o pipefail
usage()
{
    cat << EOF
Create self signed certificates

Usage : $(basename $0) -f <config> [-d <ssldir>]
      -h | --help         : Show this message
      -f | --config       : Openssl configuration file
      -d | --ssldir       : Directory where the certificates will be installed
      -c | --cadir        : Directory where the existing CA is located

               ex :
               $(basename $0) -f openssl.conf -d /srv/ssl
EOF
}

# Options parsing
while (($#)); do
    case "$1" in
        -h | --help)   usage;   exit 0;;
        -f | --config) CONFIG=${2}; shift 2;;
        -d | --ssldir) SSLDIR="${2}"; shift 2;;
        -c | --cadir) CADIR="${2}"; shift 2;;
        *)
            usage
            echo "ERROR : Unknown option"
            exit 3
        ;;
    esac
done

if [ -z ${CONFIG} ]; then
    echo "ERROR: the openssl configuration file is missing. option -f"
    exit 1
fi
if [ -z ${SSLDIR} ]; then
    SSLDIR="/etc/calico/certs"
fi

tmpdir=$(mktemp -d /tmp/calico_typha_certs.XXXXXX)
trap 'rm -rf "${tmpdir}"' EXIT
cd "${tmpdir}"

mkdir -p ${SSLDIR} ${CADIR}

# Root CA
if [ -e "$CADIR/ca.key" ]; then
  # Reuse existing CA
  cp $CADIR/{ca.crt,ca.key} .
else
  openssl genrsa -out ca.key 2048 > /dev/null 2>&1
  openssl req -x509 -new -nodes -key ca.key -days 3650 -out ca.crt -subj "/CN=calico-typha-ca" > /dev/null 2>&1
fi

# Typha server
openssl genrsa -out typha-server.key 2048 > /dev/null 2>&1
openssl req -new -key typha-server.key -out typha-server.csr -subj "/CN=typha-server" -config ${CONFIG} > /dev/null 2>&1
openssl x509 -req -in typha-server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out typha-server.crt -days 3650 -extensions ssl_client -extfile ${CONFIG} > /dev/null 2>&1

# Typha client
openssl genrsa -out typha-client.key 2048 > /dev/null 2>&1
openssl req -new -key typha-client.key -out typha-client.csr -subj "/CN=typha-client" -config ${CONFIG} > /dev/null 2>&1
openssl x509 -req -in typha-client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out typha-client.crt -days 3650 -extensions ssl_client -extfile ${CONFIG} > /dev/null 2>&1

# Install certs
if [ -e "$CADIR/ca.key" ]; then
    # No pass existing CA
    rm -f ca.crt ca.key
fi

mv {*.crt,*.key} ${SSLDIR}/
