import 'package:http/http.dart' as http;
import 'dart:convert';

class JobSearchService {
  Future<List<Map<String, dynamic>>> fetchJobs() async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/api/search-jobs'), // Update with your server's IP and port
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'keywords': ['Designer'], // Example keyword for testing
        'location': 'Sri Lanka', // Example location
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
      // Print the raw response body for debugging
      print('Response body: ${response.body}');

      List<dynamic> fetchedJobs = jsonDecode(response.body);

      // Check if fetchedJobs contains valid entries
      if (fetchedJobs.isEmpty) {
        print('No jobs found or invalid job data.');
        return [];
      }

      // Filter out any null entries and add detailed logging
      List<Map<String, dynamic>> validJobs = [];
      for (var job in fetchedJobs) {
        if (job != null) {
          try {
            validJobs.add({
              'companyLogo': job['companyLogo'] ?? 'assets/ilogo4.png',
              'title': job['position'] ?? 'Software Engineering',
              'company': job['company'] ?? 'Vertusa Software Solution',
              'role': 'Web Developer',
              'location': job['location'] ?? 'Colombo, Sri Lanka.',
              'date': job['date'] ?? '2024-08-13',
              'daysAgo': job['agoTime'] ?? '2 days ago',
              'jobUrl': job['jobUrl'] ?? '',
            });
          } catch (e) {
            print('Error processing job: $job');
            print('Error: $e');
          }
        } else {
          print('Null job entry found and skipped.');
        }
      }

      return validJobs;
    } else {
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Failed to load jobs');
    }
  }
}
