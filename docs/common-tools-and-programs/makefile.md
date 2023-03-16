# makefile

* run actions with arguments:
  * Makefile:
  ```
  artisan:
    php artisan $(arg)
  ```
  * command: `make artisan arg=migrate`