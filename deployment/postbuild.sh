#!/usr/bin/env bash

cat > "/etc/apache2/sites-available/site.conf" << 'EOF'
<VirtualHost *:${APACHE_PORT}>
    #ServerName www.example.com
    DocumentRoot /home/site/wwwroot/htdocs

    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
</VirtualHost>

EOF

ln -sfn "/etc/apache2/sites-available/site.conf" "/etc/apache2/sites-enabled/site"
