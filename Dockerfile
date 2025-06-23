FROM maven:3.9.4-eclipse-temurin-17 AS builder
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:11-ea-17-jdk-slim
WORKDIR /app_public
COPY --from=builder /app/target/MultiTool-0.0.1-SNAPSHOT.jar ./app_public.jar
EXPOSE 8080
CMD ["java", "-jar", "app_public.jar"]]