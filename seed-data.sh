#!/bin/bash

# Seed data script for TodoApi
# This script creates TodoTasks and TodoItems for a .NET Web API + Angular todo application project
# TodoItems are organized into TodoTasks using TaskId references

BASE_URL="https://localhost:7133"
TASKS_URL="$BASE_URL/TodoTask"
ITEMS_URL="$BASE_URL/TodoItems"

echo "========================================="
echo "Seeding TodoTasks and TodoItems"
echo "========================================="
echo ""

# Create TodoTasks first (they will get IDs 1-10)
echo "Creating TodoTasks..."
echo ""

echo "Task 1: Backend API Development"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Backend API Development", "isActive": true}' > /dev/null

echo "Task 2: Database Design & Migrations"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Database Design & Migrations", "isActive": true}' > /dev/null

echo "Task 3: Authentication & Authorization"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Authentication & Authorization", "isActive": true}' > /dev/null

echo "Task 4: API Features & Enhancements"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "API Features & Enhancements", "isActive": true}' > /dev/null

echo "Task 5: Angular Frontend Setup"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Angular Frontend Setup", "isActive": true}' > /dev/null

echo "Task 6: Angular Components & UI"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Angular Components & UI", "isActive": true}' > /dev/null

echo "Task 7: State Management & Features"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "State Management & Features", "isActive": true}' > /dev/null

echo "Task 8: Testing & Quality Assurance"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Testing & Quality Assurance", "isActive": false}' > /dev/null

echo "Task 9: DevOps & Deployment"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "DevOps & Deployment", "isActive": false}' > /dev/null

echo "Task 10: Documentation & Polish"
curl -k -s -X POST $TASKS_URL -H "Content-Type: application/json" -d '{"name": "Documentation & Polish", "isActive": false}' > /dev/null

echo ""
echo "✓ Created 10 TodoTasks"
echo ""
echo "Creating TodoItems grouped by Tasks..."
echo ""

# Task 1: Backend API Development (TaskId: 1)
echo "└─ Task 1 Items (Backend API Development)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 1, "name": "Set up .NET 8 Web API project structure with proper layering and dependency injection", "isComplete": true}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 1, "name": "Implement Entity Framework Core DbContext with TodoTask and TodoItem entities", "isComplete": true}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 1, "name": "Create TodoTaskController with GET, POST, PUT, DELETE endpoints", "isComplete": true}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 1, "name": "Create TodoItemsController with CRUD operations and TaskId filtering", "isComplete": true}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 1, "name": "Implement DTOs to prevent over-posting and hide sensitive fields like Secret", "isComplete": true}' > /dev/null

# Task 2: Database Design & Migrations (TaskId: 2)
echo "└─ Task 2 Items (Database Design & Migrations)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 2, "name": "Design database schema with Users, TodoTasks, and TodoItems relationships", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 2, "name": "Create Entity Framework Core initial migration with all entity configurations", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 2, "name": "Configure foreign key relationship between TodoItem.TaskId and TodoTask.Id", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 2, "name": "Add database seeding logic for demo data in development environment", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 2, "name": "Implement soft delete functionality using IsDeleted flag on both entities", "isComplete": false}' > /dev/null

# Task 3: Authentication & Authorization (TaskId: 3)
echo "└─ Task 3 Items (Authentication & Authorization)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 3, "name": "Implement JWT authentication middleware with token generation and validation", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 3, "name": "Create User model with password hashing using BCrypt or PBKDF2", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 3, "name": "Build registration endpoint with email validation and duplicate checking", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 3, "name": "Build login endpoint returning JWT access and refresh tokens", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 3, "name": "Add authorization policies to ensure users can only access their own todos", "isComplete": false}' > /dev/null

# Task 4: API Features & Enhancements (TaskId: 4)
echo "└─ Task 4 Items (API Features & Enhancements)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Configure CORS policy to allow Angular frontend on different ports/domains", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Add pagination support with PagedResult wrapper returning total count and items", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Implement filtering by TaskId, completion status, and date range", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Add sorting capabilities by created date, priority, name, and completion", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Create search endpoint to find todos by title or description using LIKE query", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Implement global exception handling middleware returning consistent error format", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 4, "name": "Add input validation using FluentValidation with custom validation rules", "isComplete": false}' > /dev/null

# Task 5: Angular Frontend Setup (TaskId: 5)
echo "└─ Task 5 Items (Angular Frontend Setup)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Initialize Angular 17+ project with standalone components and new control flow", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Configure Angular Material UI library for consistent design system and components", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Set up HttpClient with interceptors for JWT token injection and error handling", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Create API service layer with methods for TodoTask and TodoItem CRUD operations", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Implement authentication service with login, logout, and token refresh logic", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 5, "name": "Configure route guards to protect authenticated routes from unauthorized access", "isComplete": false}' > /dev/null

# Task 6: Angular Components & UI (TaskId: 6)
echo "└─ Task 6 Items (Angular Components & UI)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Build task-list component displaying all TodoTasks with item counts", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Create task-detail component showing all TodoItems for selected task", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Develop todo-item component with inline editing and completion checkbox toggle", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Implement add-task dialog component with reactive forms and validation", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Build add-item form component with task selection dropdown", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Create login and registration components with form validation and error display", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 6, "name": "Implement navigation header with user profile, logout, and theme toggle", "isComplete": false}' > /dev/null

# Task 7: State Management & Features (TaskId: 7)
echo "└─ Task 7 Items (State Management & Features)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 7, "name": "Integrate NgRx or signals-based state management for application state", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 7, "name": "Implement optimistic UI updates for instant feedback on create/update/delete", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 7, "name": "Add drag-and-drop functionality using Angular CDK for reordering tasks and items", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 7, "name": "Implement dark mode theme toggle with preference saved to localStorage", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 7, "name": "Create filtering UI for showing active/completed/all items per task", "isComplete": false}' > /dev/null

# Task 8: Testing & Quality Assurance (TaskId: 8)
echo "└─ Task 8 Items (Testing & Quality Assurance)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 8, "name": "Write unit tests for API controllers using xUnit, Moq, and FluentAssertions", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 8, "name": "Create integration tests for database operations using WebApplicationFactory", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 8, "name": "Implement Angular component tests using Jasmine and Testing Library", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 8, "name": "Add end-to-end tests using Playwright for critical user flows and scenarios", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 8, "name": "Set up code coverage reporting with minimum 80% threshold requirement", "isComplete": false}' > /dev/null

# Task 9: DevOps & Deployment (TaskId: 9)
echo "└─ Task 9 Items (DevOps & Deployment)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Create Dockerfile for .NET API with multi-stage build optimization", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Create Dockerfile for Angular app with nginx for production serving", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Set up docker-compose.yml for local development with API, frontend, and database", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Configure GitHub Actions CI/CD pipeline with build, test, and deploy stages", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Deploy .NET API to Azure App Service with connection string configuration", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 9, "name": "Deploy Angular frontend to Azure Static Web Apps or Vercel with environment variables", "isComplete": false}' > /dev/null

# Task 10: Documentation & Polish (TaskId: 10)
echo "└─ Task 10 Items (Documentation & Polish)..."
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 10, "name": "Generate Swagger/OpenAPI documentation with detailed descriptions for all endpoints", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 10, "name": "Write comprehensive README with project overview, setup instructions, and architecture", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 10, "name": "Implement structured logging with Serilog to file and console sinks", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 10, "name": "Add API rate limiting middleware to prevent abuse and ensure fair usage", "isComplete": false}' > /dev/null
curl -k -s -X POST $ITEMS_URL -H "Content-Type: application/json" -d '{"taskId": 10, "name": "Conduct security audit addressing OWASP Top 10 vulnerabilities and XSS/CSRF", "isComplete": false}' > /dev/null

echo ""
echo "========================================="
echo "✓ Seeding Complete!"
echo "========================================="
echo "Created:"
echo "  - 10 TodoTasks (organizing categories)"
echo "  - 50 TodoItems (grouped by TaskId)"
echo ""
echo "To verify, run:"
echo "  curl -k https://localhost:7133/TodoTask"
echo "  curl -k https://localhost:7133/TodoItems"
echo "========================================="
