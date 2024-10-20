# Simple Flutter Todo App

## Overview

This is a simple Flutter-based todo application that allows users to:

- **Add tasks**: Users can input tasks they want to track.
- **Mark tasks as completed**: Users can mark tasks as finished.
- **Delete tasks**: Users can swipe to delete tasks from the list.
- **Persistent local storage**: All tasks are stored locally on the device, ensuring data persistence across app restarts.

## Features

### 1. **Add Tasks**
   - Users can input a task in a text field and add it to the task list by clicking an "Add" button.
   - New tasks appear at the top (or bottom) of the list with a checkbox to mark completion.

### 2. **Mark Tasks as Finished**
   - Each task in the list has a checkbox.
   - When the user checks the box, the task is marked as finished (e.g., strikethrough text or gray-out).

### 3. **Swipe to Delete Tasks**
   - Users can swipe on a task to reveal the delete button, which allows them to delete tasks from the list.
   - This is achieved using the **flutter_slidable** package.

### 4. **Persistent Data**
   - Tasks are stored in the app's local storage using the **Hive** package for lightweight and fast storage.
   - This ensures that tasks remain available even after the app is closed and reopened.


### Local Storage
- **Hive** is used for data persistence. Tasks are stored in a Hive box, ensuring that data is preserved between app sessions.
- Tasks are stored as key-value pairs where the key is the task ID, and the value is the task data (name and status).

## Dependencies

To get the app running, you’ll need to add the following dependencies in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_slidable: ^3.1.1
```

Ensure you also add the necessary **dev_dependencies** for Hive's type adapters if you are using custom objects:

```yaml
dev_dependencies:
  hive_generator: ^2.0.1
  build_runner: ^2.4.13
```

## Installation and Setup

1. **Clone the Repository**
   Download or clone the project from the repository.

   ```bash
   git clone https://git.yousefsite.com/Yousef/todo.git
   ```

2. **Install Dependencies**
   Install the required packages by running:

   ```bash
   flutter pub get
   ```

3. **Initialize Hive**
   In the `main.dart` file, initialize Hive before the app starts:

   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Hive.initFlutter();
     await Hive.openBox('task');
     runApp(MyApp());
   }
   ```

4. **Run the App**
   Use the following command to run the app on your device or emulator:

   ```bash
   flutter run
   ```


## Future Enhancements

- **Task Prioritization**: Add an option to prioritize tasks (e.g., high, medium, low).
- **Notifications**: Add reminders or push notifications for incomplete tasks.
- **Theming**: Implement dark mode and custom themes.

## Conclusion

This Flutter todo app is a lightweight task management tool that stores data locally for persistence. Using Hive for local storage ensures tasks remain accessible across app restarts, and the flutter_slidable package adds a smooth swipe-to-delete functionality.

Feel free to expand on this basic app by adding new features or modifying the existing functionality as needed.