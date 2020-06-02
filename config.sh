#!/bin/bash
# A script to create the certification script

echo "What is your domain? (domain.tld):"

read domain

echo "Please enter filename (domain_tld.conf):"
read filename

echo "generating config file for $domain at /etc/nginx/conf.d/"

cat > /etc/nginx/conf.d/$filename <<EOF
server{
    listen 80;
    server_name $domain www.$domain;

    location / {
        proxy_pass http://172.17.0.2:80;
    }
}
EOF

echo "Config file created! Restarting nginx service."

echo  >> service nginx restart

echo "Run certbot --nginx to generate your certificate!"