import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatGPTApi {
  final String _apiUrl = 'https://apiservercp.azurewebsites.net/api/chatgpt';

  Future<Map<String, dynamic>> sendMessage(String message) async {
    try {
      // Define request headers
      final headers = {
        'Content-Type': 'application/json',
      };

      // Define request payload
      final body = json.encode({
        "message": message,
      });

      // Make POST request
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: headers,
        body: body,
      );

      // Check for a successful response
      if (response.statusCode == 200) {
        return json.decode(response.body);  // Successful response
      } else {
        // Error handling for non-200 status codes
        print("Error: ${response.statusCode} - ${response.reasonPhrase}");
        return {
          "error": "Failed to communicate with ChatGPT API",
          "statusCode": response.statusCode,
          "details": response.reasonPhrase,
          "response": json.decode(response.body)
        };
      }
    } catch (e) {
      // Handle any exceptions, likely due to network or parsing issues
      print("Exception occurred: $e");
      return {
        "error": "Exception occurred",
        "details": e.toString()
      };
    }
  }
}
