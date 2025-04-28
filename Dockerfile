# Tomcat oficial con JDK 21 (vale 17, 20… mientras tu WAR sea Java ≥ 8)
FROM tomcat:9.0-jdk21

# Borramos los ejemplos que vienen por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiamos tu WAR y lo dejamos como ROOT.war  →  servirá en  /
COPY ROOT.war /usr/local/tomcat/webapps/ROOT.war

# Puerto expuesto por Tomcat
EXPOSE 8080

# Arrancar Tomcat
CMD ["catalina.sh", "run"]
