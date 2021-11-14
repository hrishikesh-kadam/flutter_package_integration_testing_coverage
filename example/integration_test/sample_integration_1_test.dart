import 'package:example/main.dart';
import 'package:flutter_package_integration_testing_coverage/flutter_package_integration_testing_coverage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sample Integration Test 1', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MyHomePage), findsOneWidget);
  });
}
