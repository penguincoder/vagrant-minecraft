# Vagrant + Minecraft Server

## Why?

There are simple servers for most Unix and Windows operating systems, sure, but do you want the hassle of installing Java and its constant need for updates? Do you want to manage starting the actual server itself? Probably not. I know I don't want to.

This is also helpful to give to your buddies so they can run their own local server, or it's very handy for a LAN party.

This stack uses the vanilla Minecraft server, Minecraft Overviewer set to the leaflet development branch, and caddy to serve static HTML files.

## How?

* Install [Vagrant](http://vagrantup.com)
* Install [VirtualBox](https://www.virtualbox.org/) if you don't already have one.
* Clone this repo
* `vagrant up`

## Alternative How?

If you want to run this stack directly, without the use of a VM, the process is painless. You do need a few things installed, but the list of required items is quite short. You need an 'ecosystem' directory (just a place to put the server and the overviewer). For instance, this might be `/home/notch/mcserver`. It is not likely to be the Vagrant default, so be sure and set this variable!

* Install [Docker](http://docker.com)
* Ensure GNU Make is installed (specific to your operating system)
* `export MC_HOME=/path/to/minecraft/ecosystem` somewhere, probably in your `~/.bashrc`
* `cd vagrant-minecraft && ./provision.sh`

Once the ecosystem is up and running (check with `docker ps`), you can remove and restart individual components by `cd`ing into the directory and then running `make clean && make` for the minecraft server, overviewer, and caddy.

## What this provides

This repository gives you access to a fresh-built VM hosting the newest version of vanilla Minecraft. It also generates a map of your world and keeps it up to date daily. There is nothing for you to do or configure. It Just Works(TM).

### From your machine

* Map: http://localhost:8088
* Server: localhost:25565

### From other machines

* Map: http://your-ip-or-dns:8088
* Server: your-ip-or-dns:25565

You will need to manage your local firewall settings accordingly. This process works much better if you have local DNS resolution from a fine product like [pfSense](http://pfsense.org) or [DD-WRT](http://www.dd-wrt.com/).
