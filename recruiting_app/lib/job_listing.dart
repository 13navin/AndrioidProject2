import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recruiting_app/job.dart';
import 'package:recruiting_app/job_detail.dart';
import 'package:recruiting_app/candidate.dart';
import 'package:recruiting_app/home.dart';
import 'package:recruiting_app/create_post.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  List<Job> jobList = [];

  @override
  void initState() {
    super.initState();
    _loadJobData();
  }

  Future<void> _loadJobData() async {
    String jsonData = await rootBundle.loadString('assets/job.json');
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<Job> loadedJobs = jsonList.map((json) => Job.fromJson(json)).toList();

    setState(() {
      jobList = loadedJobs;
    });
  }

  Future<void> _saveJobData() async {
    List<Map<String, dynamic>> jsonList = jobList.map((job) => job.toJson()).toList();
    String jsonData = jsonEncode(jsonList);
    final file = File('assets/job.json');
    await file.writeAsString(jsonData);
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
              onPressed: () {},
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
                      MaterialPageRoute(builder: (context) => const CandidateScreen()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(const Color(0xFFB8C1EC)),
                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                  ),
                  child: const Text(
                    'VIEW USERS',
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
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobDetailScreen(job: jobList[index]),
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
                              tag: jobList[index].image,
                              child: Image(
                                width: 100,
                                height: 100,
                                image: AssetImage(
                                  "images/${jobList[index].image}",
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  jobList[index].user,
                                  style: const TextStyle(color: Color(0xFFEEBBC3), fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  jobList[index].title,
                                  style: const TextStyle(color: Color(0xFFB8C1EC), fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  jobList[index].date,
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
}