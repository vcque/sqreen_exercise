FROM tomcat:6.0.48-jre8
MAINTAINER Vincent Ocquet

# Java software engineer job offer exercise
## Exercise
#
# The exercise consits in forcing a Tomact server to send a new HTTP header to the user,  *without modifying the server source code*:
#
# When running a default Tomcat server, the following occurs:
#   $ curl -I http://<my-docker-host>:8888/
#   HTTP/1.1 200 OK
#   Server: Apache-Coyote/1.1
#   Content-Type: text/html;charset=UTF-8
#   Transfer-Encoding: chunked
#   Date: Thu, 24 Mar 2016 16:23:31 GMT
#
# We would like to make it return one additional header:
#   $ curl -I http://<my-docker-host>:8888/
#   HTTP/1.1 200 OK
#   [...]
#   X-Instrumented-By: Sqreen
#
# This should be done by injecting a JAR into Tomcat (https://tomcat.apache.org/tomcat-6.0-doc/class-loader-howto.html).
#
## Result
#
# Candidate should provide us a Dockerfile (possibly other files) that inject the
# JAR into the Tomcat server, starts the server, and allows to retrieve the headers.
#
# This is an exercise
# The code you will produce is part of our technical interview process. You'll own obviously property on everything you will produce.

RUN apt-get update
RUN apt-get install -y openjdk-8-jdk maven

ADD . /sqreen

WORKDIR /sqreen

RUN mvn install

RUN cp target/sqreen.jar $CATALINA_HOME/lib/_sqreen.jar
