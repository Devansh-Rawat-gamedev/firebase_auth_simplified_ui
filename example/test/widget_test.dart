import 'package:firebase_auth_simplified_ui/firebase_auth_simplified_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth_simplified_ui_example/main.dart';

void main() {
  testWidgets('App loads without error', (WidgetTester tester) async {
    await tester.pumpWidget(const ExampleApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(FirebaseAuthLoginScreen), findsOneWidget);
  });
}
