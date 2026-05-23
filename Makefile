COMPOSE_FILE=deployment/docker-compose.yml

up:
	docker compose -f $(COMPOSE_FILE) up

up-build:
	docker compose -f $(COMPOSE_FILE) up --build

down:
	docker compose -f $(COMPOSE_FILE) down

build:
	docker compose -f $(COMPOSE_FILE) build

restart:
	docker compose -f $(COMPOSE_FILE) down
	docker compose -f $(COMPOSE_FILE) up --build

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

backend:
	docker compose -f $(COMPOSE_FILE) exec -w /app/backend backend sh

postgres:
	docker compose -f $(COMPOSE_FILE) exec postgres psql -U postgres -d newspulse

migrate:
	docker compose -f $(COMPOSE_FILE) exec -w /app/backend backend uv run alembic -c alembic.ini upgrade head

makemigrations:
	docker compose -f $(COMPOSE_FILE) exec -w /app/backend backend uv run alembic -c alembic.ini revision --autogenerate -m "$(m)"

worker:
	docker compose -f $(COMPOSE_FILE) exec worker sh

clean:
	docker compose -f $(COMPOSE_FILE) down -v