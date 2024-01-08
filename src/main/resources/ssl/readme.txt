# Generated using the commands below

#Generate Private Key and Public Cert Using OpenSSL
openssl req -newkey rsa:2048 -x509 -keyout cakey.pem -out cacert.pem -days 3650

#We need to convert the RAS format to PKCS12 using the following command:
openssl pkcs12 -export -in cacert.pem -inkey cakey.pem -out identity.p12 -name "selfsigned"