import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_field_validator/form_field_validator.dart';

enum TextFieldType { Alphabet, Email, Text, Password, PhoneNumber, Number }

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextFieldType? textFieldType;
  final bool obscureText;
  final Widget? suffixIcon;
  final ValueChanged<String>? onChanged;
  final int? maxLength;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textFieldType,
    this.obscureText = false,
    this.suffixIcon,
    this.onChanged,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final alphabetValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      PatternValidator(r'^[A-Za-z_ .,]+$',
          errorText: AppLocalizations.of(context)!.invalid_name_format),
    ]);

    final emailValidator = MultiValidator([
      RequiredValidator(
          errorText:
              AppLocalizations.of(context)!.please_enter_your_email_address),
      EmailValidator(
          errorText: AppLocalizations.of(context)!.invalid_email_address_format)
    ]);

    final passwordValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_your_password),
      MinLengthValidator(6,
          errorText: AppLocalizations.of(context)!.invalid_password_format)
    ]);

    final phoneNumberValidator = MultiValidator([
      RequiredValidator(
          errorText:
              AppLocalizations.of(context)!.please_enter_your_phone_number),
      MinLengthValidator(10,
          errorText: AppLocalizations.of(context)!.invalid_phone_number_format),
      MaxLengthValidator(15,
          errorText: AppLocalizations.of(context)!.invalid_phone_number_format),
      PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
          errorText: AppLocalizations.of(context)!.invalid_phone_number_format),
    ]);

    final textValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      MinLengthValidator(1,
          errorText: AppLocalizations.of(context)!.data_is_too_short),
    ]);

    final numberValidator = MultiValidator([
      RequiredValidator(
          errorText: AppLocalizations.of(context)!.please_enter_a_value),
      MinLengthValidator(1,
          errorText: AppLocalizations.of(context)!.data_is_too_short),
      PatternValidator(r'^[0-9]+$',
          errorText: AppLocalizations.of(context)!.invalid_number_format),
    ]);

    keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.Alphabet:
          return TextInputType.text;
        case TextFieldType.Email:
          return TextInputType.emailAddress;
        case TextFieldType.Number:
          return TextInputType.number;
        case TextFieldType.Password:
          return TextInputType.text;
        case TextFieldType.PhoneNumber:
          return TextInputType.phone;
        case TextFieldType.Text:
          return TextInputType.text;
        default:
          return TextInputType.text;
      }
    }

    validator(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.Alphabet:
          return alphabetValidator;
        case TextFieldType.Email:
          return emailValidator;
        case TextFieldType.Number:
          return numberValidator;
        case TextFieldType.Password:
          return passwordValidator;
        case TextFieldType.PhoneNumber:
          return phoneNumberValidator;
        case TextFieldType.Text:
          return textValidator;
        default:
          return textValidator;
      }
    }

    return TextFormField(
      controller: controller,
      style: theme.textTheme.titleMedium,
      keyboardType: keyboardType(textFieldType!),
      obscureText: obscureText,
      onChanged: onChanged,
      maxLength: maxLength,
      validator: validator(textFieldType!),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.bodyMedium,
        suffixIcon: suffixIcon,
        contentPadding: (suffixIcon == null)
            ? const EdgeInsets.symmetric(horizontal: Const.margin)
            : const EdgeInsets.only(
                left: Const.margin,
                top: 12.0,
              ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
          borderSide: BorderSide(color: theme.hintColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
          borderSide: BorderSide(color: theme.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Const.textFieldRadius),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
      ),
    );
  }
}
