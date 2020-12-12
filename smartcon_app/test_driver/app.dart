import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:smartcon_app/main.dart' as app;
import 'package:flutter_driver/driver_extension.dart';

void main() async{
  // This line enables the extension
  enableFlutterDriverExtension();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.main();
}