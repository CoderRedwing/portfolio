import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Portfolio app landing page loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());
    expect(find.text("Hi, I'm Ajitesh"), findsOneWidget);
    expect(find.byType(IconButton), findsWidgets);
    expect(find.text("Explore Projects"), findsOneWidget);
    expect(find.text("Contact Me"), findsOneWidget);
  });
}
