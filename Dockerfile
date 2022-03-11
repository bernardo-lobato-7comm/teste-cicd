FROM openjdk:11

ARG BUILD_ID
ENV BUILD_ID=$BUILD_ID

VOLUME /tmp
COPY /target/teste-ci*.jar app.jar

ENTRYPOINT ["java","-jar","/app.jar"]