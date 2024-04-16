import 'package:flutter/material.dart';
import 'package:recruiting_app/job_listing.dart';
import 'package:recruiting_app/job.dart';
import 'package:recruiting_app/candidate.dart';
import 'package:recruiting_app/create_post.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key, required this.job});

  final Job job;

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
              physics: const NeverScrollableScrollPhysics(),
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
                          tag: job.image,
                          child: Image(
                            width: 150,
                            height: 150,
                            image: AssetImage(
                              "images/${job.image}",
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                job.user,
                                style: const TextStyle(color: Color(0xFFEEBBC3), fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                job.title,
                                style: const TextStyle(color: Color(0xFFB8C1EC), fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                job.date,
                                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                job.desc,
                                style: const TextStyle(color: Color(0xFFFFFFFF), fontSize: 12),
                              ),
                              const SizedBox(height: 10),

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
}