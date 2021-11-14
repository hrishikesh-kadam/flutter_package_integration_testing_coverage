import 'package:flutter/material.dart';
import 'package:flutter_package_integration_testing_coverage/flutter_package_integration_testing_coverage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sample Widget Test', (WidgetTester tester) async {
    final sampleApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
    await tester.pumpWidget(sampleApp);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
