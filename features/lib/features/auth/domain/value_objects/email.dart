import 'package:infra/infra.dart';
import 'package:rules/rules.dart';

import '../../auth.dart';

class Email extends ValueObject<String> {
  @override
  final Result<ValueFailure<String>, String> value;

  factory Email(String input) {
    final rule = Rule(
      input,
      name: 'Email',
      isRequired: true,
      isEmail: true,
    );
    return rule.hasError ? Email._(Error(InvalidEmail(input))) : Email._(Success(input));
  }

  const Email._(this.value);
}
