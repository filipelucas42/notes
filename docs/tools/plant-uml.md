# plant uml

* generate png file: `java -jar plantuml.jar file.pu`
* C$ diagram example with sprites:
```
@startuml
!include <C4/C4_Container>
!include <tupadr3/devicons/redis>
!include <tupadr3/devicons/php>
!include <tupadr3/devicons/nginx>
Person(personAlias, "Request")
Container(nginx, "Reverse Proxy", "Nginx", $sprite="nginx")
System_Boundary(c1, "Cluster"){
    Container(php1, "node 1", "PHP", $sprite="php")
    Container(php2, "node 2", "PHP", $sprite="php")
}

Container(redis, "PHP Session Storage", "Redis", $sprite="redis")
Rel(personAlias, nginx, "Request", "HTTP")
Rel(nginx, php1, "Request", "HTTP")
Rel(nginx, php2, "Request", "HTTP")
Rel(php1, redis, "Redis Request", "TCP")
Rel(php2, redis, "Redis Request", "TCP")
@enduml
```