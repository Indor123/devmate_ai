import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiUrl = "https://brochure-sell-tumor-privileges.trycloudflare.com/analyze";

  static Future<int?> getMatchScore(String resumeText, String jobDescription) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'resumeText': resumeText,
          'jobDescription': jobDescription,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['matchScore'];
      } else {
        print("API error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error connecting to API: $e");
      return null;
    }
  }
}
