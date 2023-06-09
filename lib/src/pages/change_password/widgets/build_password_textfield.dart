part of '../change_password_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.onObscureTextTap,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback onObscureTextTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomTextFormField(
      controller: controller,
      obscureText: obscureText,
      textFieldType: TextFieldType.Password,
      hintText: AppLocalizations.of(context)!.password_confirmation,
      suffixIcon: IconButton(
        color: theme.primaryColor,
        onPressed: onObscureTextTap,
        icon: Icon(
          (obscureText == true) ? FeatherIcons.eye : FeatherIcons.eyeOff,
        ),
      ),
    );
  }
}
