# TNT - Tendermint Network Troubleshooter

## Overview
This is like localnet, except on remote machines.
A bunch of Makefile targets to easily manage "remotenet".

## Quick tutorial

Run the below to deploy fresh binary and config on the `tik` testnet:
```bash
export TESTNET=tik
alias tnet='make -C $GOPATH/src/github.com/freshautomations/tnt'
tnet binary config start
```
The linux binary and the config needs to reside in the same place as you have it for localnet.

Three testnets were pre-created for your convenience: tik, tak and tok. You can reach the nodes for `tik` at
```bash
tik0.sredev.co
tik1.sredev.co
tik2.sredev.co
tik3.sredev.co
```

All testnets have 4 nodes and they similar URLs.

## Prerequisites

- Export TESTNET name (like in the example)
- Export GOPATH environment variable
- Build the tendermint _linux_ binary at the usual place (`$GOPATH/src/github.com/tendermint/tendermint/build` folder)
- Run ssh-agent with your private key
- `brew install ansible`

### Commands to manage testnet

All commands can be run with `tnet` from any directory if the above mentioned `alias` was set.

Send tendermint binary (form `build/tendermint`) to the nodes:
```bash
make binary
```

Send config from your build folder (same path and folder structure as localnet):
```bash
make config
```

Stop the network:
```bash
make stop
```

Start the network:
```bash
make start
```

Reset database: (unsafe_reset_all)
```bash
make reset
```

You can call multiple commands at once:
```bash
make stop config start
```

## Infrastructure - not for end-users (for now)
Regular users: three testnets are set up for you: tik, tak and tok.

Prerequisites:
- AWS credentials set up
- Terraform installed
- The [other](#Prerequisites) prerequisites are met

### Create infrastructure

```bash
make infra-apply
```

### Destroy infrastructure

```bash
make infra-destroy
```

### Terraform plan infrastructure
make infra-plan

## Other notes
- The nodes report to DataDog.
- You can get the logs from the `/var/log/tendermint.log` file or Journald.
