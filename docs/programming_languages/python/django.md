# Django

* change password: `python manage.py changepassword <username>`
* start developer server: `python manage.py runserver`
* load data: `python manage.py loaddata fixtures/fixture.json`
* dump data: `python3 manage.py dumpdata app.Model --indent 4 > data.json`

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
* gunicorn command example: `gunicorn mysite.wsgi --preload --workers=4 --timeout 300`
* change django settings file: `export DJANGO_SETTINGS_MODULE=mysite.settings`
