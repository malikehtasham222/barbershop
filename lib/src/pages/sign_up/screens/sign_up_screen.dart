part of '../sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _passwordConfirmationController;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _passwordConfirmationController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const _BuildHeader(),
          const SizedBox(height: Const.space25),
          _BuildFullNameTextField(fullNameController: _fullNameController),
          const SizedBox(height: Const.space12),
          const _BuildGenderRadio(),
          const SizedBox(height: Const.space12),
          _BuildEmailTextField(emailController: _emailController),
          const SizedBox(height: Const.space12),
          _BuildPasswordTextField(
            obscureText: _obscureText,
            passwordController: _passwordController,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space12),
          _BuildPasswordConfirmationTextField(
            obscureText: _obscureText,
            passwordConfirmationController: _passwordConfirmationController,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space25),
          CustomElevatedButton(
            isLoading: _isLoading,
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                setState(() => _isLoading = false);
                Get.toNamed<dynamic>(Routes.phoneVerification);
              });
            },
            label: AppLocalizations.of(context)!.create_account,
            labelLoading: AppLocalizations.of(context)!.please_wait,
          ),
          const SizedBox(height: Const.space15),
          const _BuildTermsAndCondition(),
        ],
      ),
    );
  }
}
