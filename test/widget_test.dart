// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:s_pay/presentation/pages/auth/login/widgets/validator.dart';

void main() {
  group("Email Validation", () {
    // failed cases
    test("validate for empty phoneNumber", () {
      //arrange $ act
      var result = Validator.validatePhoneNumber('');
      //Assert
      expect(result, "Phone Number cannot be empty");
    });

    test("validate for invalid phoneNumber", () {
      // arrange & act
      var result = Validator.validatePhoneNumber('836725643');
      // assert
      expect(result, "Enter a valid phone number");
    });
    // success
    test("validate for valid phoneNumber", () {
      // arrange & act
      var result = Validator.validatePhoneNumber('9061855558');
      // assert
      expect(result, null);
    });
  });

  group('Password Validation', () {
    test('validate for empty password', () {
      var result = Validator.validatePassword('');
      expect(result, "Password cannot be empty");
    });

    test('validate for invalid password', () {
      var result = Validator.validatePassword('12345');
      expect(result, "Password must be 6 characters long");
    });

    test('validate for valid password', () {
      var result = Validator.validatePassword('123456');
      expect(result, "Password must be 6 characters long");
    });
  });

  
}
