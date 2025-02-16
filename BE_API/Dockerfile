# Maven con JDK 23 para compilar
FROM maven:3.9.6-eclipse-temurin AS build
WORKDIR /app
COPY . .
# RUN mvn clean package -DskipTests

# OpenJDK 23 para ejecutar la aplicación
FROM eclipse-temurin:23-jdk
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]