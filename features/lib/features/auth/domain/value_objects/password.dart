import 'package:infra/infra.dart';
import 'package:rules/rules.dart';

import '../../auth.dart';

class Password extends ValueObject<String> {
  @override
  final Result<ValueFailure<String>, String> value;

  factory Password(String input) {
    const oneUpperAndLowerCharAndDigit = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~])';
    final rule = Rule(
      input,
      name: 'Password',
      regex: RegExp(oneUpperAndLowerCharAndDigit),
      minLength: 8,
    );
    return rule.hasError ? Password._(Error(InvalidPassword(input))) : Password._(Success(input));
  }

  const Password._(this.value);
}
