import 'package:flutter/material.dart';
import 'package:portfolio_app/ui/screens/landing_page.dart';
import 'package:portfolio_app/ui/screens/project_page.dart';
import 'package:portfolio_app/ui/screens/contact_page.dart';
import 'package:portfolio_app/ui/widgets/about_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/projects': (context) =>  ProjectPage(),
        '/contact': (context) =>  ContactPage(),
        '/about':(context) =>  AboutSection(),
      },
    );
  }
}
