# 🎬 MovieMatch Backend

> REST API backend for **MovieMatch**, an application that connects two users through a shared token to discover movies and make a *match* when both like the same one.

---

## 🧩 Description

**MovieMatch** is a platform for choosing movies together.  
Two users connect to a shared session via a unique token, explore a catalog of movies, and swipe to indicate whether they like them or not.  
When both users like the same movie, the system detects a **match** 🎯.

This repository contains **the backend** built with **Spring Boot**, responsible for:
- Managing users, sessions, and preferences.
- Exposing REST endpoints.
- Connecting to a SQL database.
- Providing authentication (JWT) and documentation (Swagger/OpenAPI).

---

## ⚙️ Technology Stack

| Layer | Technology |
|--------|-------------|
| **Language** | Java 21 |
| **Framework** | Spring Boot 3.5.7 |
| **ORM** | Spring Data JPA (Hibernate) |
| **Database** | PostgreSQL |
| **Security** | Spring Security + JWT |
| **Build Tool** | Maven |
| **Development Environment** | IntelliJ IDEA |
| **Version Control** | Git + GitHub |

---

## 🧱 Project Architecture

```
src/
 ├── main/java/com/moviematch
 │     ├── controller      # REST Endpoints
 │     ├── service         # Business logic
 │     ├── model           # JPA Entities
 │     ├── repository      # Persistence interfaces
 │     ├── config          # Security, CORS, Swagger
 │     └── dto             # Data Transfer Objects
 └── resources/
       ├── application.properties
       └── data.sql        # (optional) initial data
```

---

## 🚀 Quick Start

### 1️⃣ Clone the repository
```bash
git clone https://github.com/yourusername/moviematch-backend.git
cd moviematch-backend
```

### 2️⃣ Configure the database
Edit `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:postgresql://localhost:5432/moviematch
spring.datasource.username=postgres
spring.datasource.password=your_password
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
```

### 3️⃣ Run the application
From IntelliJ or terminal:
```bash
./mvnw spring-boot:run
```

The API will be available at:
> 🔗 http://localhost:8080/api/v1

---

## 🔐 Authentication (JWT)

The backend uses **JSON Web Tokens (JWT)** for user authentication.  
Basic flow:
1. Register or login → `/auth/register` and `/auth/login`
2. The backend returns a token.
3. Requests to protected endpoints must include:
   ```
   Authorization: Bearer <token>
   ```

---

## 📚 Main Endpoints

| Method | Endpoint | Description |
|--------|-----------|-------------|
| `POST` | `/auth/register` | Register a new user |
| `POST` | `/auth/login` | Login and get a token |
| `POST` | `/sessions` | Create a session (shared token) |
| `POST` | `/sessions/join` | Join an existing session |
| `GET` | `/movies` | List available movies |
| `POST` | `/preferences` | Save "like / dislike" |
| `GET` | `/matches/{sessionId}` | Get matches |

---

## 🧠 System Logic (Summary)

1. **User A** creates a session → gets a unique token.
2. **User B** enters the same token → joins the session.
3. Both view movies and send their likes.
4. When both like the same movie → 🎉 *match* detected.

---

## 🧪 Testing

Unit and integration tests with **JUnit 5** and **Mockito**.

Run tests:
```bash
./mvnw test
```

---

## 🐳 Docker (Optional)

### Basic Dockerfile:
```dockerfile
FROM openjdk:21-jdk
WORKDIR /app
COPY target/moviematch-backend.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
```

### Build and run:
```bash
mvn clean package -DskipTests
docker build -t moviematch-backend .
docker run -p 8080:8080 moviematch-backend
```

---

## ☁️ Deployment

This project can be easily deployed on:

- **Render** or **Railway** (GitHub automated build)
- **AWS EC2** with Docker

Set environment variables for sensitive credentials:
```
DB_URL
DB_USERNAME
DB_PASSWORD
JWT_SECRET
```

---

## 🧩 Frontend Integration

The frontend (Angular) consumes the API at:

```js
export const API_URL = "https://api.moviematch.com/api/v1";
```

---

## 📦 Versioning

Following **Semantic Versioning (SemVer)** convention:
```
v1.0.0 - Initial MVP
v1.1.0 - JWT + Swagger Implementation
v2.0.0 - TMDB API + WebSockets Integration
```

---

## 👨‍💻 Author

**Oriol Farràs Sans**  
Backend Developer | Java / Spring Boot  
📫 oriolfarras2004@gmail.com  
🌐 https://github.com/Oriol-Farras

---

## 🧾 License

This project is licensed under the **MIT License**.  
See the LICENSE file for more details.

---

> “Clean code is not written by following rules. It’s written by following empathy.”  
> — Robert C. Martin
