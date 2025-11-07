FROM maven:3.9.6-eclipse-temurin-21 AS builder

# Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiamos solo el pom.xml para aprovechar el cache de capas de Docker
COPY pom.xml .
RUN mvn dependency:go-offline

# Copiamos el resto del código fuente de la aplicación
COPY src ./src

# Compilamos la aplicación y la empaquetamos en un .jar, saltando los tests.
RUN mvn clean package -DskipTests


# --- Etapa 2: Ejecución (Runner Stage) ---
#
# === CAMBIO CLAVE AQUÍ ===
# Usamos Eclipse Temurin en lugar de OpenJDK oficial
# Esta es la distribución recomendada y mantenida por la comunidad
#
FROM eclipse-temurin:21-jre-alpine

# Establecemos el directorio de trabajo
WORKDIR /app

# Copiamos solo el archivo .jar compilado desde la etapa anterior
COPY --from=builder /app/target/*.jar app.jar

# Exponemos el puerto 8080, que es donde corre nuestra aplicación Spring Boot
EXPOSE 8080

# El comando que se ejecutará cuando el contenedor se inicie
ENTRYPOINT ["java", "-jar", "app.jar"]