# Description
- based on eosio/eos
- installed gdb, gdb-peda, git
- together there is an docker-compose file, you could use that.

# Installation
`$ docker pull xhyumiracle/eos`

# Usage
- add alias to .zshrc, make sure to change all the '/path/to'
- use `nodeos-clear` to delete state files before start
- `nodeos` to start eos server end
- `nodeos-gdb` to start eos server end in gdb with peda
- please do run `nodeos-cpk` after `nodeos` has started everytime to copy the `eosio` private key to cleos's data-dir, so that cleos could import and use it. Otherwise cleos couldn't deploy any contract.
- recommend to use `cleos-bash` to run many commands because `cleos` would create and remove new container every time, which is very slow.

# Memos
place this to .zshrc or .bashrc:
```
alias nodeos='docker-compose -f /path/to/docker-compose.yml run --rm nodeosd /opt/eosio/bin/nodeosd.sh --data-dir /opt/eosio/bin/data-dir -e -p eosio --contracts-console'
alias nodeos-gdb='docker-compose -f /path/to/docker-compose.yml run --rm nodeosd /opt/eosio/bin/nodeosd-gdb.sh --data-dir /opt/eosio/bin/data-dir -e -p eosio --contracts-console'
alias nodeos-clear='rm -r /path/to/data-volumes/nodeos-data-volume'
alias nodeos-cpk='cat /path/to/data-volumes/nodeos-data-volume/config.ini| grep signature-provider | grep EOS | cut -d':' -f2 > /path/to/data-volumes/cleos-data-volume/eosio.bios.key'
alias cleos='docker-compose -f /path/to/docker-compose.yml run --rm cleos cleos -u http://172.18.0.2:8888'
alias cleos-bash='docker-compose -f /path/to/docker-compose.yml run --rm cleos bash'
```

# Tips
to check the server(nodeos) container, type
`docker inspect <container_id>`

