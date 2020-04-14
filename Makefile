POSTGRESQL_URL := postgres://xk:password@localhost:25432/xk?sslmode=disable

dev:
	@docker run -p 0.0.0.0:25432:5432 --name system-xk -e POSTGRES_PASSWORD=password -e POSTGRES_USER=xk -e POSTGRES_DB=xk -d postgres:11

rm:
	@docker stop system-xk
	@docker rm system-xk

file:
	@./migrate create -ext sql -dir src -seq create_table

up:
	@echo you should download migrate yourself @ github.com/golang-migrate/migrate
	@./migrate -database ${POSTGRESQL_URL} -path src up

down:
	@./migrate -database ${POSTGRESQL_URL} -path src down