import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/views/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xff5B428F),
        primaryColorDark: const Color(0xff262833),
        primaryColorLight: const Color(0xffFCF9F5),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xffF56D58)),
        textTheme: GoogleFonts.nunitoSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}
