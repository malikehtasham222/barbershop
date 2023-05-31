part of '../sign_up_page.dart';

class _RegisterFormSection extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool? obscureText;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback? onObscureTextTap;

  const _RegisterFormSection({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscureText,
    required this.onObscureTextTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: ListView(
        children: [
          Center(child: Text(title, style: theme.textTheme.headlineSmall)),
          Center(child: Text(subtitle, style: theme.textTheme.bodyMedium)),
          const SizedBox(height: 35),
          _BuildTextField(
            textController: emailController!,
            hintText: AppLocalizations.of(context)!.email_address,
            textFieldType: TextFieldType.Email,
          ),
          const SizedBox(height: Const.space12),
          _BuildPasswordTextField(
              obscureText: obscureText!,
              hintText: AppLocalizations.of(context)!.password,
              passwordController: passwordController!,
              onObscureTextTap: onObscureTextTap!),
          const SizedBox(height: Const.space12),
          _BuildPasswordTextField(
              obscureText: obscureText!,
              hintText: AppLocalizations.of(context)!.password_confirmation,
              passwordController: confirmPasswordController!,
              onObscureTextTap: onObscureTextTap!),
          const SizedBox(height: Const.space15),
          const _BuildTermsAndCondition(),
        ],
      ),
    );
  }
}
