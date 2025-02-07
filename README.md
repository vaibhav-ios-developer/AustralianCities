# AustralianCities - SwiftUI App

## Overview
Cities Explorer is an iOS app built using SwiftUI that displays a list of cities in Australia. The app follows the MVVM architecture and adheres to SOLID design principles to ensure scalability, maintainability, and testability.

## Features
- **Collapsible List by State**: Displays cities grouped by state in an expandable/collapsible format.
- **Reverse Order Button**: Allows users to reverse the order of the city list.
- **Dark Mode Support**: Fully compatible with light and dark modes.
- **Search Functionality**: Enables users to search for cities by name.
- **Data Refresh**: Provides the ability to refresh data from the backend.
- **Data Caching**: Ensures data is cached until a refresh is required.
- **Responsive UI**: Adapts to different screen sizes and orientations.

## Tech Stack
- **Language**: Swift
- **Framework**: SwiftUI
- **Architecture**: MVVM (Model-View-ViewModel)
- **Networking**: URLSession
- **Storage**: UserDefaults 


## Implementation Details
- **MVVM Architecture**: Separates concerns to make the code modular, scalable, and testable.
- **SOLID Principles**: Ensures each class has a single responsibility and adheres to dependency inversion via protocols and dependency injection.
- **Dependency Injection**: Improves testability by injecting dependencies where required.
- **Constants Management**: Uses a centralized place for project-level constants.

## Setup & Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/CitiesExplorer.git
   ```
2. Open `CitiesExplorer.xcodeproj` in Xcode.
3. Build and run the app on a simulator or a physical device.

## How It Works
1. **Loading Data**: The app loads city data from a string variable and displays it in a structured list grouped by state.
2. **Collapsible Sections**: Users can expand/collapse sections by tapping on the state header.
3. **Sorting**: A button is provided to reverse the order of cities.
4. **Search**: Users can search cities dynamically as they type.

https://github.com/user-attachments/assets/a9f626ca-440c-4810-b3c0-cc964b8b3494


5. **Dark Mode**: The UI adapts based on the device’s appearance settings.
6. **Data Refresh & Caching**:
   - Cached data is used until the user initiates a refresh.
   - Data is fetched from the backend when refreshing.
   - The app ensures offline availability using caching mechanisms.


## License
This project is licensed under the MIT License.

---
**Happy Coding! 🚀**

