# Flutter Task Manager

A comprehensive task management application built with Flutter, featuring dynamic status tracking, deadline management, and an intuitive user interface designed for optimal productivity.

## 📱 Overview

This Flutter application provides a streamlined task management system with visual status indicators, interactive controls, and real-time updates. The interface is designed to clearly distinguish between different task states while providing seamless user interactions for task progression and deadline management.

## ✨ Features

### Core Functionality
- **Dynamic Task Status Management**: Track tasks through three distinct states (Not Started, Started, Completed)
- **Visual Status Indicators**: Color-coded borders and status badges for instant task state recognition
- **Interactive Task Progression**: Single-tap task advancement through workflow stages
- **Deadline Management**: Comprehensive date editing with automatic time calculations
- **Priority Marking**: High-priority task identification with visual badges

### User Interface Highlights
- **Status-Based Visual Design**: Completed tasks display with fade effect and strike-through text
- **Color-Coded Categories**: 
  - Orders (Blue)
  - Entities (Purple) 
  - Enquiries (Orange)
- **Smart Border System**:
  - Green solid border: Completed tasks
  - Blue solid border: Started tasks
  - Grey dotted border: Not started tasks
- **Contextual Controls**: Task-specific action buttons and edit capabilities

## 🛠️ Technical Architecture

### State Management
- **Provider Pattern**: Centralized state management using the Provider package
- **Real-time Updates**: Instant UI refresh on state changes
- **Immutable Data Flow**: Predictable state transitions

### Project Structure
```
lib/
├── main.dart                 # Application entry point
├── models/
│   └── task.dart            # Task data model and enums
├── providers/
│   └── task_provider.dart   # State management logic
├── screens/
│   └── task_list_screen.dart # Main task list interface
└── widgets/
    └── task_card.dart       # Individual task card component
```

## 🎯 Core Components

### Task Model
- **TaskStatus Enum**: `notStarted`, `started`, `completed`
- **TaskType Enum**: `order`, `entity`, `enquiry`
- **Dynamic Properties**: Status-dependent text formatting and date calculations

### Interactive Elements
1. **Start Task Button**: Converts "Not Started" tasks to "Started" status
2. **Mark as Complete**: Transitions "Started" tasks to "Completed" status
3. **Date Pickers**: 
   - Due date editing for not started tasks
   - Deadline modification for started tasks
   - Start date editing with validation

### Visual Feedback System
- **Opacity Modulation**: Completed tasks rendered at 60% opacity
- **Border Indicators**: Left-side colored borders for status identification
- **Typography States**: Strike-through text for completed items
- **Color Coordination**: Consistent color scheme across status and category types

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.0.0)
- Dart SDK (^3.0.0)

### Installation

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd flutter-task-manager
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Dependencies
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.5
  cupertino_icons: ^1.0.2
```

## 🎮 Usage Guide

### Task Interactions

#### Starting a Task
1. Locate a task with "Due Today" or "Due in X days" status
2. Tap the "Start Task" button (blue text with play icon)
3. Task automatically transitions to "Started" status with overdue tracking

#### Completing a Task
1. Find a task with "Overdue" status (red background)
2. Tap the green checkmark beside "Mark as complete"
3. Task moves to "Completed" status with completion timestamp

#### Date Management
- **Not Started Tasks**: 
  - Edit due date using the pen icon next to the due status
  - Edit start date using the pen icon next to "Start: [date]"
- **Started Tasks**: 
  - Modify deadline using the pen icon next to "Overdue" status
  - View start date (non-editable once started)

## 🎨 Design System

### Color Palette
- **Primary Blue**: `#1976D2` (Orders, active elements)
- **Purple**: `#7B1FA2` (Entity tasks)
- **Orange**: `#F57C00` (Enquiry tasks, due status)
- **Red**: `#D32F2F` (Overdue status, high priority)
- **Green**: `#388E3C` (Completed status, completion actions)
- **Grey Variants**: `#666666`, `#999999` (Secondary text, inactive elements)

### Typography
- **Task Titles**: 16px, Semi-bold, Category-colored
- **Subtitles**: 14px, Regular, Grey
- **Assignee Names**: 13px, Regular, Dark grey
- **Status Text**: 11px, Medium, Status-colored
- **Action Text**: 12px, Medium, Action-colored
---

**Built with ❤️ using Flutter & Dart**