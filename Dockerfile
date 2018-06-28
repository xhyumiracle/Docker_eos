FROM eosio/eos
RUN apt-get update && apt-get install -y vim gdb git &&\
    git clone https://github.com/longld/peda.git /opt/peda && \
    echo "source /opt/peda/peda.py" >> ~/.gdbinit && \
    cp /opt/eosio/bin/nodeosd.sh /opt/eosio/bin/nodeosd-gdb.sh && \
    sed -i -e 's/\/opt\/eosio\/bin\/nodeos/gdb\ --args\ \/opt\/eosio\/bin\/nodeos/g' /opt/eosio/bin/nodeosd-gdb.sh
