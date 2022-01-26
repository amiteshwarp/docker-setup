@ECHO OFF
IF "%1" equ "" (
 set command=start
) else (
 set command=%1
)
call set host=%%COMPUTERNAME:-= %%
for /f "tokens=2" %%G IN ( "%host%" ) DO set host=%%G
IF /i %command%  equ start (
	docker-compose -f docker-compose.individual.yml up -d --build
	docker exec redis-container redis-server /etc/redis/sentinel.conf --sentinel
	docker exec redis-container service redis-server start
	docker exec xmpp-container service ejabberd start
	docker exec rabbit-container service rabbitmq-server start
	docker exec apache-container ./srv/www/vhosts/trunk/Mounts/DevelopmentEnvironmentTools/Docker/Scripts/ConfigureApache.sh %host%
	docker exec apache-container service apache2 start
) 

IF /i %command% equ stop (
	docker-compose -f docker-compose.individual.yml down
	111386/‐
	103,386/‐
	93886/‐
)