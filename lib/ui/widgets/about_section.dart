import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key});

  // A function to launch the URL in a browser
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    debugPrint('Launching $uri');
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens the URL in an external browser
      );
    } else {
      debugPrint('Launching $uri');
      throw 'Could not launch $url';
    }
  }

  final List<Map<String, String>> skills = [
    {
      'title': 'Flutter Development',
      'description': 'A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.',
      'url': 'https://flutter.dev'
    },
    {
      'title': 'Backend Development',
      'description': 'Building robust and scalable backend services using Node.js and Express.js.',
      'url': 'https://nodejs.org/en/'
    },
    {
      'title': 'Database Management',
      'description': 'Efficient management of relational databases (PostgreSQL) and NoSQL databases (MongoDB).',
      'url': 'https://www.postgresql.org/'
    },
    {
      'title': 'API Development',
      'description': 'Designing and implementing RESTful APIs for seamless communication between systems.',
      'url': 'https://swagger.io/docs/specification/about/'
    },
    {
      'title': 'Cloud Technologies',
      'description': 'Leveraging cloud platforms like AWS and Google Cloud to deploy and manage applications.',
      'url': 'https://aws.amazon.com/'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: skills.length + 1, // Add 1 for the introductory text
        itemBuilder: (context, index) {
          if (index == 0) {
            // Add the introductory text before the cards
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'I\'m a mobile and web developer with expertise in backend technologies and Flutter development. I create modern, efficient applications that provide seamless user experiences. My skills include:',
                  style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                ),
                const SizedBox(height: 20),
              ],
            );
          } else {
            // Display skill cards
            int skillIndex = index - 1; // Adjust index for the skills list
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      skills[skillIndex]['title']!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      skills[skillIndex]['description']!,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          _launchURL(skills[skillIndex]['url']!);
                        },
                        child: const Text(
                          'Learn More',
                          style: TextStyle(color: Colors.teal),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
