# ---------- Fase de compilación ----------
FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q package -DskipTests     # genera target/APICompilador.war

# ---------- Fase de ejecución ----------
FROM tomcat:9.0-jdk21
# Render expone su puerto en la variable $PORT; Tomcat usa 8080 por defecto → OK.
ENV CATALINA_OPTS="-Dfile.encoding=UTF-8"
COPY --from=build /app/target/APICompilador.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh", "run"]
