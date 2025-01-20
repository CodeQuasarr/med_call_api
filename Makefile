
# Ligne de commande du projet Symfony
CONSOLE=php bin/console

FIG=docker compose

# Dans la ligne de commande de notre machine, on vérifie si docker-compose est disponible
HAS_DOCKER:=$(shell command -v $(FIG) 2> /dev/null)
# Si c'est le cas, EXEC et EXEC_DB vont permettre d'exécuter des commandes dans les conteneurs
ifdef HAS_DOCKER
	EXEC=$(FIG) exec app
	EXEC_DB=$(FIG) exec db
# Sinon, on exécute les commandes sur la machine locale
else
	EXEC=
	EXEC_DB=
endif
# ----------------------------------------------------------------------------------------------------------------------

#composer
update:
	composer install

#php
entity: ## Création d'une entité
	$(EXEC) $(CONSOLE) make:entity

check:
	composer check

csfix: ## Correction de la qualité du code
	$(EXEC) composer fix

start:
	php -S localhost:8000 -t public

#docker
docker-start:
	docker-compose up -d

docker-stop:
	docker-compose down

docker-restart: docker-stop docker-start