
`Sudo для пользователя без пароля `

```
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/dont-prompt-$USER-for-password
```

`Апдейт и установка софта`

```
## Debian
sudo apt update && sudo apt install vim git wget curl -y
## CentOS7
sudo yum update && sudo yum install vim git wget curl -y
```


`Чистка коробки`

```
sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/man /usr/share/doc /usr/share/doc-base && cat /dev/null > ~/.bash_history && history -c && exit
```

`Создание коробки с именем "название_текущей_папки.box"`

```
name=$(pwd | grep -o '[^/]*$') && vagrant package --output $name.box
```

`Отправка коробки в Cloud`

```
name=$(pwd | grep -o '[^/]*$') && vagrant cloud publish --release andreilukashonak/$name 1.0 virtualbox $name.box
```
