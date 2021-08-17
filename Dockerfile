FROM openjdk:11
RUN ["apt-get", "update"]
RUN ["apt-get", "install", "default-mysql-client", "-y" ]
#RUN apt-get update
#RUN apt-get install  mariadb-connector-c-dev
#RUN apt-get install --no-cache mysql-client
WORKDIR /www
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} process.jar
ENTRYPOINT ["java", "-jar", "process.jar"]
