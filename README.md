# flutter_bloc_basecode

Application build with BLoC Flutter

## Getting Started

This project is based on BLoC architecture that separate module by each usecase.
Every usecase has bloc, model, resource, widget & component

## Coding Convention & Rules
0. Copy analysis_options.yaml from here : https://github.com/flutter/flutter/blob/master/analysis_options.yaml to project root folder (like this: https://dart.dev/guides/language/analysis-options)
1. Every dart files (libraries, packages, directories, source files, assets) use Snake Case (e.g. login_bloc, reset_password_screen)
2. Every class name use Pascal Case / Upper Camel  Case (e.g. LoginBloc, ResetPasswordScreen)
3. Every variable and constant name use Lower Camel Case (e.g. accessToken, fullName, telephoneNumber)
4. Don't use prefix letters in order to name variable or constant (e.g. kNum, vToken, nOverdue)
5. Ordering import, do place "dart:" before other imports, do place "package:" imports before relative imports, do specify exports in a separate section after all imports, do sort sections alphabetically.


## Structure of Directories Code (Module / UseCase)

    /lib
      |
      |
      |
    /app_module
         |
         |
         |- /module
               |- /bloc
               |- /resource
               |- /model
               |- /screen
               |- /widget
               |- /component
               |- module_app.dart


### Description :
1. Resource directory is used to place provider files. Provider file contains API URL, HTTP Method, Key & Value for RESTful (e.g /auth/login-mobile-app use POST method and need key value pair)
2. Bloc directory is used to place bloc files which bridges between resource and UI. It's like ViewModel in Android, all logic in every usecase placed on each bloc file.
3. Screen, Widget & Component used to place all Widget files (View). Screen is the base UI for each module, widget is a parts of screen and component is smaller part (if reusable) of widget.
