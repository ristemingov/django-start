rundev:
	docker-compose -f docker-compose.prod.yml down -v && docker-compose down -v && docker-compose up -d --build && docker-compose exec web python manage.py migrate --noinput && docker-compose exec web python manage.py collectstatic --no-input --clear

runprod:
	docker-compose -f docker-compose.prod.yml down -v && docker-compose -f docker-compose.prod.yml up -d --build && docker-compose -f docker-compose.prod.yml exec web python manage.py migrate --noinput && docker-compose -f docker-compose.prod.yml exec web python manage.py collectstatic --no-input --clear

logprod:
	docker-compose -f docker-compose.prod.yml logs -f
