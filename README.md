# Flutter News App

A Flutter news application with login functionality and bookmark features.

## Features

- **Login Page**: Email and password authentication with session persistence
- **News Feed**: Display news articles from a public API
- **Bookmarks**: Save and manage favorite articles
- **WebView**: View full article content
- **Dark Mode**: Toggle between light and dark themes
- **Pull-to-refresh**: Update news feed with latest articles
- **Search**: Filter articles by keywords

## Screenshots

![Login Screen](screenshots/login_screen.png)
![News Feed](screenshots/news_feed.png)
![Article Detail](screenshots/article_detail.png)
![Bookmarks](screenshots/bookmarks.png)
![Dark Mode](screenshots/dark_mode.png)

## Setup Instructions

1. Clone the repository:
   \`\`\`
   git clone https://github.com/yourusername/flutter_news_app.git
   \`\`\`

2. Navigate to the project directory:
   \`\`\`
   cd flutter_news_app
   \`\`\`

3. Install dependencies:
   \`\`\`
   flutter pub get
   \`\`\`

4. (Optional) Add your News API key:
    - Sign up for a free API key at [NewsAPI.org](https://newsapi.org/)
    - Open `lib/services/news_service.dart`
    - Replace `YOUR_API_KEY` with your actual API key

5. Run the app:
   \`\`\`
   flutter run
   \`\`\`

## Architecture

This project follows the GetX pattern for state management, routing, and dependency injection:

- **Models**: Data structures representing news articles
- **Views**: UI screens and components
- **Controllers**: Business logic and state management
- **Services**: API calls and data fetching

## Third-Party Packages

- **get**: State management, dependency injection, and navigation
- **get_storage**: Persistent storage for bookmarks and login session
- **http**: API requests to fetch news data
- **webview_flutter**: Display full article content
- **cached_network_image**: Efficient loading and caching of article images
- **intl**: Date formatting for article publication dates

## Why These Packages?

- **GetX**: Provides a comprehensive solution for state management, navigation, and dependency injection with minimal boilerplate code
- **get_storage**: Simple key-value storage that integrates well with GetX
- **http**: Lightweight and easy-to-use HTTP client
- **webview_flutter**: Official Flutter plugin for WebView implementation
- **cached_network_image**: Improves performance by caching images and handling loading states
- **intl**: Robust internationalization and date formatting capabilities

## Project Structure

\`\`\`
lib/
├── controllers/
│   ├── auth_controller.dart
│   ├── bookmark_controller.dart
│   ├── news_controller.dart
│   └── theme_controller.dart
├── models/
│   └── article.dart
├── services/
│   └── news_service.dart
├── views/
│   ├── article_web_view.dart
│   ├── bookmarks_tab.dart
│   ├── home_screen.dart
│   ├── login_screen.dart
│   ├── news_tab.dart
│   └── splash_screen.dart
├── widgets/
│   └── news_card.dart
└── main.dart
#   a i b _ b u z _ t e c h n o l o g y _ t a s k  
 #   a i b _ b u z _ t e c h n o l o g y _ t a s k  
 #   a i b _ b u z _ t e c h n o l o g y _ t a s k  
 