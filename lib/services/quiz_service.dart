// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:testline/model/quiz_model.dart';

class QuizService {
  static const String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  Future<QuizModel?> fetchQuiz() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        
        // Check if the response body is not empty
        if (jsonResponse == null || jsonResponse.isEmpty) {
          print("Empty response received.");
          return null;
        }

        try {
          return QuizModel.fromJson(jsonResponse);
        } catch (e) {
          print("Error parsing quiz data: $e");
          return null;
        }
      } else {
        print("Failed to load quiz, status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching quiz: $e");
      return null;
    }
  }
}
