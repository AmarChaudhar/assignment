import 'package:assignment/models/quiz_question_models.dart.dart';
import 'package:flutter/material.dart';
import 'package:assignment/services/api_service.dart';
import 'summary_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuizQuestionModels? quizData;
  bool isLoading = true;
  Map<int, int?> selectedAnswers = {};
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchQuizData();
  }

  /// Fetch quiz data asynchronously and update the state.
  Future<void> fetchQuizData() async {
    try {
      final data = await QuizApiService.fetchQuizData();
      setState(() {
        quizData = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      _showErrorDialog("Failed to load quiz data. Please try again.");
    }
  }

  /// Display error dialog for any fetch issues.
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Error'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  /// Calculate the total score and navigate to the summary screen.
  void _submitQuiz() {
    int totalScore = 0;

    if (quizData?.questions != null) {
      for (var question in quizData!.questions!) {
        final selectedOptionId = selectedAnswers[question.id];
        final correctOption = question.options?.firstWhere(
          (option) => option.isCorrect == true,
        );
        if (correctOption != null && selectedOptionId == correctOption.id) {
          totalScore++;
        }
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => SummaryScreen(
              totalScore: totalScore,
              totalQuestions: quizData?.questions?.length ?? 0,
            ),
      ),
    );
  }

  /// Navigate to the next question or submit if it's the last one.
  void _nextOrSubmit() {
    if (currentQuestionIndex == (quizData?.questions?.length ?? 1) - 1) {
      _submitQuiz();
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  /// Determine if the "Next" button should be enabled.
  bool _isNextEnabled() {
    final questionId = quizData?.questions?[currentQuestionIndex].id;
    return selectedAnswers.containsKey(questionId) &&
        selectedAnswers[questionId] != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Screen')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : quizData == null || quizData!.questions!.isEmpty
              ? const Center(child: Text('No data available'))
              : Column(
                children: [
                  _buildProgressIndicator(),
                  Expanded(child: _buildQuestionCard()),
                  _buildNextButton(),
                ],
              ),
    );
  }

  /// Build a progress indicator to track quiz progress.
  Widget _buildProgressIndicator() {
    final progress =
        (currentQuestionIndex + 1) / (quizData?.questions?.length ?? 1);
    return LinearProgressIndicator(
      value: progress,
      minHeight: 8,
      backgroundColor: Colors.grey.shade300,
      color: Colors.blue,
    );
  }

  /// Build a card displaying the current question and its options.
  Widget _buildQuestionCard() {
    final question = quizData!.questions![currentQuestionIndex];
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q${currentQuestionIndex + 1}: ${question.description}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ...question.options!.map(
              (option) => RadioListTile<int>(
                value: option.id!,
                groupValue: selectedAnswers[question.id],
                title: Text(option.description ?? ''),
                onChanged: (value) {
                  setState(() => selectedAnswers[question.id!] = value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build the "Next" or "Submit" button for the quiz.
  Widget _buildNextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ElevatedButton(
        onPressed: _isNextEnabled() ? _nextOrSubmit : null,
        child: Text(
          currentQuestionIndex == (quizData?.questions?.length ?? 1) - 1
              ? 'Submit Quiz'
              : 'Next Question',
        ),
      ),
    );
  }
}
