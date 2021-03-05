FROM fedora

RUN dnf install -y httpd && dnf clean all

ADD index.html /var/www/html

CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
