### Create SSL Certs
openssl genrsa -out gitea_low_isactn_skyline_lan.key
openssl req -new -key gitea_low_isactn_skyline_lan.key -out gitea_low_isactn_skyline_lan.req
./easyrsa import-req gitea_low_isactn_skyline_lan.req gitea_low_isactn_skyline_lan
./easyrsa sign-req gitea_low_isactn_skyline_lan
./easyrsa sign-req server gitea_low_isactn_skyline_lan
