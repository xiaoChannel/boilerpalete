# Flutter Boilerplate Project

A boilerplate project created in flutter using [GetX](https://pub.dev/packages/get) pattern. The boilerplate supports mobile only.

## Getting Started

The Boilerplate contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. 

## Installation & Use

**Step 1:**

Install the flutter environment.
```bash
# Download flutter installer
curl https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_3.7.5-stable.zip --output flutter_macos_arm64_3.7.5-stable.zip

# Unzip
sudo unzip ./flutter_macos_arm64_3.7.5-stable.zip -d /usr/local/flutter

 # Set to .bash_profile
export PATH=/usr/local/flutter/bin:$PATH

source ~/.bash_profile

# Check install
flutter doctor

# Run upgrade if need
flutter upgrade
```

**Step 2:**

clone this repo by using the link below:
```
https://github.com/zubairehman/flutter-boilerplate-project.git
```

**Step 3:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get 
```

**Step 4:**

That's it! You can run the project and start developing and debugging.

```
flutter pub run
```

# Folder Structure

Here is the root folder structure.

```
flutter-app/
|- .vscode
|- .husky
|- images
|- fonts
|- docs
|- android
|- build
|- ios
|- lib
|- test
```

Here is the lib folder structure we have been using in this project

```yaml
- /lib
  - /data
  # Directory responsible for containing everything related to our data
    - /api
    # Our network request package.
    - /database
    # Mobile local database package.
    - /models
    # Data models responsible for abstracting our objects.
  - /modules
  # Each module consists of a page, its respective GetXController and its dependencies or Bindings.
  # We treat each screen as an independent module, as it has its only controller, and can also contain its dependencies.
  # If you use reusable widgets in this, and only in this module, you can choose to add a folder for them.
    - /login
    # example of module
      - login_binding.dart
      - login_controller.dart
      - login_page.dart
      - login_repository.dart
    ...
  - /routes
  # Deposit our routes and pages.
  # We chose to separate into two files, and two classes, one being app_routes.dart, containing its constant routes and the other for routing. 
    - app_pages.dart
    - app_routes.dart
    - routes.dart
  - /settings
  # Some settings info could do in here
    - settings.dart
    - shared_preference_settings.dart
  - /utils
  # Here you can insert utilities for application.
    - asset_util.dart
    - focus.dart
    - notification_controller.dart
    - theme_util.dart
  - /widgets
  # Deposit some reusable common widgets.
    - common_widget.dart
  - main.dart
  - app_binding.dart
```


# Libraries & Tools Used

* [GetX](https://pub.dev/packages/get) (Including state Management, navigation, HTTP package)
* [SharedPreferences](https://pub.dev/packages/shared_preferences)
* [EasyLoading](https://pub.dev/packages/flutter_easyloading) 
* [FlutterToast](https://pub.dev/packages/fluttertoast)
* [Snackbar](https://github.com/AndreHaueisen/flushbar)
* [Json Serialization](https://pub.dev/packages/json_serializable)
* [Freezed](https://pub.dev/packages/freezed) (Code generator for data-classes/unions/pattern-matching/cloning.)
* [Notification](https://pub.dev/packages/awesome_notifications#-getting-started)(for local notifications push. Also can integrate with firebase, with awesome_notifications_fcm if needed)
* [FLuwx](https://github.com/OpenFlutter/fluwx) (Flutter plugin for WeChatSDK which allows developers to call WeChatSDK native APIs.)
* [DataBase](./docs/persistent-data-storage.md)

# Upcoming features & components

- Flavor
- Deeplink
- UBT

# Code lint

Developers using vscode should follow the same code formatting.

settings below is configured in .vscode/settings.

```json
{
  "dart.lineLength": 160,
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false,
    "editor.codeActionsOnSave": {
      "source.fixAll": true
    }
  }
}
```

# Test in an iOS device(Simulator)

For developers to start their first iOS development project, some extra setup is require.

Please follow steps in [iOS setup](https://docs.flutter.dev/get-started/install/macos#ios-setup).

# Deep link solutions
Please refer [the article](https://wiredcraft.atlassian.net/wiki/spaces/knowledge/pages/775881742/Flutter+Deeplink+Solutions) on conference.

# Docs

If you are interested in the implementation of a particular module, please check [docs](./docs) folder.

# Others

- If want to use modular architecture. see [Modular solutions](https://wiredcraft.atlassian.net/wiki/spaces/knowledge/pages/755695913/Flutter+app+modular+architecture+design+patterns#Option-2:-Git-dependency) for detail.

# Help

[#team-mobile](https://wiredcraft.slack.com/archives/C8WSL92TV)
