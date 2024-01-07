FROM informalsystems/hermes:v1.7.4
COPY mnemonic.txt .
COPY --chown=hermes:hermes config.toml /home/hermes/.hermes/config.toml
RUN hermes keys add --key-name noble --chain noble-1 --mnemonic-file mnemonic.txt
RUN hermes keys add --key-name teritori --chain teritori-1 --mnemonic-file mnemonic.txt 
RUN hermes keys add --key-name osmosis --chain osmosis-1 --mnemonic-file mnemonic.txt