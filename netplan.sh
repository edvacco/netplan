#!/bin/bash
# $RANDOM returns a different random integer at each invocation. Nominal range: 0 - 32767 (signed 16-bit integer).
echo -e  "$1   -   $2   -   $3"
#USAR:
#./netplan.sh IP GATEWAY MAC
#================================================
#TABELINHA DE CORES
#================================================
VERDE1='\033[92m'
VERDE='\033[1;32m'
SUMBLINHADOVERDE='\033[4;32m'
VERNELHO='\033[91m'
ALERTA='\033[93m'
DOURADO='\033[0;33m'
AMARELO='\033[1;33m'
VERMELHO3='\033[0;31m'
VERMELHO2='\033[1;31m'
SUMBLINHADO='\033[4m'
FIM='\033[0m'
#================================================



echo -e  "${DOURADO}/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////${FIM}"
echo -e  "                                            ${SUMBLINHADO}PARAMETRO 1: $1                  ${FIM}"
echo -e  "                                            ${SUMBLINHADO}PARAMETRO 2: $2                  ${FIM}"
echo -e  "                                            ${SUMBLINHADO}PARAMETRO 3: $2                  ${FIM}"
echo -e  "${DOURADO}/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////${FIM}"


#EXEMPLO CONSIDERANDO QUE O IP É 142.54.179.187 GATEWAY É 142.54.179.185 E O MAC É 1E:64:28:2D:60:14 DO TEMPLATE


sed -i 's/142.54.179.187/$1/g' /etc/netplan/50-cloud-init.yaml;
sed -i 's/142.54.179.185/$2/g' /etc/netplan/50-cloud-init.yaml;
sed -i 's/1E:64:28:2D:60:14/$3/g' /etc/netplan/50-cloud-init.yaml;


cd /etc/netplan/

netplan try

netplan apply



