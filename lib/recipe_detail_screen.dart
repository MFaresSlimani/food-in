import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final List<String> steps = List<String>.from(recipe['steps']);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
      ),
      body: PageView.builder(
        itemCount: steps.length,
        onPageChanged: (index) async {
          print('Current Step: ${index + 1}');
          print('Total Steps: ${steps.length}');

          try {
            final result = await FirebaseFunctions.instance
                .httpsCallable('onNextStep')
                .call(); // no arguments

            print('Result: ${result.data}');
          } catch (e) {
            print('Error calling function: $e');
          }
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step ${index + 1}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(steps[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
