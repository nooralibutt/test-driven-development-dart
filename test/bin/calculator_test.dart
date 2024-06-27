import 'package:test/test.dart';

import '../../bin/calculator.dart';

void main() {
  // Arrange
  // In the Arrange phase, we just need to create the object of the unit that we need to test and prepare the prerequisites for our test, i.e., set up the state variable, set up mocks, etc. The Arrange phase may or may not exist based on the need.
  late final Calculator calculator;
  setUpAll(() {
    calculator = Calculator();
  });

  group('Additive Operations', () {
    test('Add two numbers', () {
      // Act
      // In the Act phase, we run the unit with some state(passing arguments) and store the result if any.
      final result = calculator.add(23, 24);

      // Assert
      // In the Assert phase, we verify whether the unit behaves as expected. We may expect a method to be called or the result to be the same as the expected result.
      // The Arrange and Act phase are not compulsory.
      expect(result, 47);
    });

    test('Add two negative numbers', () {
      final result = calculator.add(-23, -24);

      expect(result, -47);
    });
    test('Add mix signed numbers', () {
      final result = calculator.add(-23, 24);

      expect(result, 1);
    });
  });

  group('Subtractive Operations', () {
    test('Subtract two numbers', () {
      final result = calculator.subtract(23, 24);

      expect(result, -1);
    });

    test('Subtract two negative numbers', () {
      final result = calculator.subtract(-23, -24);

      expect(result, 1);
    });

    test('Subtract two negative numbers with larger number has negative sign',
        () {
      final result = calculator.subtract(-24, -23);

      expect(result, -1);
    });

    test('Subtract mix signed numbers', () {
      final result = calculator.subtract(-23, 24);

      expect(result, -47);
    });

    test('Subtract mix signed numbers with larger number has negative sign',
        () {
      final result = calculator.subtract(23, -24);

      expect(result, 47);
    });

    test('Subtract mix signed numbers with smaller number has negative sign',
        () {
      final result = calculator.subtract(-23, 24);

      expect(result, -47);
    });
  });

  group('Multiplication operations', () {
    test('Multiply positive number with 0', () {
      expect(calculator.multiply(0, 6), 0);
      expect(calculator.multiply(6, 0), 0);
    });

    test('Multiply negative number with 0', () {
      expect(calculator.multiply(0, -6), 0);
      expect(calculator.multiply(-6, 0), 0);
    });

    test('Multiply negative numbers', () {
      expect(calculator.multiply(-6, -6), 36);
      expect(calculator.multiply(-6, -5), 30);
    });

    test('Multiply positive numbers', () {
      expect(calculator.multiply(6, 6), 36);
      expect(calculator.multiply(6, 5), 30);
    });

    test('Multiply mixed signed numbers', () {
      expect(calculator.multiply(-6, 5), -30);
      expect(calculator.multiply(6, -5), -30);
    });
  });
}
