# DMNQI

The **DMNQI** is the quickest way to launch a masternode instance on an Ubuntu based VPS.

## About

* 100% auto-compilation and 99% of configuration on the masternode side of things. It is currently only tested on a vultr VPS but should work almost anywhere where IPv6 addresses are available
* Installs 1-100 (or more!) masternodes in parallel on one machine, with individual config and data
* Compilation is currently from source for the desired git repo tag (configurable via config files)
  Some security hardening is done, including firewalling and a separate user
* Automatic startup for all masternode daemons
* This script needs to run as root, the masternodes will and should not!
* It's ipv6 enabled, tor/onion will follow

## Installation

SSH to your VPS and clone the Github repository:

```bash
git clone https://github.com/sevendoorknobs/DMNQI.git && cd vps
```

Install & configure your desired master node with options:

```bash
./install.sh -p divi
```

## Examples for typical script invocation

These are only a couple of examples for typical setups. Check my [easy step-by-step guide for [vultr](/docs/masternode_vps.md) that will guide you through the hardest parts.

**Install & configure 4 DIVI masternodes:**

```bash
./install.sh -p divi -c 4
```

**Update daemon of previously installed DIVI masternodes:**

```bash
./install.sh -p divi -u
```

**Install 6 DIVI masternodes with the git release tag "tags/v1.0.4-core"**

```bash
./install.sh -p divi -c 6 -r "tags/v1.0.4-core"
```

**Wipe all DIVI masternode data:**

```bash
./install.sh -p divi -w
```

**Install 2 DIVI masternodes and configure sentinel monitoring:**

```bash
./install.sh -p divi -c 2 -s
```

## Options

The _install.sh_ script support the following parameters:

| Long Option  | Short Option | Values              | description                                                         |
| :----------- | :----------- | ------------------- | ------------------------------------------------------------------- |
| --project    | -p           | project, e.g. "divi" | shortname for the project                                           |
| --net        | -n           | "4" / "6"           | ip type for masternode. (ipv)6 is default                           |
| --release    | -r           | e.g. "tags/v3.0.4"  | a specific git tag/branch, defaults to latest tested                |
| --count      | -c           | number              | amount of masternodes to be configured                              |
| --update     | -u           | --                  | update specified masternode daemon, combine with -p flag            |
| --sentinel   | -s           | --                  | install and configure sentinel for node monitoring                  |
| --wipe       | -w           | --                  | uninstall & wipe all related master node data, combine with -p flag |
| --help       | -h           | --                  | print help info                                                     |
| --startnodes | -x           | --                  | starts masternode(s) after installation                             |