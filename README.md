# *BalHom*

## Overview

**BalHom** is a powerful tool for managing your expenses and incomes seamlessly. Whether you're on the go with your mobile device or working from your desktop, **BalHom** is here to streamline your financial management.

## Features

- **Expense Tracking:** Easily track and manage your expenses and incomes.
- **Cross-Platform:** Enjoy a consistent experience on both mobile and web platforms.
- **Internationalization:** **BalHom** supports multiple languages, including English, French, and Spanish, making it accessible to a global audience.

## Flutter

> Version: 3.16.3

### Internationalization

**BalHom** is designed to be accessible to users worldwide. The application supports three languages:

- **English**
- **French**
- **Spanish**

Switch between languages seamlessly within the app to cater to your preferences.

### State Management

To ensure a smooth and reactive user experience, **BalHom** employs **Riverpod** for efficient state management. This allows for better organization and manipulation of application state.

### Navigation

For seamless navigation within the application, **BalHom** uses **GoRouter**. This lightweight and flexible routing solution enhances the user experience by providing a smooth and dynamic transition between different screens.

### [Flutter clean architecture with riverpod](https://otakoyi.software/blog/flutter-clean-architecture-with-riverpod-and-supabase)

## Environment Variables

| NAME                        | DESCRIPTION                 |
| --------------------------- | --------------------------- |
| BALHOM_API_URL              | Balhom API url              |
| CURRENCY_CONVERSION_API_URL | Currency conversion API url |
| CURRENCY_CONVERSION_API_KEY | Currency conversion API url |

## FVM Setup

Activate fvm plugin

~~~
dart pub global activate fvm
~~~

Download flutter sdk

~~~
fvm use 3.16.3
~~~

## Contributions

We welcome contributions from the community. If you encounter any issues or have ideas for improvements, feel free to open an issue or submit a pull request.
