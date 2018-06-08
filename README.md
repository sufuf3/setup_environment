# Setup OS environment

Please execute the script to set up the original Ubuntu host after you install the Ubuntu OS.  
Please user root user to setup (cmd is: `sudo su -`)  
> This is a script needs to be executed between setup the Ubuntu OS with Maas and Ansible to deploy K8s cluster (for the job)  

## Quickly setup
### Normal node set up (can be used to setup any Ubuntu hosts in Taiwan)
> Using [normal_node_setup.sh](https://github.com/sufuf3/setup_environment/blob/master/normal_node_setup.sh)

- **Set up without dot files**
```sh
$ wget -O - https://goo.gl/EHgk4v | sh
```

- **Set up with dot files**
```sh
$ wget -O - https://goo.gl/EHgk4v | sh && wget  -O - https://goo.gl/pvswme | bash
```


### Server nodes set up
> Using [nodes_setup.sh](https://github.com/sufuf3/setup_environment/blob/master/nodes_setup.sh)

- **Without set opadmin's password**
```sh
$ wget -O - https://goo.gl/xo9DLa | sh
```
> Your password of opadmin user is `OPgreatW0rld`

- **With set opadmin's password**
```sh
$ wget -O setup.sh https://goo.gl/xo9DLa && sh setup.sh <password> && rm setup.sh
```
>   - example  
      ```
      $ wget -O setup.sh https://goo.gl/xo9DLa && sh setup.sh opadminpassw0rd && rm setup.sh
      ```  
      > Then, your password of opadmin user is `opadminpassw0rd`  


### Ansible node (Deployment node) setup
> Using [pre_setup.sh](https://github.com/sufuf3/setup_environment/blob/master/pre_setup.sh)

- **Without set opadmin's password**
```sh
$ wget -O - https://goo.gl/xhVK2D | sh
```
> Your password of opadmin user is `OPgreatW0rld`

- **With set opadmin's password**
```sh
$ wget -O setup.sh https://goo.gl/xhVK2D && sh setup.sh <password> && rm setup.sh
```
>   - example  
      ```
      $ wget -O setup.sh https://goo.gl/xhVK2D && sh setup.sh opadminpassw0rd && rm setup.sh
      ```  
      > Then, your password of opadmin user is `opadminpassw0rd`  

## Setup with dot files
Let's add **`&& wget  -O - https://goo.gl/pvswme | bash`** at the end of the above command.
- Example
```sh
$ wget -O - https://goo.gl/Vs82DV | sh && wget  -O - https://goo.gl/pvswme | bash
```

More information of dot file, please see https://github.com/sufuf3/my-dotfiles

## Memo
1. If you want to set the hostname, please do the command as the follwoing:
```sh
$ hostname -b <my_hostname> &&　sed -i "s/localhost/<my_hostname>/g" /etc/hostname
```
> After this, you can use `hostname` command to chackout the host name. After you re-login again, you can see the change.

### CentOS setup
- Ansible on CentOS setup
```sh
$ wget -O - http://bit.ly/2JuhqAB | sh
or
$ curl -Lo- http://bit.ly/2JuhqAB | sh
```

- CentoOS Server(k8s nodes)
```sh
$ wget -O - http://bit.ly/2Jrsj66 | sh
or
$ curl -Lo- http://bit.ly/2Jrsj66 | sh
```
