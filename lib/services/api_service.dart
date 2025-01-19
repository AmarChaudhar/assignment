import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:assignment/models/quiz_question_models.dart.dart';

class QuizApiService {
  static const String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  // Fetch quiz data
  static Future<QuizQuestionModels?> fetchQuizData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return QuizQuestionModels.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load quiz data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
