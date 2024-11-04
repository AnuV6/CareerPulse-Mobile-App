import 'package:flutter/material.dart';
import 'package:career_pulse/pages/ChatGPTApi.dart';
import 'score_widget.dart';

class ScoreProviderWidget extends StatefulWidget {
  final String resumeText;
  final String linkedinUrl;

  const ScoreProviderWidget({
    Key? key,
    required this.resumeText,
    required this.linkedinUrl,
  }) : super(key: key);

  @override
  _ScoreProviderWidgetState createState() => _ScoreProviderWidgetState();
}

class _ScoreProviderWidgetState extends State<ScoreProviderWidget> {
  late Future<Map<String, dynamic>> scoreFuture;
  final ChatGPTApi api = ChatGPTApi();

  @override
  void initState() {
    super.initState();
    scoreFuture = getScoreAndComment(widget.resumeText);
  }

  Future<Map<String, dynamic>> getScoreAndComment(String resumeText) async {
    // Prepare the prompt
    final prompt = 'Score this resume: $resumeText';

    // Call the sendMessage method from ChatGPTApi
    final response = await api.sendMessage(prompt);

    // Check if there's an error in the response
    if (response.containsKey('error')) {
      return {
        'score': 0,
        'comment': 'Error occurred while scoring the resume: ${response['error']}'
      };
    }

    // Assume response contains the score and comment as part of the data
    // Adjust based on actual structure of the response data
    final score = extractScoreFromResponse(response);
    final comment = extractCommentFromResponse(response);

    return {'score': score, 'comment': comment};
  }

  int extractScoreFromResponse(Map<String, dynamic> response) {
    // Extract the score from the response. Adjust based on actual response structure.
    if (response.containsKey('score')) {
      return response['score'] as int;
    } else {
      // Default to 0 if score is not found
      return 0;
    }
  }

  String extractCommentFromResponse(Map<String, dynamic> response) {
    // Extract a comment or additional feedback from the response if available
    if (response.containsKey('comment')) {
      return response['comment'] as String;
    } else {
      // Default comment if none is found
      return "No additional feedback available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: scoreFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Error retrieving score')),
          );
        } else {
          final score = snapshot.data?['score'] ?? 0;
          final comment = snapshot.data?['comment'] ?? 'No comment available';

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ScoreWidget(score: score, comment: comment),
              ),
            );
          });
          return Container();
        }
      },
    );
  }
}
