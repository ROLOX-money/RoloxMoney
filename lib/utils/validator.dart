// ignore: avoid_classes_with_only_static_members
/*Chinnadurai Viswanathan*/

class Validator {
  static final RegExp _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static ValidationState validate(String input, {required List<String> rules}) {
    for (int i = 0; i < rules.length; i++) {
      final String rule = rules[i];
      if (rule == 'required') {
        if (input.trim() == '') {
          return ValidationState(error: 'This field is required');
        }
      }

      if (rule == 'expiry') {
        if (input.trim() == '') {
          return ValidationState(error: 'Enter expiry');
        }
      }
      if (rule == 'misMatch') {
        if (input.trim() == '') {
          return ValidationState(error: 'This field is required');
        } else {
          // final RegExp regex = RegExp(r'(\d+)');
          // return ValidationState(error: 'Enter the Correct Account Number');
        }
      }

      if (rule == 'CVV') {
        if (input.trim() == '') {
          return ValidationState(error: 'Enter CVV');
        }
      }

      if (rule == 'email') {
        if (input == '') {
          return ValidationState(error: 'This field is required');
        }
        if (!_emailRegExp.hasMatch(input)) {
          return ValidationState(error: 'Email format is invalid');
        }
      }

      if (rule.startsWith("min:")) {
        try {
          int? letterCount = int.tryParse(rule.replaceAll("min:", ""));
          if (input.length < letterCount!) {
            return ValidationState(
                status: false,
                error: " should be min $letterCount character long");
          }
        } catch (_) {
          return ValidationState(status: false, error: " - $rule is incorrect");
        }
      }

      if (rule == 'number_only') {
        final RegExp regex = RegExp(r'(\d+)');
        if (!regex.hasMatch(input)) {
          // ignore: avoid_redundant_argument_values
          return ValidationState(status: false, error: 'Value is not a number');
        }
      }

      if (rule == 'mobile_number') {
        const String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
        final RegExp regExp = RegExp(pattern);
        if (input.isEmpty) {
          return ValidationState(error: 'Please enter mobile number');
        } else if (!regExp.hasMatch(input)) {
          return ValidationState(error: 'Please enter valid  mobile number');
        }
      }

      if (rule == 'pan') {
        final RegExp panregExp = RegExp(r'([A-Z]{5}[0-9]{4}[A-Z]{1})');
        if (input == '') {
          return ValidationState(error: 'This field is required');
        }
        if (!panregExp.hasMatch(input)) {
          return ValidationState(error: 'Invalid PAN');
        }
      }

      if (rule == 'aadhar') {
        final RegExp aadharregExp =
            RegExp(r'(^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$)');
        if (input == '') {
          return ValidationState(error: 'This field is required');
        }
        if (!aadharregExp.hasMatch(input)) {
          return ValidationState(error: 'Invalid Aadhar');
        }
      }

      if (rule == 'aadhar') {
        final RegExp aadharregExp =
            RegExp(r'(^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$)');
        if (input == '') {
          return ValidationState(error: 'This field is required');
        }
        if (!aadharregExp.hasMatch(input)) {
          return ValidationState(error: 'Invalid Aadhar');
        }
      }
      if (rule == 'dailyLimit') {
        if (input.isNotEmpty) {
          if (double.parse(input) < 1000) {
            return ValidationState(error: 'Enter a value greater than 1000');
          }
          if (double.parse(input) > 100000) {
            return ValidationState(error: 'Enter a value less than 100000');
          }
        }
      }
    }

    return ValidationState(status: true);
  }
}

class ValidationState {
  bool status;
  String? error;

  ValidationState({this.status = false, this.error});
}
