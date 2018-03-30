# Setup OS environment

Please execute the script to setup the original Ubuntu host.
Please user root user to setup (cmd is: `sudo su -`)

## Quickly setup
### Normal nodes (can be used to setup any Ubuntu hosts in Taiwan)
#### Without set opadmin's password
```sh
$ wget -O - https://goo.gl/Vs82DV | bash
```
> Your password of opadmin user is `OPgreatW0rld`

#### With set opadmin's password
```sh
$ wget -O setup.sh https://goo.gl/Vs82DV && bash setup.sh <password> && rm setup.sh
```
- example
```sh
$ wget -O setup.sh https://goo.gl/Vs82DV && bash setup.sh opadminpassw0rd && rm setup.sh
```
> Then, your password of opadmin user is `opadminpassw0rd`

### Ansible node (Deploy node)
#### Without set opadmin's password
```sh
$ wget -O - https://goo.gl/xhVK2D | bash
```
> Your password of opadmin user is `OPgreatW0rld`

#### With set opadmin's password
```sh
$ wget -O setup.sh https://goo.gl/xhVK2D && bash setup.sh <password> && rm setup.sh
```
- example
```sh
$ wget -O setup.sh https://goo.gl/xhVK2D && bash setup.sh opadminpassw0rd && rm setup.sh
```
> Then, your password of opadmin user is `opadminpassw0rd`

## Setup with dot files
Let's add **`&& wget  -O - https://goo.gl/pvswme | bash`** at the end of the above command.
- Example
```sh
$ wget -O - https://goo.gl/Vs82DV | bash && wget  -O - https://goo.gl/pvswme | bash
```
> More information of dot file, please see https://github.com/sufuf3/my-dotfiles
