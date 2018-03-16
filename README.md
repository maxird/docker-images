# Docker Images

Base images built in docker hub.

```plantuml
digraph z {
  rankdir=LR
  subgraph cluster_root {
    centos
  }
  subgraph cluster_node {
    label="Node JS"
    "node"
    "node-build"
    "node-packaging"
    "node-pipeline"
  }
  subgraph cluster_java {
    label="Java"
    java
    activemq
    cordra
    "java-build"
    keycloak
    tomcat
  }
  subgraph cluster_wso2 {
    label="WSO2"
    wso2am
    wso2ei
    wso2is
  }
  subgraph cluster_lb {
    label="Load Balancers"
    dnsfw
    lbapp
    lbcolor
    lbdns
  }
  subgraph cluster_other {
    label="Other"
    anchore
    elastalert
    redis
    wso2am
    wso2ei
    wso2is
  }

  centos -> {
    anchore
    dnsfw
    elastalert
    java
    lbapp
    lbcolor
    lbdns
    "node"
    "node-build"
    redis
  }

  java -> {
    activemq
    cordra
    "java-build"
    keycloak
    tomcat
    wso2am
    wso2ei
    wso2is
  }

  "node-build" -> {
    "node-packaging"
  }

  "node-packaging" -> {
    "node-pipeline"
  }
}
```
