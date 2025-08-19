import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TutorialService {
  static const String _tutorialShownKey = 'tutorial_shown';

  static Future<bool> shouldShowTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    return !(prefs.getBool(_tutorialShownKey) ?? false);
  }

  static Future<void> markTutorialAsShown() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_tutorialShownKey, true);
  }

  static void showTutorial(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const TutorialDialog(),
    );
  }
}

class TutorialDialog extends StatefulWidget {
  const TutorialDialog({super.key});

  @override
  State<TutorialDialog> createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<TutorialDialog> {
  int currentStep = 0;
  
  final List<TutorialStep> steps = [
    TutorialStep(
      title: 'Welcome to HEYLIST! 🎉',
      description: 'Your personal task manager to stay organized and productive.',
      icon: Icons.check_circle,
    ),
    TutorialStep(
      title: 'Add New Tasks',
      description: 'Tap the + button to add new tasks to your list.',
      icon: Icons.add,
    ),
    TutorialStep(
      title: 'Mark as Complete',
      description: 'Tap the checkbox to mark tasks as done.',
      icon: Icons.check_box,
    ),
    TutorialStep(
      title: 'Delete Tasks',
      description: 'Swipe left on any task to delete it.',
      icon: Icons.delete,
    ),
    TutorialStep(
      title: 'You\'re All Set! 🚀',
      description: 'Start organizing your tasks with HEYLIST!',
      icon: Icons.rocket_launch,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Step indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                steps.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index == currentStep ? Colors.black : Colors.grey[400],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                steps[currentStep].icon,
                color: Colors.yellow,
                size: 48,
              ),
            ),
            const SizedBox(height: 20),
            
            // Title
            Text(
              steps[currentStep].title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            
            // Description
            Text(
              steps[currentStep].description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            
            // Navigation buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (currentStep > 0)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        currentStep--;
                      });
                    },
                    child: const Text(
                      'Previous',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 80),
                
                if (currentStep < steps.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentStep++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                else
                  ElevatedButton(
                    onPressed: () async {
                      await TutorialService.markTutorialAsShown();
                      if (mounted) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Get Started!',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialStep {
  final String title;
  final String description;
  final IconData icon;

  TutorialStep({
    required this.title,
    required this.description,
    required this.icon,
  });
}
