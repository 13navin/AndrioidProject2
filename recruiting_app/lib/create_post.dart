import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruiting_app/job_listing.dart';
import 'package:recruiting_app/home.dart';
import 'package:recruiting_app/sign_in.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        title: const Text(
          'RECRUITING APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF232946),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ElevatedButton(
                onPressed: () => _logout(),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(const Color(0xFFEEBBC3)),
                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
              ),
              child: const Text(
                'LOGOUT',
                style: TextStyle(fontSize: 16, color: Color(0xFF232946)),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 20),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeScreen()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFB8C1EC)),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                      ),
                      child: const Text(
                        'VIEW POSTS',
                        style: TextStyle(fontSize: 16, color: Color(0xFF232946)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const JobScreen()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(const Color(0xFFB8C1EC)),
                        padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                      ),
                      child: const Text(
                        'VIEW JOBS',
                        style: TextStyle(fontSize: 16, color: Color(0xFF232946)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xFF232946),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'post',
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },
                          activeColor: const Color(0xFFFFFFFF),
                        ),
                        const Text(
                          'Post',
                          style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 20),
                        Radio<String>(
                          value: 'job',
                          groupValue: _selectedOption,
                          onChanged: (value) {
                            setState(() {
                              _selectedOption = value;
                            });
                          },


                          activeColor: const Color(0xFFFFFFFF),
                        ),
                        const Text(
                          'Job',
                          style: TextStyle(color: Color(0xFFFFFFFF), fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 320,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Title',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                      width: 320,
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Description',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
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
                            backgroundColor: MaterialStateProperty.all(const Color(0xFFB8C1EC)),
                            padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                          ),
                          child: const Text(
                            'Post',
                            style: TextStyle(
                              color: Color(0xFF232946),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to login screen or any other screen after logout
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}
