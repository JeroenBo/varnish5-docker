### VARNISH 5 on CentOS 7

Image version: 0.1-alpha

Note:  this is an expirimental image



*Example startup:*

```
docker run -it --rm --name varnish \
 --env 'CACHE_SIZE=128m'
-v /local/vlc/on/host/:/etc/varnish jeroen/varnish5

```

#### Environmental options:
CACHE_SIZE= 64m

VARNISHD_PARAMS = "-p feature=+http2 -p feature=+https_scheme"

VCL_DEFAULT = "/etc/varnish/default.vcl"
