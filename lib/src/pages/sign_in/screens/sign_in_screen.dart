part of '../sign_in_page.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Stack(
          children: [
            const _BuildBackgroundImage(),
            _BuildBody(
              children: [
                const _BuildHeader(),
                const SizedBox(height: Const.space25),
                _BuildEmailTextField(emailController: _emailController),
                const SizedBox(height: Const.space15),
                _BuildPasswordTextField(
                  passwordController: _passwordController,
                  obscureText: _obscureText,
                  onObscureTextTap: () {
                    setState(() => _obscureText = !_obscureText);
                  },
                ),
                const SizedBox(height: Const.space25),
                CustomElevatedButton(
                  onTap: () {
                    setState(() => _isLoading = true);
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        _isLoading = true;
                      });
                      Future.delayed(const Duration(seconds: 2),
                          () => Get.offAllNamed(Routes.home));
                    }
                  },
                  isLoading: _isLoading,
                  labelLoading: AppLocalizations.of(context)!.signing,
                  label: AppLocalizations.of(context)!.sign_in,
                ),
                const SizedBox(height: Const.space25),
                CustomTextButton(
                  onTap: () => Get.toNamed<dynamic>(Routes.forgotPassword),
                  label: AppLocalizations.of(context)!.forgot_password,
                ),
                const SizedBox(height: Const.space25),
                const _BuildRegisterNavigation()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
