import 'package:app/color_screen.dart';
import 'package:app/core/get_it.dart';
import 'package:app/direction.dart';
import 'package:app/lamp_screen.dart/lamp.dart';
import 'package:app/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 288,
      height: double.infinity,
      color: Color(0xff6076D1),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xffD6E2EA),
                child: Icon(
                  Icons.person,
                  color: Color(0xff6076D1),
                ),
              ),
              title: Text(
                '${getIt.get<SharedPreferences>().getString('user_name') ?? ''}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInPage(),
                        ));
                  },
                  leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'LogIn',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Color(0xffD6E2EA),
                    height: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DirectionPage(),
                        ));
                  },
                  leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.directions,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Directions',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Color(0xffD6E2EA),
                    height: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ColorPage(),
                        ));
                  },
                  leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.color_lens_outlined,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Colors',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Color(0xffD6E2EA),
                    height: 1,
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.format_size_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Size',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Color(0xffD6E2EA),
                    height: 1,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder:(context) => LivingHomePage(),));
                  },
                  leading: SizedBox(
                    height: 34,
                    width: 34,
                    child: Icon(
                      Icons.light_mode_sharp,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(
                    'Lamp',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Divider(
                    color: Color(0xffD6E2EA),
                    height: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
