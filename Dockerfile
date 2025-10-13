# Step 1: Start with a pre-made environment that has Java 11 installed.
FROM openjdk:11-jre-slim

# Step 2: Set the main working folder inside the container.
WORKDIR /app

# Step 3: Copy the Java application (.jar file) that Maven builds
# from the 'target' folder on the Jenkins server into the container.
COPY target/my-app-1.0-SNAPSHOT.jar /app/my-app.jar

# Step 4: Set the default command to run when the container starts.
ENTRYPOINT ["java", "-jar", "/app/my-app.jar"]