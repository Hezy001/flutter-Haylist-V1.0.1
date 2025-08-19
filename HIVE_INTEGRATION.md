# Hive Integration for Todo App

This Flutter app now uses Hive for local data persistence. Here's what has been implemented:

## Features

- ✅ **Local Data Storage**: Todos are now stored locally using Hive database
- ✅ **Persistent Data**: Data survives app restarts
- ✅ **CRUD Operations**: Create, Read, Update, Delete todos
- ✅ **Sample Data**: App starts with sample todos if database is empty

## File Structure

```
lib/
├── models/
│   ├── todo.dart          # Todo model with Hive annotations
│   └── todo.g.dart        # Generated Hive adapter
├── services/
│   └── hive_service.dart  # Database operations
├── pages/
│   └── home_page.dart     # Updated to use Hive
└── main.dart              # Initializes Hive
```

## How It Works

1. **Initialization**: Hive is initialized in `main.dart` before the app starts
2. **Model**: `Todo` class is annotated with `@HiveType` and `@HiveField`
3. **Service**: `HiveService` provides methods for database operations
4. **UI**: `HomePage` uses the service to manage todos

## Database Operations

- `HiveService.getAllTodos()` - Get all todos
- `HiveService.addTodo(todo)` - Add new todo
- `HiveService.toggleTodo(index)` - Toggle completion status
- `HiveService.deleteTodo(index)` - Delete todo by index

## Running the App

1. Install dependencies: `flutter pub get`
2. Generate Hive adapters: `dart run build_runner build`
3. Run the app: `flutter run`

## Benefits

- **Fast**: Hive is a lightweight NoSQL database
- **Cross-platform**: Works on all Flutter platforms
- **Type-safe**: Strongly typed data models
- **Persistent**: Data is saved between app sessions
