# Linux

## Screen

Terminal multiplexer _screen_

```bash
$ screen -ls # List of sessions
$ screen -r 'nom du screen' # Reattach to a Linux Screen
$ screen -S 'nom du screen' # Starting Named Session
$ screen -d 'nom du screen' # Detach from Linux Screen Session
```

## Connexion to server SSH

Disable password authentication or allow users to connect into ssh
```bash
$ sudo vim /etc/ssh/sshd_config
```

## Key ssh 

- Create a key ssh locally

```bash
$ ssh-keygen -t rsa -b 4096 -C "Add a name to this key"
```

- Add ssh key to server 

```bash
$ ssh-copy-id -i ~/.ssh/id_rsa.pub acuffel@51.91.80.58
```
