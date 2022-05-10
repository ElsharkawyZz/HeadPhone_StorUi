import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:headphone/component/constant.dart';
import 'package:headphone/component/size.dart';
import 'package:headphone/screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints) {
      SizeConfig().init(constraints);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: kPrimaryColor,
            primarySwatch: Colors.blue,
            textTheme: GoogleFonts.montserratTextTheme()
        ),
        home:  MayHome(),
      );
    }

    );
  }
}
