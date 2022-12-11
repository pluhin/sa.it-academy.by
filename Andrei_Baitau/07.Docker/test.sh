ip=('192.168.1.103:8000' 'localhost:8000' '127.0.0.1:8000')

for t in ${ip[@]}; do
echo ' '
echo '____________________'
echo $t
echo ' '
    curl -i $t
echo ' '

done
