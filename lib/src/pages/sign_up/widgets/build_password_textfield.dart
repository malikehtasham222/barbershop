part of '../sign_up_page.dart';

class _BuildPasswordTextField extends StatelessWidget {
  const _BuildPasswordTextField({
    Key? key,
    required this.obscureText,
    required this.passwordController,
    required this.onObscureTextTap,
    required this.hintText,
  }) : super(key: key);

  final bool obscureText;
  final TextEditingController passwordController;
  final VoidCallback onObscureTextTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CustomTextFormField(
      obscureText: obscureText,
      controller: passwordController,
      textFieldType: TextFieldType.Password,
      hintText: hintText,
      suffixIcon: IconButton(
        onPressed: onObscureTextTap,
        color: theme.primaryColor,
        icon: Icon(
          (obscureText == true) ? FeatherIcons.eye : FeatherIcons.eyeOff,
        ),
      ),
    );
  }
}
