FROM rxvallejoc/base:latest
MAINTAINER Rodrigo Vallejo <rvallejo@thougthworks.com>

USER root

RUN yum -y update && yum clean all
RUN yum -y install httpd && yum clean all

EXPOSE 80


ADD run-httpd.sh /run-httpd.sh
ADD reverse-proxy.conf /etc/httpd/conf.d/reverse-proxy.conf

RUN chmod -v +x /run-httpd.sh

CMD ["/run-httpd.sh"]
