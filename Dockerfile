FROM centos:centos7

MAINTAINER Jeroen Boonstra  jeroen@provider.nl

RUN yum update -y && \
  yum install -y epel-release

RUN yum install -y https://repo.varnish-cache.org/pkg/5.0.0/varnish-5.0.0-1.el7.x86_64.rpm

RUN yum clean all


ENV VCL_DEFAULT       /etc/varnish/default.vcl
ENV CACHE_SIZE        64m
ENV VARNISHD_PARAMS   "-p feature=+http2 -p feature=+https_scheme"

EXPOSE 80

ENTRYPOINT varnishd -F -f $VCL_DEFAULT  -s malloc,$CACHE_SIZE $VARNISHD_PARAMS
