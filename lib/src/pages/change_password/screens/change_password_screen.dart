part of '../change_password_page.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  late TextEditingController _currentPasswordController;
  late TextEditingController _newPasswordController;
  late TextEditingController _passwordConfirmationController;
  bool _isLoading = false;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _currentPasswordController = TextEditingController(text: '');
    _newPasswordController = TextEditingController(text: '');
    _passwordConfirmationController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CustomAppBar(context),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        children: [
          const SizedBox(height: Const.space25),
          Text(
            AppLocalizations.of(context)!.change_password,
            style: theme.textTheme.headlineLarge,
          ),
          const SizedBox(height: Const.space12),
          Text(
            AppLocalizations.of(context)!
                .your_new_password_must_be_different_from_previous_used_passwords,
            style: theme.textTheme.bodyLarge,
          ),
          const SizedBox(height: Const.space25),
          _BuildPasswordTextField(
            controller: _currentPasswordController,
            hintText: AppLocalizations.of(context)!.current_password,
            obscureText: _obscureText,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space15),
          _BuildPasswordTextField(
            controller: _newPasswordController,
            hintText: AppLocalizations.of(context)!.new_password,
            obscureText: _obscureText,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space15),
          _BuildPasswordTextField(
            controller: _passwordConfirmationController,
            hintText: AppLocalizations.of(context)!.password_confirmation,
            obscureText: _obscureText,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space15),
          CustomElevatedButton(
            isLoading: _isLoading,
            onTap: () {
              setState(() => _isLoading = true);
              Future.delayed(const Duration(seconds: 2), () {
                setState(() => _isLoading = false);
                showToast(msg: AppLocalizations.of(context)!.password_changed);
                Get.back<dynamic>();
              });
            },
            label: AppLocalizations.of(context)!.done,
            labelLoading: AppLocalizations.of(context)!.changing,
          )
        ],
      ),
    );
  }
}
