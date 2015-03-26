# Vagrant + Minecraft Server

## Why?

There are simple servers for most Unix and Windows operating systems, sure, but do you want the hassle of installing Java and its constant need for updates? Do you want to manage starting the actual server itself? Probably not. I know I don't want to.

This is also helpful to give to your buddies so they can run their own local server, or it's very handy for a LAN party.

## How?

* Install [Vagrant](http://vagrantup.com)
* Install [VirtualBox](https://www.virtualbox.org/) if you don't already have one.
* Clone this repo
* `vagrant up`

## What this provides

This repository gives you access to a fresh-built VM hosting the newest version of vanilla Minecraft. It runs the server out of memory and will periodically write new changes to disk. It supports log rotation and daily backups of the server. It also generates a Google Map of your world and keeps it up to date daily. There is nothing for you to do or configure. It Just Works(TM).

### From your machine

* Map: http://localhost:8088
* Server: localhost:25565

### From other machines

* Map: http://your-ip-or-dns:8088
* Server: your-ip-or-dns:25565

You will need to manage your local firewall settings accordingly. This process works much better if you have local DNS resolution from a fine product like [pfSense](http://pfsense.org) or [DD-WRT](http://www.dd-wrt.com/).
