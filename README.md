📌 Overview
This is a weather application that fetches real-time weather data from an API, stores it locally, and displays it in a user-friendly interface. The app demonstrates API integration, state management, data persistence, and clean code architecture.

🚀 Features

🌈 Dynamic Background Color
The background color changes based on the current temperature:

Temperature (°C)	Background Color
T < 10°C	🔵 Blue
10°C ≤ T ≤ 35°C	🟢 Green
T > 35°C	🔴 Red

Stores weather data locally using Hive DB.
Compares fetched API data with stored local data.
Displays matching newValues in black.
Highlights differing values in a contrasting color for the same city.


📦 Dependencies

This project uses the following Flutter dependencies:

dependencies:
cupertino_icons: ^1.0.6
shared_preferences: ^2.2.0
dio: ^5.3.3
flutter_bloc: ^9.0.0
jwt_decoder: ^2.0.1
conditional_builder_null_safety: ^0.0.6
path_provider: ^2.1.0
hive: ^2.2.3


🛠 Installation & Setup

📌 Prerequisites
Flutter SDK installed
Dart configured
Hive DB dependency installed
API key for fetching weather data
💻 Clone the Repository
git clone https://github.com/ZieadEmad/school-voice-task.git
cd weather-app
📦 Install Dependencies
flutter pub get
▶️ Run the App
flutter run
