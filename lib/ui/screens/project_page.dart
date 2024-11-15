import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectPage extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      'title': 'Smart Yoga Mat App',
      'description': 'An IoT-based app to control and monitor your smart yoga mat.',
      'github': 'https://github.com/yourusername/smart-yoga-mat-app'
    },
    {
      'title': 'Code Compiler Editor',
      'description': 'An online code editor and compiler with support for multiple languages.',
      'github': 'https://github.com/yourusername/code-compiler-editor'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: projects.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    projects[index]['title']!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal[800],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    projects[index]['description']!,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        _showProjectDetails(context, projects[index]['github']!);
                      },
                      child: const Text(
                        'More Details',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showProjectDetails(BuildContext context, String githubLink) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Project Details'),
          content: const Text('You can view the complete project on GitHub.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
            TextButton(
              onPressed: () {
                _launchURL('https://github.com/CoderRedwing'); // Open the GitHub link
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('GitHub'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
