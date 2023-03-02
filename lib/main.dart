import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focused_pupa_clone/login/login_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: splashScreen(),
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 116, 40, 212),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            modalBarrierColor: Colors.black.withOpacity(0.9),
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            helperStyle: TextStyle(
              color: Colors.black12,
            ),
            suffixIconColor: Colors.black12,
            focusColor: Colors.black26,
            contentPadding: EdgeInsets.only(right: 20),
            hintStyle: TextStyle(
              color: Colors.black12,
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
          sliderTheme: SliderThemeData(
            trackHeight: 20,
            thumbColor: Colors.yellow,
            activeTrackColor: Colors.white,
            inactiveTrackColor: Colors.white.withOpacity(0.5),
            overlayColor: Colors.white.withOpacity(0.5),
            valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 0.2),
          ),
          textTheme: TextTheme(
            headlineLarge: TextStyle(
              fontSize: 100,
              fontFamily: GoogleFonts.sourceSans3().fontFamily,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          chipTheme: ChipThemeData(
            padding: const EdgeInsets.all(10),
            backgroundColor: Colors.yellow[100],
          ),
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor: Colors.transparent,
                systemNavigationBarDividerColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.dark),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ));
  }

  AnimatedSplashScreen splashScreen() {
    return AnimatedSplashScreen(
        backgroundColor: Colors.deepPurple,
        curve: Curves.easeIn,
        splash: animatedContainer(),
        nextScreen: const SignUpScreen());
  }

  AnimatedContainer animatedContainer() {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      duration: const Duration(seconds: 1),
      transformAlignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
          ],
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: const Expanded(
        child: Text(
          "FocusedPupa",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
