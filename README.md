# TNT - Tendermint Network Troubleshooter

## Overview
This is like localnet, except it focuses on remote machines.
A bunch of Makefile targets to easily manage "remotenet".

## Quick tutorial

Do a git clone. Run the below to prepare your commands. Then get back to your tendermint source code directory.
```bash
export TESTNET=tik
alias tnet='make -C $GOPATH/src/github.com/freshautomations/tnt'

#If you don't have SSH Agent, here's how you set it up
ssh-agent > $HOME/.ssh/ssh-env
source $HOME/.ssh/ssh-env
ssh-add $HOME/.ssh/id_rsa

# If you don't have ansible on OSX, here's how you set it up
brew install ansible
```

The linux binary and the config needs to reside in the same place (`$GOPATH/src/github.com/tendermint/tendermint/build`) as you have it for localnet. When you created those, run:
```bash
tnet binary
tnet config
tnet start
```
This will copy the binary and the config to the testnet and start tendermint with the `kvstore` application.

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

Add SSH keys for login:
```bash
make ssh
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

### Known hosts parameters for the current testnet

```
tik0.sredev.co,35.175.189.177 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tik1.sredev.co,34.228.169.81 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tik2.sredev.co,3.89.101.22 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tik3.sredev.co,3.80.87.86 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tak0.sredev.co,34.230.83.107 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tak1.sredev.co,34.229.109.237 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tak2.sredev.co,3.90.152.137 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tak3.sredev.co,54.92.187.24 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tok0.sredev.co,54.88.33.102 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tok1.sredev.co,3.80.168.38 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tok2.sredev.co,3.82.26.139 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
tok3.sredev.co,3.81.116.218 ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBOwKagJ25FS7weKXCFuvuEQc6mmghZEi4W312KRg5GWIXmTzWr9/aXbmt/3ui65NHnxBpgDNJY4UtPoEB1sgYTo=
```