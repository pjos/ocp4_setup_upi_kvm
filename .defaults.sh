#!/bin/bash

# These are the default values used by the script i.e,
# If an option/switch is not provided, these are the values that the script will use.
# These values can be overridden by providing corresponding switches/options.
# You can change these default values to the ones appropriate to your environment,
# to avoid passing them every time.

# -O, --ocp-version VERSION
export OCP_VERSION="4.14.18"
export OCP_VERSION="4.15.17"
export OCP_VERSION="4.16.8"
#export OCP_VERSION="stable"

# -R, --rhcos-version VERSION
export RHCOS_VERSION=""

# -m, --masters N
export N_MAST="1"

# -w, --workers N
export N_WORK="0"

# --master-cpu N(vCPU)
export MAS_CPU="32"

# --master-mem SIZE(MB)
export MAS_MEM="32678"
#export MAS_MEM="24676"
#export MAS_MEM="49152"
export MAS_MEM="65536"

# --worker-cpu N(vCPU)
export WOR_CPU="16"

# --worker-mem SIZE(MB)
export WOR_MEM="16384"
#export WOR_MEM="32768"


# --bootstrap-cpu N(vCPU)
export BTS_CPU="4"

# --bootstrap-mem SIZE(MB)
export BTS_MEM="16384"

# --lb-cpu N(vCPU)
export LB_CPU="1"

# --lb-mem SIZE(MB)
export LB_MEM="1024"

# -n, --libvirt-network NETWORK
export DEF_LIBVIRT_NET="default"

# -N, --libvirt-oct OCTET
export VIR_NET_OCT=""

# -c, --cluster-name NAME
export CLUSTER_NAME="ocp-02"

# -d, --cluster-domain DOMAIN
export BASE_DOM="local"

# -z, --dns-dir DIR
export DNS_DIR="/etc/NetworkManager/dnsmasq.d"

# -v, --vm-dir DIR
export VM_DIR="/var/lib/libvirt/images"

# -s, --setup-dir DIR
# By default set to /root/ocp4_cluster_$CLUSTER_NAME
export SETUP_DIR=""

# -x, --cache-dir DIR
export CACHE_DIR="/root/ocp4_downloads"

# -p, --pull-secret FILE
export PULL_SEC_F="/root/pull-secret"

# --ssh-pub-key-file
# By default a new ssh key pair is generated in $SETUP_DIR
export SSH_PUB_KEY_FILE=""


# Below are some "flags" which by default are set to "no"
# and can be overriden by their respective switches.
# If you set them to "yes" here, you won't need pass those
# switches everytime you run the script.

# --autostart-vms
export AUTOSTART_VMS="yes"

# -k, --keep-bootstrap
export KEEP_BS="no"

# -X, --fresh-download
export FRESH_DOWN="no"

# --destroy
# Don't set this to yes
export DESTROY="no"

# -y, --yes
export YES="no"


export OCP_MIRROR="https://mirror.openshift.com/pub/openshift-v4/clients/ocp"
export RHCOS_MIRROR="https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos"
#export LB_IMG_URL="https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud.qcow2"
export LB_IMG_URL="https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2"
#export LB_IMG_URL="https://download.fedoraproject.org/pub/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2"


declare -A nodeIP=(
    [ocp-01-lb]="192.168.0.100" 
    [ocp-01-master-1]="192.168.0.101"
    [ocp-01-master-2]="192.168.0.102"
    [ocp-01-master-3]="192.168.0.103"
    [ocp-01-worker-1]="192.168.0.104"
    [ocp-01-worker-2]="192.168.0.105"
    [ocp-01-worker-3]="192.168.0.106"
    [bootstrap.ocp-01]="192.168.0.149"
    [ocp-02-lb]="192.168.0.110" 
    [ocp-02-master-1]="192.168.0.111"
    [ocp-02-master-2]="192.168.0.112"
    [ocp-02-master-3]="192.168.0.113"
    [ocp-02-worker-1]="192.168.0.114"
    [ocp-02-worker-2]="192.168.0.115"
    [ocp-02-worker-3]="192.168.0.116"
    [bootstrap.ocp-02]="192.168.0.149"
    [ocp-03-lb]="192.168.0.120" 
    [ocp-03-master-1]="192.168.0.121"
    [ocp-03-master-2]="192.168.0.122"
    [ocp-03-master-3]="192.168.0.123"
    [ocp-03-worker-1]="192.168.0.124"
    [ocp-03-worker-2]="192.168.0.125"
    [ocp-03-worker-3]="192.168.0.126"
    [bootstrap.ocp-03]="192.168.0.149"
)

declare -A nodeMAC=(
    [ocp-01-lb]="52:54:55:56:01:00" 
    [ocp-01-master-1]="52:54:55:56:01:01"
    [ocp-01-master-2]="52:54:55:56:01:02"
    [ocp-01-master-3]="52:54:55:56:01:03"
    [ocp-01-worker-1]="52:54:55:56:01:04"
    [ocp-01-worker-2]="52:54:55:56:01:05"
    [ocp-01-worker-3]="52:54:55:56:01:06"
    [bootstrap.ocp-01]="52:54:55:56:01:49"
    [ocp-02-lb]="52:54:55:56:02:00" 
    [ocp-02-master-1]="52:54:55:56:02:01"
    [ocp-02-master-2]="52:54:55:56:02:02"
    [ocp-02-master-3]="52:54:55:56:02:03"
    [ocp-02-worker-1]="52:54:55:56:02:04"
    [ocp-02-worker-2]="52:54:55:56:02:05"
    [ocp-02-worker-3]="52:54:55:56:02:06"
    [bootstrap.ocp-02]="52:54:55:56:01:49"
    [ocp-03-lb]="52:54:55:56:03:00" 
    [ocp-03-master-1]="52:54:55:56:03:01"
    [ocp-03-master-2]="52:54:55:56:03:02"
    [ocp-03-master-3]="52:54:55:56:03:03"
    [ocp-03-worker-1]="52:54:55:56:03:04"
    [ocp-03-worker-2]="52:54:55:56:03:05"
    [ocp-03-worker-3]="52:54:55:56:03:06"
    [bootstrap.ocp-03]="52:54:55:56:01:49"
)


