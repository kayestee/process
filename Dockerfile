FROM openjdk:11
RUN apk update
RUN apk add --no-cache mariadb-connector-c-dev
RUN apk add --no-cache mysql-client
WORKDIR /www
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} process.jar

ENTRYPOINT ["java", "-jar", "process.jar"]
