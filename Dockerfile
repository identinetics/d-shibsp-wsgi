FROM r2h2/shibsp

# Python 3.6
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm \
 && yum -y install python36u python36u-pip \
 && yum -y install mod_wsgi \
 && ln -sf /usr/bin/python3.6 /usr/bin/python3 \
 && ln -sf /usr/bin/pip3.6 /usr/bin/pip3 \
 && yum clean all && rm -rf /var/cache/yum \
 && mkdir -p /root/.config/pip \
 && printf "[global]\ndisable-pip-version-check = True\n" > /root/.config/pip/pip.conf


COPY vhost_wsgi.conf /opt/install/etc/httpd/conf.d/vhost_wsgi.conf
COPY hello.py /var/www/python/hello.py

