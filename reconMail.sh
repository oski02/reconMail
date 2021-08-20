#!/bin/bash
clear
source /dev/stdin <<< "$(wget -qO- raw.githubusercontent.com/hschne/spinny/master/spinny.sh)" ; home="$(pwd)"

  SPINNY_FRAMES=(. .. ... .... ..... " ...." "  ..." "   .." "    ." "      " . .. ... .... ..... " ...." "  ..." "   .." "    ." "      ")
  SPINNY_DELAY=0.1
printf "\033[1;31m\n\n"
printf "\033[1;37m ██████╗░███████╗░█████╗░░█████╗░███╗░░██╗███╗░░░███╗░█████╗░██╗██╗░░░░░\n"
printf "\033[1;37m ██╔══██╗██╔════╝██╔══██╗██╔══██╗████╗░██║████╗░████║██╔══██╗██║██║░░░░░\n"
printf "\033[1;36m ██████╔╝█████╗░░██║░░╚═╝██║░░██║██╔██╗██║██╔████╔██║███████║██║██║░░░░░\n"
printf "\033[1;36m ██╔══██╗██╔══╝░░██║░░██╗██║░░██║██║╚████║██║╚██╔╝██║██╔══██║██║██║░░░░░\n"
printf "\033[1;31m ██║░░██║███████╗╚█████╔╝╚█████╔╝██║░╚███║██║░╚═╝░██║██║░░██║██║███████╗\n"
printf "\033[1;31m ╚═╝░░╚═╝╚══════╝░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝╚══════╝\n"
printf "\033[1;37m\n\n"
printf '                              █▄▄ █▄█   ▀▄▀ ▀█ █▀ █▀\n'
printf '                              █▄█ ░█░   █░█ █▄ ▄█ ▄█\n'
printf '\n'
printf '\n'
printf '\n'
printf "\033[1;30m ReconMail es una tool para recolectar correos de una organizacion para  ayudar en las tareas de Pentesting.\n"
printf "\033[1;30m El creador de esta herramienta no se hace responsable del mal uso de la misma.\n"
printf '\n'
printf "\033[0;31m NOTA: Dado que se utiliza la API Gratuita de PhoneBook  hay un limite de busquedas al dia.\n"
printf "\033[0m\n\n" ; homedir="$(pwd)"

#ApiKey PhoneBook
key="c7ca2255-89d1-4b9f-bc88-97fe781dd631" 

trap ctrl_c INT
function ctrl_c(){
	printf "\033[0;31m\n\n Saliendo...\n"
	exit 0
}

printf "\033[1;36m\n\nComprobando acceso\n"
spinny::start
sleep 1
spinny::stop
printf '\033[1;32m'" 🆁🅴🅲🅾🅽🅼🅰🅸🅻   ✔  \n"'\033[0m\n'
printf '\033[1;37m'
read -p "[*] Introduce el dominio para buscar los correos: " dominio
file="mails-$dominio.txt"

#Para Debug
#export {http,https,ftp}_proxy='http://127.0.0.1:8080'

function CorreosPhoneBook(){
consulta=$(curl  -s -k -X 'POST' \
    -H 'Host: public.intelx.io' \
    -H 'Content-Length: 123' \
    -H 'Sec-Ch-Ua: \"Chromium\";v=\"92\", \" Not A;Brand\";v=\"99\", \"Google Chrome\";v=\"92\"' \
    -H 'Accept: */*' \
    -H 'Sec-Ch-Ua-Mobile: ?0' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36' \
    -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'Origin: https://phonebook.cz' \
    -H 'Sec-Fetch-Site: cross-site' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Referer: https://phonebook.cz/' \
    -H 'Accept-Encoding: gzip, deflate' \
    -H 'Accept-Language: es-ES,es;q=0.9' \
    --data-binary "{"'"term"'":"'"'$dominio'"'","'"maxresults"'":10000,"'"media"'":0,"'"target"'":2,"'"timeout"'":20}" \
    "https://public.intelx.io/phonebook/search?k=$key" | jq '.id' | sed 's/"//g' )
if [ -z "$consulta" ];
then
    spinny::start
    sleep 2
    clear
    printf '\n'
    printf "\033[1;36m    .---------.\n"
    printf "\033[1;36m    |.-------.|\n"
    printf "\033[1;36m    ||>Error#||\n"
    printf "\033[1;36m    ||       ||\n"
    printf "\033[1;36m    |'-------'|etf\n"
    printf "\033[1;36m  .-^---------^-.\n"
    printf "\033[1;36m  | ---~   AMiGA|\n"
    printf "\033[1;36m  '-------------'\n"
	printf "\033[0;31mGuru meditation: Se ha finalizado por hoy el número máximo de busquedas gratuitas diarias, intentalo mañana.\n"
	spinny::stop
	exit 0;
else
salida=$(curl  -s -k -X 'GET' \
    -H 'Host: public.intelx.io' \
    -H 'Sec-Ch-Ua: "Chromium";v="92", " Not A;Brand";v="99", "Google Chrome";v="92"' \
    -H 'Accept: */*' \
    -H 'Sec-Ch-Ua-Mobile: ?0' \
    -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.131 Safari/537.36' \
    -H 'Origin: https://phonebook.cz' \
    -H 'Sec-Fetch-Site: cross-site' \
    -H 'Sec-Fetch-Mode: cors' \
    -H 'Sec-Fetch-Dest: empty' \
    -H 'Referer: https://phonebook.cz/' \
    -H 'Accept-Encoding: gzip, deflate' \
    -H 'Accept-Language: es-ES,es;q=0.9' \
    "https://public.intelx.io/phonebook/search/result?k=$key&id=$consulta&limit=10000" | jq | grep "Email" -A 1 | grep "selectorvalue" | awk '{print $2}' | tr '",' '\r' | tee $file)
fi
}

CorreosPhoneBook

printf "\033[1;36m\nObteniendo correos de $dominio \n"
spinny::start
sleep 2
cat $file
spinny::stop
printf '\n\n'
printf "\033[0,33mRESULTADO:\n"
printf "\033[1,36m------------------------------------------------------------------------------\n"
printf "\033[0;32m   Se han encontrado un total de $(wc -l $file | awk '{print $1}') correos.   ✔ \033[0m\n"
printf "\033[0;32m   Fichero Guardado en $file  ✔ \033[0m\n"
printf "\033[1,36m------------------------------------------------------------------------------\n"
printf '\n\n'

exit 0;

