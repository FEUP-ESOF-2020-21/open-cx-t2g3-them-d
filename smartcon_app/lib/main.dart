import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcon_app/services/auth.dart';
import 'package:smartcon_app/models/user.dart';
import 'package:smartcon_app/wrapper.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<SmartconUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'SmartCon',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.teal,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,

          textTheme: TextTheme(
            headline2: GoogleFonts.rubik(
              textStyle: TextStyle(color: Color(0xFF637DEB), fontSize: 38.0,  fontWeight: FontWeight.w500,),
            ),
            headline3: GoogleFonts.rubik(
              textStyle: TextStyle(color: Color(0xFF4A4444), fontSize: 20.0,  fontWeight: FontWeight.w500, ),
            ),
            headline4: GoogleFonts.rubik(
              textStyle: TextStyle(color: Colors.white, fontSize: 12.0,  fontWeight: FontWeight.w500, ),
            ),
            headline5: GoogleFonts.rubik(
              textStyle: TextStyle(color: Color(0xFF637DEB), fontSize: 22.0,  fontWeight: FontWeight.w500, ),
            ),
          ),

        ),
        home: Wrapper(),
      ),
    );
  }
}