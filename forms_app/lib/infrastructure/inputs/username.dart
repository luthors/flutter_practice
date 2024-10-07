import 'package:formz/formz.dart';

// Define input validation errors
enum UsernameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class Username extends FormzInput<String, UsernameInputError> {
  // Call super.pure to represent an unmodified form input.
  const Username.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Username.dirty( String value ) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure ) return null;
    if ( displayError == UsernameInputError.empty) return 'Required field';
    if ( displayError == UsernameInputError.length) return 'Min 6 characters';

    return null;
  }
  // Override validator to handle validating a given input value.
  @override
  UsernameInputError? validator(String value) {

    if (value.trim().isEmpty) return UsernameInputError.empty;
    if (value.length < 6) return UsernameInputError.length;

    return null;
  }
}