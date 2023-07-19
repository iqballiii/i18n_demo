# Easy Localization & State management example app

This is a beginner application for internalization (i18n). The application also has got the following features:

- **Provider**: State management Package - To add the items from a list and remove them from the favorites list.

- **Easy Localization**: i18n multi-language package - Using this package you can make your app i18 enabled.

- **Shared Preferences**: Local Offline Storage - This package is used for saving the language prefernce for when it is opened again after being closed or after restarting the state of the application. 

- Along with the above mentioned features, this application has been unit tested, widget tested and integraton tested by running the following steps:

For testing the application: 
1. create your own specfic tests. 

2. For your specific tests there are different types of commands:
    a. **test()** - This method is used for simple unit testing.
    b. **testWidgets()** - This method is used for testing widgets.
 
3. For unit testing, widget testing and inetgration: flutter test (Path to your test file)

4. For performance testing: flutter drive --driver=(path to the driver file) --target= (path to the perf test file) --profile --no-dds 


## Links
 
1. [CodeLab for testing your flutter app](https://codelabs.developers.google.com/codelabs/flutter-app-testing/#0).

2. [Easy Localization Package](https://pub.dev/packages/easy_localization).

3. [Flutter docs for i18n](https://docs.flutter.dev/accessibility-and-localization/internationalization "Traditional long process").

