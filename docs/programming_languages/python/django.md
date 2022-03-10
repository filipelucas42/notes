# Django

* change password: `python manage.py changepassword <username>`
* start developer server: `python manage.py runserver`
* load data: `python manage.py loaddata fixtures/fixture.json`

## templates
* if statement:
```
{% if obj %}
    test1
{% elif obj.value %}
    test2 
{% else %}
    test3
{% endif %}
```

## deploy
gunicorn command example: `gunicorn arctel_django.wsgi --preload --workers=4 --timeout 300`