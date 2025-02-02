# 🍽️ Restaurant App

A modern Flutter application for managing restaurant food products, user authentication, and shopping cart functionality.

---

## 📂 Project Structure

```plaintext
lib
│── constant
│   └── constant.dart
│
│── controller
│   ├── cart_provider.dart
│   ├── food_provider.dart
│   ├── fruit_provider.dart
│   ├── login_provider.dart
│   ├── register_provider.dart
│   ├── users_provider.dart
│
│── models
│   ├── food_product_model.dart
│   ├── login_model.dart
│
│── pages
│   ├── admin
│   │   ├── Food
│   │   │   ├── addfood.dart
│   │   │   ├── adminfoodpage.dart
│   │   │   ├── update_food.dart
│   │   │
│   │   ├── fruits
│   │   │   ├── add_fruit.dart
│   │   │   ├── admin_fruits.dart
│   │   │   ├── update_fruits.dart
│   │   │
│   │   ├── dashboard.dart
│   │   ├── users_screen.dart
│   │
│   ├── users
│   │   ├── about.dart
│   │   ├── bottom_navigation.dart
│   │   ├── cart_screen.dart
│   │   ├── chats.dart
│   │   ├── contact.dart
│   │   ├── details_page.dart
│   │   ├── home.dart
│   │   ├── login.dart
│   │   ├── menu_screen.dart
│   │   ├── onboarding.dart
│   │   ├── profile.dart
│   │   ├── register.dart
│   │   ├── user_fruits.dart
│   │   ├── userfood_page.dart
│   │   ├── zoom_drawer_screen.dart
│
│── widgets
│   ├── discount_widget.dart
│   ├── home_category.dart
│   ├── popular_recipes_widget.dart
│
└── main.dart


## 🛠️ Dependencies

- `flutter`
- `cupertino_icons`
- `google_fonts`
- `line_icons`
- `modal_progress_hud_nsn`
- `provider`
- `get_storage`
- `flutter_zoom_drawer`
- `image_picker`
- `curved_navigation_bar`
- `cloudinary_public`
- `file_picker`
- `flutter_lints`
- `flutter_test`

## 🚀 Features

- 🛒 **Cart Management**: Handles food products and user cart data.
- 🔐 **Authentication**: User login and registration using providers.
- 📦 **State Management**: Uses `Provider` for efficient state handling.
- 📸 **Image Upload**: Integrates `image_picker` and `cloudinary_public`.
- 📂 **File Management**: Supports file selection using `file_picker`.

## 📌 Getting Started

1. Clone the repository:  
   ```sh
   git clone https://github.com/your-username/restaurant_app.git
