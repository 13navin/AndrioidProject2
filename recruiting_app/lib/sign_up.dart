import 'package:flutter/material.dart';
import 'package:recruiting_app/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF232946),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 300,
                height: 300,
                image: AssetImage("images/ralogo.png"),
              ),

              const SizedBox(height: 50),

              const SizedBox(
                width: 360,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    filled: true,
                    fillColor: Colors.white,

                  ),
                ),
              ),

              const SizedBox(height: 20),

              const SizedBox(
                width: 360,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: Colors.white,

                  ),
                ),
              ),

              const SizedBox(height: 20),

              const SizedBox(
                width: 360,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: Colors.white,

                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFEEBBC3)),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xFF232946),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignInScreen()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFFFFFFFF)),
                      padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(50, 15, 50, 15)),
                    ),
                    child: const Text(
                      'Sign In?',
                      style: TextStyle(
                        color: Color(0xFF232946),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                ],
              ),

            ],
          ),

        ),
      ),

    );
  }
}