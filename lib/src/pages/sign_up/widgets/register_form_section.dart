part of '../sign_up_page.dart';

/*class _RegisterFormSection extends StatelessWidget {
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
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.obscureText,
    this.onObscureTextTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool? isAccepted=false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Const.margin),
      child: ListView(
        children: [
          Center(child: Text(title, style: theme.textTheme.headline3)),
          Center(child: Text(subtitle, style: theme.textTheme.subtitle2)),
          SizedBox(height: 35),
          CustomTextFormField(
            controller: emailController,
            borderType: BorderType.Outline,
            textFieldType: TextFieldType.Email,
            hintText: AppLocalizations.of(context)!.email_address,
          ),
          SizedBox(height: Const.space15),
          CustomTextFormField(
            controller: passwordController,
            obscureText: obscureText,
            borderType: BorderType.Outline,
            textFieldType: TextFieldType.Password,
            hintText: AppLocalizations.of(context)!.password,
            suffixIcon: IconButton(
              icon: Icon((obscureText == true)
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: onObscureTextTap,
            ),
          ),
          SizedBox(height: Const.space15),
          CustomTextFormField(
            controller: confirmPasswordController,
            obscureText: obscureText,
            borderType: BorderType.Outline,
            textFieldType: TextFieldType.Password,
            hintText: AppLocalizations.of(context)!.confirm_password,
            suffixIcon: IconButton(
              icon: Icon((obscureText == true)
                  ? Icons.visibility
                  : Icons.visibility_off),
              onPressed: onObscureTextTap,
            ),
          ),
          SizedBox(height: Const.space15),
          Row(
            children: [
              Checkbox(
                value: isAccepted,
                onChanged: (value) {
                  isAccepted=value;
                },
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                        AppLocalizations.of(context)!.by_continuing_sign_up_you_agree_to_the_following_our,
                        style: theme.textTheme.subtitle2,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.term,
                        style: theme.textTheme.headline5?.copyWith(
                          color: theme.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => showToast(msg:'Terms clicked!'),
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.and,
                        style: theme.textTheme.subtitle2,
                      ),
                      TextSpan(
                        text: AppLocalizations.of(context)!.conditions,
                        style: theme.textTheme.headline5?.copyWith(
                          color: theme.primaryColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => showToast(msg:'Condition clicked!'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}*/
