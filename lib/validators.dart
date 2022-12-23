import 'package:form_field_validator/form_field_validator.dart';

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: '*required'),
    MinLengthValidator(6, errorText: 'password must be at least 8 digits long'),
  ],
);

final incorrectValidator = RequiredValidator(errorText: '*Incorrect entry');
