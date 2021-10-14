#
<p align="center">
<img src="images/reconMail.png"
	alt="reconMail logo"
	width="300"
	style="float: left; margin-right: 10px;" />
</p>

**reconMail** es una Herramienta OSINT para recolectar correos electrónicos de una organización, ideal para **BugBountys**, **Pentesting**, **Hackers Éticos**, **REDTEAM**, etc. \

Además puede utilizarse junto con otras herramientas, como h8mail,  para detectar si los correos recolectados por reconMail tienen algún Leak de información.

**IMPORTANTE**: Dado que se utiliza el servicio Gratuito de PhoneBook (intelX.io) el numero de busquedas queda limitado diariamente.
              **El creador de esta herramienta no se hace responsable del mal uso de la misma.**

Instalación
======

```git clone https://github.com/oski02/reconMail.git ```\
```cd reconMail``` \
```chmod +x reconMail.sh``` \
```./reconMail.sh``` 

¿Cómo funciona?
======
La herramienta nos preguntará por el dominio que queremos buscar los correos, una vez introducido nos mostrará por pantalla los mails encontrados y nos generará un fichero con todos ellos.

<p align="center">
<img src="images/reconMailAPP.png"
	alt="reconMail logo"
	style="float: left; margin-right: 10px;" />
</p>

Encontrar mails que tengan algún Leak
======

Combinando con la herramienta h8mail podremos ser capaces de detectar si los correos que hemos buscado presentan algún leak de informacion. 

Pasos a seguir:

1. instalamos h8mail

```pip3 install h8mail``` \
Mas info: https://github.com/khast3x/h8mail

2. Ejecutamos reconMail

```./reconMail```

3. Pasamos la salida de reconMail a h8mail

```cat mails-xxx.xx.txt | xargs h8mail -t```

*** HAPPY HUNTING ***
