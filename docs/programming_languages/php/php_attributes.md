# PHP Attributes

## example of using attributes to register middlewares
```php
// ControllerClass.php
#[MiddlewareAttribute(CSRFMiddleware::class)]
class ControllerClass
{
    #[MiddlewareAttribute(Auth::class)]
    public function get()
    {
        //logic 
    }
}
```

```php
// MiddlewareAttribute.php
#[\Attribute] class MiddlewareAttribute
{
    public function __construct(...$middlewares)
    {
    }
}
```

```php
// Get middlewares
$controller = new ControllerClass();
$middlewares = [];
$reflection = new ReflectionClass($controller);
$attributes = $reflection->getAttributes(MiddlewareAttribute::class);
foreach ($attributes as $attribute) {
    $arguments = $attribute->getArguments();
    foreach($arguments as $argument) {
        $middlewares[] = $argument;
    }
}

$method = $reflection->getMethod("get");
$attributes = $method->getAttributes(MiddlewareAttribute::class);
foreach ($attributes as $attribute) {
    $arguments = $attribute->getArguments();
    foreach($arguments as $argument) {
        $middlewares[] = $argument;
    }
}
```
