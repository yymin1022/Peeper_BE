FROM openjdk:17-slim as builder

WORKDIR /build

COPY ./ ./
RUN chmod +x mvnw
RUN ./mvnw package

FROM openjdk:17-slim

WORKDIR /app

COPY --from=builder /build/target/peeper-0.0.1-SNAPSHOT.jar ./peeper.jar

EXPOSE 8080
CMD ["java", "-jar", "peeper.jar"]
