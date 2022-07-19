import 'package:flutter/material.dart';
import 'package:movies4br/service/auth_service.dart';

class WelcomePage extends StatelessWidget {
  final String email;
  const WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
               height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                     child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 150,
                              child:
                                  Image.asset("images/logo.png", fit: BoxFit.contain),
                            ),
                            const Padding(padding: EdgeInsets.only(bottom: 20)),
                            // ignore: prefer_const_constructors
                            SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    'Sign Out 🇧🇷 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),

                                  Text(
                                    email,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              ),

                              // ignore: prefer_const_constructors
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90)),
                              child: ElevatedButton(
                                onPressed: () {
                                  AuthService.instance.logOut();
                                },
                                // ignore: sort_child_properties_last
                                child: const Text(
                                  'LOG OUT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
          ],
        ),
      ),
    );
          
  }
}
