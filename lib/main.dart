import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app/color_screen.dart';
import 'package:app/components/side_menu.dart';
import 'package:app/core/get_it.dart';
import 'package:app/direction.dart';
import 'package:app/login_screen.dart';
import 'package:app/option_page.dart';
import 'package:app/size.dart';
import 'package:flutter/material.dart';

void main() async {
  // GetIt getIt = GetIt.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
     // SideMenu()
      //SizedPage()
   // DirectionPage()
      //OptionPage() 
    // ColorPage()
   MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeighy = MediaQuery.of(context).size.height;
    return Scaffold(
      //  backgroundColor: Color(0xffD6E2EA),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
               Color.fromARGB(217, 214, 226, 234),
              Color(0xffD6E2EA),
              Color(0xff6076D1),
              // Color(0xff606AD1),
              // Color(0xff9CAAE2),
              // Color(0xffB1B0D1),
              // Color(0xffBAC3EB),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenHeighy * 0.2,
                width: screenWidth * 0.4,
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontSize: screenWidth * 0.09,
                    color: //Colors.white,
                        Color(0xff6076D1),
                    shadows: [
                      Shadow(blurRadius: 9, color: Colors.white
                          // Color(0xff6076D1),
                          // offset: Offset(0, 0),
                          ),
                    ],
                  ),
                  child: AnimatedTextKit(
                    repeatForever: true,
                    stopPauseOnTap: true,
                    animatedTexts: [
                      FlickerAnimatedText('Welcome'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenHeighy * 0.01,
              ),
              Text(
                'to animation learning app',
                style: TextStyle(color: Color.fromARGB(186, 255, 255, 255)),
              ),
              Text(
                'where you can enjoy and learn',
                style: TextStyle(
                  color: const Color.fromARGB(186, 255, 255, 255),
                ),
              ),
              SizedBox(
                height: screenHeighy * 0.04,
              ),
              MaterialButton(
                color: Color(0xff6076D1),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInPage(),
                    ),
                  );
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
