import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// JobSearchService class to fetch jobs from the API
class JobSearchService {
  Future<List<Map<String, dynamic>>> fetchJobs() async {
    final response = await http.post(
      Uri.parse('https://careerpulse-aqfdecdkbpg7cyeq.eastus-01.azurewebsites.net/api/search-jobs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'keywords': ['business', 'designer', 'developer'], // Example keyword for testing
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

        // Print the raw response body for debugging
        print('Response body: ${response.body}');

        if (fetchedJobs.isEmpty) {
          print('No jobs found or invalid job data.');
          return [];
        }

        // Filter out any null entries and add detailed logging
        List<Map<String, dynamic>> validJobs = [];
        for (var job in fetchedJobs) {
          if (job != null && job is Map<String, dynamic>) {
            try {
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
            } catch (e) {
              print('Error processing job: $job');
              print('Error: $e');
            }
          } else {
            print('Invalid or null job entry found and skipped.');
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
  @override
  _JobSearchPageState createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  List<Map<String, dynamic>> _jobs = []; // List to store job data
  final JobSearchService _jobSearchService = JobSearchService(); // Instance of JobSearchService

  @override
  void initState() {
    super.initState();
    _fetchJobs(); // Fetch initial jobs
  }

  Future<void> _fetchJobs() async {
    try {
      // Fetch jobs using the JobSearchService
      List<Map<String, dynamic>> jobs = await _jobSearchService.fetchJobs();
      setState(() {
        _jobs = jobs; // Update the state with the fetched jobs
      });
    } catch (e) {
      print('Failed to fetch jobs: $e');
    }
  }

  Future<void> _onRefresh() async {
    // Call _fetchJobs to update the job listings when the user swipes down
    await _fetchJobs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
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
                // Optionally, handle job tap to open a detailed view or job URL
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
  runApp(MaterialApp(
    home: JobSearchPage(),
  ));
}
