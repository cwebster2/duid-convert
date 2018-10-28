#!/usr/bin/env bash

# % ./duid-convert "\000\004\323\2421\031 WK5\305\363\221\310\355\017\227J"
# 00:04:D3:A2:31:19:20:57:4B:35:C5:F3:91:C8:ED:0F:97:4A

DUID=$(echo $1 | perl -pe 's[(?:\\([0-7]{1,3})|(.))] [defined($1) ? sprintf("%02X:",oct($1)) : sprintf("%02X:",ord($2))]eg')
echo ${DUID%?} 
