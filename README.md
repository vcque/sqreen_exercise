# Sqreen Exercise

The goal is to inject a jar into a base tomcat installation. This jar must add a custom header "X-implemented-By: Sqreen" on each http response.

## How does it work

The `org.apache.coyote.Response` class has been duplicated and modified so that `Response#sendHeaders` adds the custom header before sending them.

The class is then injected into $CATALINA_HOME/lib with an early alphabetical order placement so that it gets priority on the default Tomcat class.

## Running it

Just run the docker image :
```
sudo docker build -t sqreen_exercise . && sudo docker run sqreen_exercise
```
