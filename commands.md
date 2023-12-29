# Useful commands

* Create a project

~~~bash
flutter create --project-name <app_name> --org dev.flutter --android-language java --ios-language objc <dir_name>
~~~

* Fetch packages

~~~bash
flutter pub get
~~~

* Generate translations files:

~~~bash
flutter gen-l10n
~~~

* Generate platform icons:

~~~bash
flutter pub run flutter_launcher_icons:main
~~~

* Code generation:

~~~bash
flutter pub run build_runner build --delete-conflicting-outputs
~~~

* Generate splash screen:

~~~bash
flutter pub run flutter_native_splash:create
~~~

* Generate keystore:

~~~bash
keytool -genkey -v -keystore ./keystore.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias <ALIAS>
~~~

* Generate SHA1 and SHA2 keys:

~~~bash
cd android: ./gradlew signingreport; cd ..
~~~

or

~~~bash
keytool -list -v -alias <ALIAS> -keystore <PATH_KEYSTORE>
~~~
