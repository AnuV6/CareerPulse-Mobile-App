import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// JobSearchService class to fetch jobs from the API
class JobSearchService {
  Future<List<Map<String, dynamic>>> fetchJobs(List<String> keywords) async {
    final response = await http.post(
      Uri.parse('https://apiservercp.azurewebsites.net/api/search-jobs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'keywords': keywords,
        'location': 'Sri Lanka',
        'experienceLevel': 'internship',
        'dateSincePosted': 'past Week',
        'jobType': 'I',
        'remoteFilter': '',
        'salary': '',
        'limit': '10',
        'sortBy': 'recent',
      }),
    );

    if (response.statusCode == 200) {
      try {
        List<dynamic> fetchedJobs = jsonDecode(response.body);
        List<Map<String, dynamic>> validJobs = [];
        for (var job in fetchedJobs) {
          if (job != null && job is Map<String, dynamic>) {
            validJobs.add({
              'companyLogo': job['companyLogo'] ?? 'assets/ilogo4.png',
              'title': job['position'] ?? 'Software Engineering',
              'company': job['company'] ?? 'Vertusa Software Solution',
              'role': job['position'] ?? 'Software Engineer',
              'location': job['location'] ?? 'Colombo, Sri Lanka.',
              'date': job['date'] ?? '2024-08-23',
              'daysAgo': job['agoTime'] ?? '5 days ago',
              'jobUrl': job['jobUrl'] ?? 'lk.linkedin.com',
            });
          }
        }
        return validJobs;
      } catch (e) {
        print('Error decoding JSON: $e');
        throw Exception('Failed to parse jobs');
      }
    } else {
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load jobs');
    }
  }
}

// Main JobSearchPage widget
class JobSearchPage extends StatefulWidget {
  const JobSearchPage({super.key});

  @override
  _JobSearchPageState createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  List<Map<String, dynamic>> _jobs = [];
  final JobSearchService _jobSearchService = JobSearchService();

  @override
  void initState() {
    super.initState();
    _fetchJobs(); // Fetch initial jobs
  }

  Future<void> _fetchJobs() async {
    try {
      // Fetch the current user's interested areas from Firestore
      List<String> keywords = await _fetchUserInterestedAreas();
      // Fetch jobs using the JobSearchService with the keywords
      List<Map<String, dynamic>> jobs = await _jobSearchService.fetchJobs(keywords);
      setState(() {
        _jobs = jobs;
      });
    } catch (e) {
      print('Failed to fetch jobs: $e');
    }
  }

  Future<List<String>> _fetchUserInterestedAreas() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (snapshot.exists && snapshot.data() != null) {
          Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
          List<String> interests = List<String>.from(data['interestedAreas'] ?? []);
          return interests;
        } else {
          print('No interested areas found for the user.');
          return [];
        }
      } else {
        throw Exception('No authenticated user.');
      }
    } catch (e) {
      print('Failed to fetch user interests: $e');
      return [];
    }
  }

  Future<void> _onRefresh() async {
    await _fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: _jobs.length,
          itemBuilder: (context, index) {
            final job = _jobs[index];
            return ListTile(
              leading: Image.network(job['companyLogo']),
              title: Text(job['title']),
              subtitle: Text('${job['company']} • ${job['role']}\n${job['location']}'),
              trailing: Text('${job['daysAgo']} days ago'),
              onTap: () {
                print('Job URL: ${job['jobUrl']}');
              },
            );
          },
        ),
      ),
    );
  }
}

// Example of how to use the JobSearchPage in your app
void main() {
  runApp(const MaterialApp(
    home: JobSearchPage(),
  ));
}
