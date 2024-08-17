import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobSearchScreen extends StatefulWidget {
  @override
  _JobSearchScreenState createState() => _JobSearchScreenState();
}

class _JobSearchScreenState extends State<JobSearchScreen> {
  final TextEditingController _keywordsController = TextEditingController();
  List<dynamic> _jobs = [];

  Future<void> searchJobs(List<String> keywords) async {
    final url = Uri.parse('http://localhost:3000/api/search-jobs');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "keywords": keywords,
        "location": "Sri Lanka",
        "dateSincePosted": "past Week",
        "jobType": "I",
        "remoteFilter": "",
        "salary": "",
        "experienceLevel": "internship",
        "limit": "10",
        "sortBy": "recent",
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _jobs = jsonDecode(response.body);
      });
    } else {
      print('Failed to fetch jobs: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _keywordsController,
              decoration: InputDecoration(
                labelText: 'Enter Keywords (comma-separated)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                List<String> keywords = _keywordsController.text.split(',').map((e) => e.trim()).toList();
                searchJobs(keywords);
              },
              child: Text('Search Jobs'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _jobs.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_jobs[index]['position'] ?? 'No title'),
                      subtitle: Text(_jobs[index]['company'] ?? 'No company'),
                      trailing: Text(_jobs[index]['location'] ?? 'No location'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
