up:
	docker-compose up
down:
	docker-compose down
test:
	docker-compose exec app rake test
tdd:
	docker-compose exec app rake tdd
integration:
	docker-compose exec app rake integration
feature:
	docker-compose exec app rake feature
shell:
	docker exec -ti app bash
