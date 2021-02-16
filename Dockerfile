FROM openjdk:8-jdk-alpine3.9
RUN apk update and apk add
RUN apk add --update maven

RUN apk add --update git
RUN git clone https://github.com/lajus/amie-utils
RUN cd amie-utils/javatools/ && mvn install
#RUN apt-get update -y && apt-get install maven -y
COPY ./. /
CMD ["mvn", "clean", "install"]
CMD ["mvn", "test"]

# copy the packaged jar file into our docker image
#COPY target/demo-0.0.1-SNAPSHOT.jar /demo.jar

# set the startup command to execute the jar
#CMD ["java", "-jar", "/.jar"]