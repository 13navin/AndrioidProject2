import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:recruiting_app/user.dart';
import 'package:recruiting_app/job_listing.dart';
import 'package:recruiting_app/create_post.dart';
import 'package:recruiting_app/home.dart';
import 'package:recruiting_app/candidate_detail.dart';
import 'package:recruiting_app/sign_in.dart';


class CandidateScreen extends StatefulWidget {
  const CandidateScreen({Key? key}) : super(key: key);

  @override
  State<CandidateScreen> createState() => _CandidateScreenState();
}

class _CandidateScreenState extends State<CandidateScreen> {
  List<UserDetails> userList = [];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      String jsonData = await rootBundle.loadString('assets/candidate.json');
      List<dynamic> jsonList = jsonDecode(jsonData);
      List<UserDetails> loadedUsers = jsonList.map((json) => UserDetails.fromJson(json)).toList();

      setState(() {
        userList = loadedUsers;
      });
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: _logout,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CreatePostScreen()),
                    );
                  },
                  icon: const Icon(Icons.add, size: 30, color: Color(0xFF232946)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFB8C1EC)),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(4, 4, 4, 4)),
                  ),
                ),
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
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidateDetailScreen(user: userList[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF232946),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Hero(
                              tag: userList[index].photo,
                              child: Image(
                                width: 100,
                                height: 100,
                                image: AssetImage(
                                  "images/${userList[index].photo}",
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userList[index].user,
                                  style: const TextStyle(color: Color(0xFFEEBBC3), fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  userList[index].position,
                                  style: const TextStyle(color: Color(0xFFB8C1EC), fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  userList[index].company,
                                  style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } catch (e) {
      print('Error logging out: $e');
    }
  }
}