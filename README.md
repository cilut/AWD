Repositorio creado con el fin de ir teneinedo un registro de nuestra actividad y poder desarrollar esto en condiciones.

### Lo que dijo Eibe sobre el anteproyecto
``` 
Ojo, el problema no es solo la replicación. Es decir, la copia literal. El problema 
incluye la transformación de los datos. De hecho, los sistemas de replicación en el 
operacional contemplan ambos casos.
Mucho ojo con no solapar lo que se debería resolver como un ETL. Tiene que queda clara la diferencia

Calificación: Apto
```
git clone https://github.com/cilut/AWD.git



sudo docker build -t mysql_mod:1.0 mysql/8.0/. 
sudo docker run --name mysql1 -e MYSQL_ROOT_PASSWORD=root -p 3306:3306 -p 22:22 -d mysql_mod:1.0


Cuando lo tengamos levantado entramos en el server, 
	sudo docker exec -it mysql1 mysql -uroot -p
				(La clave de admin es: root)

	SET GLOBAL slow_query_log = 1;
	SET GLOBAL general_log = 1;

	
Pestaña connection:
	Connection Method: Standard TCP/IP over ssh
	ssh hostname: 0.0.0.0:22
	ssh username root
	pass: root	
	hostname: 0.0.0.0 port: 3306
	username: root
	pass: root
Pestaña Remote Management:
	Opcion SSH login base management
	hostname: 0.0.0.0:22
	username:root
	pass: root


Cuando queremos apagar el servidor, y así guarda la configuracíón:
	sudo docker stop mysql1

Y cuando queremos encenderlo:
	sudo docker start mysql1


