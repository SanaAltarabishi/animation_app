
import 'package:app/core/get_it.dart';
import 'package:app/option_page.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  StateMachineController? controller;
  SMIInput<bool>? isChacking;
  SMIInput<bool>? isHandUp;
  SMIInput<bool>? logSuccess;
  SMIInput<bool>? logFail;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final bool isFoucse = true;
    return Scaffold(
      backgroundColor: Color(0xffD6E2EA),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width,
                  height: 200,
                  child: RiveAnimation.asset(
                    //'images/login_screen_character.riv',
                    'images/animated_login_character.riv',
                    stateMachines: ["Login Machine"],
                    onInit: (artboard) {
                      controller = StateMachineController.fromArtboard(
                          artboard, "Login Machine");
                      if (controller == null) return;
                      artboard.addController(controller!);
                      isChacking = controller!.findInput('isChacking');
                      isHandUp = controller!.findInput('isHandUp');
                      logSuccess = controller!.findInput('logSuccess');
                      logFail = controller!.findInput('logFail');
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller:_usernameController ,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    cursorColor: Color(0xff6076D1),
                    decoration: InputDecoration(
                      prefixIconColor: isFoucse ? Color(0xff6076D1) : null,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff6076D1),
                          )),
                      hintText: 'User name',
                      prefixIcon: Icon(Icons.person_2_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (isHandUp != null) {
                        isHandUp!.change(false);
                      }
                      if (isChacking == null) return;
                      isChacking!.change(true);
                    },
                    cursorColor: Color(0xff6076D1),
                    decoration: InputDecoration(
                      prefixIconColor: isFoucse ? Color(0xff6076D1) : null,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff6076D1),
                          )),
                      hintText: 'E mail',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      if (isChacking != null) {
                        isChacking!.change(false);
                      }
                      if (isHandUp == null) return;
                      isHandUp!.change(true);
                    },
                    obscureText: true,
                    cursorColor: Color(0xff6076D1),
                    decoration: InputDecoration(
                      prefixIconColor: isFoucse ? Color(0xff6076D1) : null,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 2,
                            color: Color(0xff6076D1),
                          )),
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: size.width,
                    child: Text(
                      'Forget your password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  color: Color(0xff6076D1),
                  minWidth: size.width,
                  height: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onPressed: () {
              getIt.get<SharedPreferences>().setString('user_name', _usernameController.text);
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OptionPage()),
      
                      );
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't you have an account?"),
                        TextButton(
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: //Colors.black
                                  Color(0xff6076D1),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
