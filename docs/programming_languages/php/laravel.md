# laravel

* create resource controller:`php artisan make:controller --resource <ControllerName>`
* create migration: `php artisan make:migration <create_flights_table>`
* create model: `php artisan make:model <ModelName> --migration`
* create model with controller and migration: `php artisan make:model <ModelName> -mrc`
* load different env file: export environment variable `APP_ENV` then the file `.env.[APP_ENV]`
will be loaded

## seeding
* reset database: `php artisan migrate:fresh --seed`
* run seeder: `php artisan db:seed --class=UserTableSeeder`
* create seeder: `php artisan make:seeder UserTableSeeder`

## templates
* refer to route by name: `{{route('routeName')}}`
* csrf token: `@csrf`