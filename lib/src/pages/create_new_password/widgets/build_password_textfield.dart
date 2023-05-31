part of '../create_new_password_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    Key? key,
    required this.passwordController,
    required this.obscureText,
    required this.onObscureTextTap,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback onObscureTextTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomTextFormField(
      controller: passwordController,
      obscureText: obscureText,
      textFieldType: TextFieldType.Password,
      hintText: hintText,
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
