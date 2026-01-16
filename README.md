# Recipe REST API with Python & Django

This project is a fully functional REST API built with Python, Django, and Django REST Framework. It includes features for user authentication, recipe management, and image uploading, all containerized using Docker.

## 🚀 Features

- **User Authentication**: Register and login users using Token Authentication.
- **Recipe Management**: Create, view, update, and delete recipes.
- **Ingredients & Tags**: Manage ingredients and tags for recipes.
- **Image Upload**: Upload and manage images for recipes.
- **Filtering**: (Implied capability pending implementation)
- **Documentation**: Auto-generated interactive API documentation using Swagger/OpenAPI.

## 🛠 Tech Stack

- **Python** (3.9+)
- **Django** (Web Framework)
- **Django REST Framework** (API Toolkit)
- **PostgreSQL** (Database)
- **Docker & Docker Compose** (Containerization)
- **Drf-spectacular** (API Schema generation)
- **Flake8** (Linting)

## 🐳 Running Locally with Docker

This project uses Docker to ensure a consistent development environment.

### Prerequisites

- [Docker](https://www.docker.com/get-started) installed on your machine.
- [Docker Compose](https://docs.docker.com/compose/install/) installed.

### Steps

1.  **Clone the repository**:
    ```sh
    git clone <your-repo-url>
    cd <your-project-directory>
    ```

2.  **Build and Run**:
    ```sh
    docker-compose up
    ```
    This command will build the Docker image and start the Django development server along with a PostgreSQL database.

    The API will be available at [http://127.0.0.1:8000/](http://127.0.0.1:8000/).

3.  **Run Migrations** (if not done automatically):
    ```sh
    docker-compose run --rm app sh -c "python manage.py migrate"
    ```

4.  **Create a Superuser**:
    ```sh
    docker-compose run --rm app sh -c "python manage.py createsuperuser"
    ```

## 🧪 Running Tests & Linting

To ensure code quality, you can run the test suite and linter using Docker.

- **Run Tests**:
    ```sh
    docker-compose run --rm app sh -c "python manage.py test"
    ```

- **Run Linting (Flake8)**:
    ```sh
    docker-compose run --rm app sh -c "flake8"
    ```

## 📖 API Documentation

The API comes with auto-generated documentation via Swagger.

- **Swagger UI**: Visit [http://127.0.0.1:8000/api/docs/](http://127.0.0.1:8000/api/docs/) to explore and test the API endpoints interactively.
- **Schema**: The raw OpenAPI schema is available at [http://127.0.0.1:8000/api/schema/](http://127.0.0.1:8000/api/schema/).

## 📁 Project Structure

```text
.
├── app/
│   ├── app/            # Project configuration
│   ├── core/           # Core models and shared components
│   ├── recipe/         # Recipe API logic (views, serializers, tests)
│   ├── user/           # User API logic
│   └── manage.py
├── Dockerfile          # Docker image definition
├── docker-compose.yml  # Docker services config
├── requirements.txt    # Production dependencies
└── requirements.dev.txt # Development dependencies
```