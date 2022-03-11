FROM maven:3.8.1-adoptopenjdk-11 as build

ARG BUILD_ID
ENV BUILD_ID=$BUILD_ID

COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean package -DskipTests

FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/teste-ci*.jar /usr/local/lib/teste-ci.jar
EXPOSE 8081
ENTRYPOINT ["java","-jar","/usr/local/lib/teste-ci.jar"]