#!/bin/bash

# FHGRC belegen:
FHGRC=/home/johannes/.fhgrc_linux
export FHGRC

# Nun den NTX-Client starten
exec ntx-client "$@"
