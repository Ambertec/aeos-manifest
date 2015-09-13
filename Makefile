#
# Makefile for debugging and testing
#

DEVICE ?= bft
HOST ?= ambertec.local
MACHINE ?= beaglebone

all : update clean build deploy

clean : .clean .clean-$(DEVICE)

.clean :

.clean-bft :

.clean-vhusb :

.clean-core :

build: .build

.build :
	bitbake ambertec-$(DEVICE)-image

deploy: .deploy

.deploy :	
	scp images/ambertec-$(DEVICE).fw root@$(HOST):/tmp/firmware.fw
	ssh root@$(HOST) -C "/usr/sbin/firmware_install /tmp/firmware.fw && /sbin/reboot"

config: .config

.config:
	MACHINE=$(MACHINE) . ./setup-environment

update: .update

.update :
	repo sync
