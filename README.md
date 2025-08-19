# HEYLIST - Your Personal Task Manager

HEYLIST is a beautiful and intuitive Flutter todo application designed to help you stay organized and productive. Built with modern Flutter practices and featuring a clean Material Design interface.

## 🚀 Features

- **Task Management**: Create, edit, and delete tasks with ease
- **Local Storage**: Persistent data storage using Hive database
- **Swipe Gestures**: Swipe to delete tasks for quick interaction
- **Material Design**: Beautiful and responsive UI following Material Design principles
- **Cross-Platform**: Works on Android, iOS, and web platforms
- **Offline First**: All data is stored locally on your device

## 📱 Screenshots

*Screenshots will be added here*

## 🛠️ Technology Stack

- **Framework**: Flutter 3.32.8
- **Language**: Dart 3.8.1
- **Database**: Hive (Local NoSQL database)
- **UI**: Material Design 3
- **State Management**: Provider/SetState
- **Dependencies**:
  - `hive`: ^2.2.3 - Local database
  - `hive_flutter`: ^1.1.0 - Flutter integration for Hive
  - `flutter_slidable`: ^3.0.1 - Swipe gestures
  - `shared_preferences`: ^2.2.2 - Local preferences storage

## 📋 Prerequisites

- Flutter SDK (3.32.8 or higher)
- Dart SDK (3.8.1 or higher)
- Android Studio / VS Code / Cursor
- Git

## 🚀 Getting Started

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Hezy001/flutter-Haylist-V1.0.1.git
   cd flutter-Haylist-V1.0.1
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

### Building for Production

**Android APK:**
```bash
flutter build apk --release
```

**Android App Bundle:**
```bash
flutter build appbundle --release
```

**iOS:**
```bash
flutter build ios --release
```

## 📁 Project Structure

```
lib/
├── main.dart              # App entry point
├── models/
│   ├── todo.dart          # Todo data model
│   └── todo.g.dart        # Generated Hive adapter
├── pages/
│   ├── home_page.dart     # Main todo list page
│   ├── splash_screen.dart # App splash screen
│   └── first_page.dart    # Additional page
├── services/
│   ├── hive_service.dart  # Database operations
│   └── tutorial_service.dart # Tutorial functionality
└── util/
    ├── dialog_box.dart    # Custom dialog components
    ├── my_button.dart     # Custom button widget
    └── todo_tile.dart     # Todo item widget
```

## 🎯 Usage

1. **Adding Tasks**: Tap the floating action button to add a new task
2. **Editing Tasks**: Tap on any task to edit its content
3. **Completing Tasks**: Tap the checkbox to mark tasks as complete
4. **Deleting Tasks**: Swipe left on any task to delete it
5. **Data Persistence**: All tasks are automatically saved to local storage

## 🔧 Configuration

The app uses Hive for local database storage. The database is automatically initialized when the app starts. No additional configuration is required.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Hezy001**
- GitHub: [@Hezy001](https://github.com/Hezy001)

## 🙏 Acknowledgments

- Flutter team for the amazing framework
- Hive team for the lightweight database solution
- Material Design team for the design guidelines

## 📞 Support

If you encounter any issues or have questions, please open an issue on GitHub.

---

**HEYLIST** - Stay organized, stay productive! ✨
