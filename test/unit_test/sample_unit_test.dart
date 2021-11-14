import 'package:flutter_package_integration_testing_coverage/src/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Sample Unit Test', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
  });
}
