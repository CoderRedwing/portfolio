import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final String email = "Aman@gmail.com";
  final String linkedInUrl = "https://www.linkedin.com/in/ajitesh-mishra-a32825227/";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Handle the send button logic (send email via EmailJS)
  Future<void> _sendMessage() async {
    final name = _nameController.text;
    final email = _emailController.text;
    final message = _messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      // Show an error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all fields.")),
      );
    } else {
      // Construct the payload to send to EmailJS
      final payload = {
        'service_id': 'service_lczryqn', // Replace with your EmailJS service ID
        'template_id': 'template_u6qze1u', // Replace with your EmailJS template ID
        'user_id': 'g7rfutVUHGzT19B9e', // Replace with your EmailJS user ID
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message,
        },
      };

      try {
        // Make the POST request to EmailJS
        final response = await http.post(
          Uri.parse('https://api.emailjs.com/api/v1.0/email/send'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode(payload),
        );

        // Check the response
        if (response.statusCode == 200) {
          // Show success message in dialog
          _showMessageDialog('Message sent successfully!');
        } else {
          // Show failure message in dialog
          _showMessageDialog('Failed to send message.');
        }

        // Clear form fields after sending the message
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

      } catch (e) {
        // Show error message in dialog
        _showMessageDialog('An error occurred: $e');
      }
    }
  }

  void _showMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Status'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


  // Launch URL for LinkedIn and Email
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Me'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Grateful Message
              Text(
                'Thank you for reaching out! I would love to hear from you.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * 0.02),
              // Centered Card Layout for the form
              Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          // Name Input
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(labelText: 'Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Email Input
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(labelText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty || !value.contains('@')) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Message Input
                          TextFormField(
                            controller: _messageController,
                            decoration: InputDecoration(labelText: 'Message'),
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your message';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          // Send Button
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _sendMessage();
                              }
                            },
                            child: Text('Send Mail'),
                            style: ElevatedButton.styleFrom(primary: Colors.teal),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // LinkedIn Profile
              ListTile(
                leading: Icon(Icons.web, color: Colors.teal),
                title: Text('LinkedIn Profile'),
                onTap: () => _launchURL(linkedInUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
