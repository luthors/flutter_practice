import 'package:formz/formz.dart';

// Define input validation errors
enum EmailInputError { empty, format }

// Extend FormzInput and provide the input type and error type.
class Email extends FormzInput<String, EmailInputError> {
  // Call super.pure to represent an unmodified form input.
  const Email.pure() : super.pure('');

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  // Call super.dirty to represent a modified form input.
  const Email.dirty( super.value ) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure ) return null;
    if ( displayError == EmailInputError.empty) return 'Required field';
    if ( displayError == EmailInputError.format) return 'format invalid';

    return null;
  }
  // Override validator to handle validating a given input value.
  @override
  EmailInputError? validator(String value) {

    if (value.isEmpty || value.trim().isEmpty) return EmailInputError.empty;
    
    if ( !emailRegExp.hasMatch(value) ) return EmailInputError.format;



    return null;
  }
}