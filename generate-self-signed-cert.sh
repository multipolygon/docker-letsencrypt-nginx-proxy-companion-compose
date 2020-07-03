echo "Generate self-signed certificate for $HOST"

sleep 3

cd certs/

openssl genrsa -des3 -passout pass:x -out $HOST.pass.key 2048

openssl rsa -passin pass:x -in $HOST.pass.key -out $HOST.key

rm $HOST.pass.key

openssl req -new -key $HOST.key -out $HOST.csr

openssl x509 -req -sha256 -days 3650 -in $HOST.csr -signkey $HOST.key -out $HOST.crt

echo "Please restart Docker container"
