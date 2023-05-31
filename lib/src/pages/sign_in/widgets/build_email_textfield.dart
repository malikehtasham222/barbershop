part of '../sign_in_page.dart';

class _BuildEmailTextField extends StatelessWidget {
  const _BuildEmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      textFieldType: TextFieldType.Email,
      hintText: AppLocalizations.of(context)!.email_address,
    );
  }
}
