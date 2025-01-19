import 'package:flutter/material.dart';

class SummaryScreen extends StatelessWidget {
  final int totalScore;
  final int totalQuestions;

  const SummaryScreen({
    required this.totalScore,
    required this.totalQuestions,
    Key? key,
  }) : super(key: key);

  String _getBadge() {
    final percentage = (totalScore / totalQuestions) * 100;
    if (percentage >= 90) return 'Gold Star 🏆';
    if (percentage >= 70) return 'Silver Star ✨';
    return 'Bronze Star 🌟';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Quiz Completed!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                'You scored $totalScore out of $totalQuestions',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Badge: ${_getBadge()}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Retry Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
