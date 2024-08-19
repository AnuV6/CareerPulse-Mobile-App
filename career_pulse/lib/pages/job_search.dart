import 'package:http/http.dart' as http;
import 'dart:convert';

class JobSearchService {
  Future<List<Map<String, dynamic>>> fetchJobs() async {
    final response = await http.post(
      Uri.parse('https://careerpulse-aqfdecdkbpg7cyeq.eastus-01.azurewebsites.net/api/search-jobs'), // Update with your server's IP and port
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'keywords': ['hr','software engineer','designer'], // Example keyword for testing
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
        // Parse the JSON response
        List<dynamic> fetchedJobs = jsonDecode(response.body);

        // Print the raw response body for debugging
        print('Response body: ${response.body}');

        // Check if fetchedJobs contains valid entries
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
