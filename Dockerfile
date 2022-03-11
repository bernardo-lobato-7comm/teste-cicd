FROM openjdk:11
VOLUME /tmp
ADD /target/teste-ci*.jar app.jar

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]