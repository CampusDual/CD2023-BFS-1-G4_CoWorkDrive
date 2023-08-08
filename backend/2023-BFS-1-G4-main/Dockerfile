FROM maven:3.9.1-eclipse-temurin-11-alpine
WORKDIR /app
COPY ./coworkdrive-api ./coworkdrive-api
COPY ./coworkdrive-boot ./coworkdrive-boot
COPY ./coworkdrive-model ./coworkdrive-model
COPY ./coworkdrive-ws ./coworkdrive-ws
COPY pom.xml .
EXPOSE 33333
RUN mvn install
WORKDIR /app/coworkdrive-boot
CMD mvn spring-boot:run