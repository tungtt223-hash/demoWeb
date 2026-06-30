# Bước 1: Build dự án bằng Maven với JDK 21
FROM maven:3.9.6-eclipse-temurin-21-jammy AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Bước 2: Chạy ứng dụng bằng Tomcat 10 (Hỗ trợ JDK 21)
FROM tomcat:10.1-jdk21-openjdk-slim
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
