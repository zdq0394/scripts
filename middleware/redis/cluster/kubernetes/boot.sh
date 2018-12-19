#! /bin/bash
# ENV:
##  CLUSTER_DOMAIN
##  NAMESPACE
##  HEADLESS_SERVICE_NAME
##  STATEFULSET_NAME
REDIS0_IP=`dig +short $STATEFULSET_NAME-0.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`
REDIS1_IP=`dig +short $STATEFULSET_NAME-1.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`
REDIS2_IP=`dig +short $STATEFULSET_NAME-2.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`
REDIS3_IP=`dig +short $STATEFULSET_NAME-3.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`
REDIS4_IP=`dig +short $STATEFULSET_NAME-4.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`
REDIS5_IP=`dig +short $STATEFULSET_NAME-5.$HEADLESS_SERVICE_NAME.$NAMESPACE.svc.k8s.$CLUSTER_DOMAIN`

redis-cli -h $REDIS0_IP cluster meet $REDIS1_IP 6379
redis-cli -h $REDIS0_IP cluster meet $REDIS2_IP 6379
redis-cli -h $REDIS0_IP cluster meet $REDIS3_IP 6379
redis-cli -h $REDIS0_IP cluster meet $REDIS4_IP 6379
redis-cli -h $REDIS0_IP cluster meet $REDIS5_IP 6379

sleep 15
redis-cli -h $REDIS0_IP cluster addslots {0..5461}
sleep 3
redis-cli -h $REDIS1_IP cluster addslots {5462..10922}
sleep 3
redis-cli -h $REDIS2_IP cluster addslots {10923..16383}

sleep 10
REDIS0_ID=`redis-cli -h $REDIS0_IP cluster myid | sed 's/"//g'`
redis-cli -h $REDIS3_IP cluster replicate $REDIS0_ID
sleep 3
REDIS1_ID=`redis-cli -h $REDIS1_IP cluster myid | sed 's/"//g'`
redis-cli -h $REDIS4_IP cluster replicate $REDIS1_ID
sleep 3
REDIS2_ID=`redis-cli -h $REDIS2_IP cluster myid | sed 's/"//g'`
redis-cli -h $REDIS5_IP cluster replicate $REDIS2_ID