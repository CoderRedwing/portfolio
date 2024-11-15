import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  // Function to launch URL
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Function to send email
  Future<void> _sendEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal.shade50,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Connect with me",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.teal[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Let's work together to create something amazing.",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GitHub Button
              IconButton(
                icon: Icon(Icons.code, color: Colors.grey[700]),
                onPressed: () {
                  _launchURL('https://github.com/CoderRedwing');
                },
                tooltip: 'GitHub',
              ),
              // LinkedIn Button
              IconButton(
                icon: Icon(Icons.link, color: Colors.grey[700]),
                onPressed: () {
                  _launchURL('https://www.linkedin.com/in/ajitesh-mishra-a32825227/');
                },
                tooltip: 'LinkedIn',
              ),
              // Email Button
              IconButton(
                icon: Icon(Icons.email, color: Colors.grey[700]),
                onPressed: () {
                  _sendEmail('ajiteshru@gmail.com');
                },
                tooltip: 'Email',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
