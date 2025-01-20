#composer
update:
	composer install

#php
check:
	composer check

csfix:
	composer fix

start:
	php -S localhost:8000 -t public

#docker
docker-start:
	docker-compose up -d

docker-stop:
	docker-compose down

docker-restart: docker-stop docker-start