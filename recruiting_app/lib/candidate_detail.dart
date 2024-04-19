import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recruiting_app/candidate.dart';
import 'package:recruiting_app/create_post.dart';
import 'package:recruiting_app/job_listing.dart';
import 'package:recruiting_app/sign_in.dart';
import 'package:recruiting_app/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CandidateDetailScreen extends StatefulWidget {
  const CandidateDetailScreen({Key? key, required this.user}) : super(key: key);

  final UserDetails user;

  @override
  _CandidateDetailScreenState createState() => _CandidateDetailScreenState();
}

class _CandidateDetailScreenState extends State<CandidateDetailScreen> {
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    // Retrieve the connection status when the page is loaded
    _retrieveConnectionStatus();
  }

  Future<void> _retrieveConnectionStatus() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        // Set the connection status from the stored value
        isConnected = prefs.getBool('isConnected_${widget.user.email}') ?? false;
      });
    } catch (e) {
      print('Error retrieving connection status: $e');
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
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(5),
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
                          tag: widget.user.photo,
                          child: Image(
                            width: 150,
                            height: 150,
                            image: AssetImage(
                              "images/${widget.user.photo}",
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user.user,
                                style: const TextStyle(color: Color(0xFFEEBBC3), fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.user.position,
                                style: const TextStyle(color: Color(0xFFB8C1EC), fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.user.company,
                                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                widget.user.userdesc,
                                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () => _connectWithCandidate(context),
                                child: Text(isConnected ? 'Connected' : 'Connect'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _connectWithCandidate(BuildContext context) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // User is not signed in
        return;
      }

      // Save connection status to shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isConnected_${widget.user.email}', true);

      // Update connection status
      setState(() {
        isConnected = true;
      });

      // Connection successfully stored
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Connected with candidate successfully')),
      );
    } catch (e) {
      // Handle any errors that occur during connection
      print('Error connecting with candidate: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error connecting with candidate')),
      );
    }
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