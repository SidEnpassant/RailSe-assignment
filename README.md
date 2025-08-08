# railseassignment

A professional Flutter application for task management built with GetX state management, featuring interactive task cards with status-based UI changes and date editing capabilities.

## 📱 Features

### Core Functionality
- **Dynamic Task Status Management**: Visual changes based on task status (Not Started, Started, Completed, Overdue)
- **Interactive Task Actions**: 
  - Start Task button for "Not Started" tasks
  - Mark as Complete button for "Started" tasks
  - Date picker for editing deadlines on active tasks
- **Smart UI Elements**: Edit icon only appears for "Not Started" tasks
- **Real-time Updates**: Automatic UI refresh when task status changes

### Technical Features
- **GetX State Management**: Reactive programming with efficient state updates
- **Clean Architecture**: Modular structure with proper separation of concerns
- **Professional UI**: Matches provided design with proper spacing, colors, and typography
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Date Management**: Proper date formatting and overdue detection
- **Responsive Design**: Works across different screen sizes

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart (>=3.0.0)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd task_management_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── app/
│   ├── bindings/           # Dependency injection bindings
│   ├── controllers/        # GetX controllers for state management
│   ├── data/
│   │   ├── models/        # Data models
│   │   └── services/      # Business logic and data services
│   ├── modules/           # Feature modules
│   ├── routes/            # App routing configuration
│   └── widgets/           # Reusable UI components
├── core/
│   ├── constants/         # App constants (colors, strings, styles)
│   ├── enums/            # Enumerations
│   └── utils/            # Utility functions and extensions
└── main.dart             # App entry point
```

## 🎨 UI Components

### Task Card Features
- **Status-based Color Coding**:
  - Blue theme for "Not Started" tasks
  - Orange/Yellow theme for "Started" tasks  
  - Green theme for "Completed" tasks
  - Red theme for "Overdue" tasks

- **Interactive Elements**:
  - Clickable task titles with underline
  - Status badges with appropriate colors
  - Action buttons that change based on status
  - Date picker integration for deadline editing
  - Edit icon for date modification (Not Started tasks only)

- **Priority Indicators**:
  - High priority badge for important tasks
  - Visual distinction in task cards

## 🔧 Key Technologies

- **Flutter**: Cross-platform UI framework
- **GetX**: State management and dependency injection
- **Dart**: Programming language
- **Material Design**: UI components and theming

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  get: ^4.6.6          # State management
  intl: ^0.19.0        # Date formatting
  cupertino_icons: ^1.0.6
```

## 🏗️ Architecture

### GetX Pattern
- **Controllers**: Handle business logic and state management
- **Bindings**: Manage dependency injection
- **Views**: UI components that react to state changes

### Clean Architecture Principles
- **Models**: Data structures and business entities
- **Services**: Data access and business logic
- **Controllers**: State management and user interactions
- **Views**: UI presentation layer

## 🎯 Task Status Flow

```
Not Started → Started → Completed
     ↓
  Overdue (if past due date)
```

### Status-based Actions
- **Not Started**: Shows "Start Task" button + edit icon for date
- **Started**: Shows "Mark as complete" button
- **Completed**: Shows check icon, read-only
- **Overdue**: Shows "Start Task" button (similar to Not Started)

## 🔄 State Management

The app uses GetX reactive programming:

```dart
// Controller
final RxList<TaskModel> tasks = <TaskModel>[].obs;

// View
Obx(() => ListView.builder(
  itemCount: controller.tasks.length,
  // ...
))
```

## 📅 Date Management

- **Overdue Detection**: Automatic detection of overdue tasks
- **Date Picker**: Material Design date picker for deadline editing
- **Formatting**: Consistent date formatting throughout the app
- **Time Calculations**: Smart display of due dates and overdue periods

## 🎨 Theming

Consistent color scheme based on task status:
- Primary colors for each status
- Background colors for status badges
- Text colors for readability
- Button colors that match the context

## 🚀 Future Enhancements

- [ ] Task creation and editing
- [ ] User authentication
- [ ] Data persistence (local database)
- [ ] Push notifications for due tasks
- [ ] Task filtering and search
- [ ] Team collaboration features
- [ ] API integration
- [ ] Dark mode support

## 🐛 Known Issues

None currently identified. Please report issues through the repository.

## 📄 License

This project is created for internship assignment purposes.

## 👥 Contributing

This is an internship project. For any questions or suggestions, please contact the development team.

---

**Built with ❤️ using Flutter and GetX**