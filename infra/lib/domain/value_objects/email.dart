import 'package:equatable/equatable.dart';
import 'package:infra/domain/domain.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rules/rules.dart';

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
