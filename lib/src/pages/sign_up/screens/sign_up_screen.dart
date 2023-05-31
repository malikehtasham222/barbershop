/*
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
          _BuildTextField(
            textController: _fullNameController,
            hintText: AppLocalizations.of(context)!.first_name,
            textInputType: TextInputType.text,
          ),
          const SizedBox(height: Const.space12),
          _BuildTextField(
            textController: _emailController,
            hintText: AppLocalizations.of(context)!.email_address,
            textInputType: TextInputType.emailAddress,
          ),
          const SizedBox(height: Const.space12),
          const _BuildGenderRadio(),
          const SizedBox(height: Const.space12),
          _BuildPasswordTextField(
            hintText: AppLocalizations.of(context)!.password,
            obscureText: _obscureText,
            passwordController: _passwordController,
            onObscureTextTap: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
          const SizedBox(height: Const.space12),
          _BuildPasswordTextField(
            hintText: AppLocalizations.of(context)!.password_confirmation,
            obscureText: _obscureText,
            passwordController: _passwordConfirmationController,
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
*/

part of '../sign_up_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? _obscureText = true;
  bool? _isLoading = false;
  late PageController _controller;
  late TextEditingController _emailController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _locationController;
  late TextEditingController _countryController;
  final _formKey = GlobalKey<FormState>();
  int? _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _emailController = TextEditingController(text: '');
    _firstNameController = TextEditingController(text: '');
    _lastNameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _confirmPasswordController = TextEditingController(text: '');
    _locationController = TextEditingController(text: '');
    _countryController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _countryController.dispose();
    _locationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UtilProvider>(builder: (context, state, snapshot) {
      return WillPopScope(
        onWillPop: () => _willPopScope(context),
        child: Scaffold(
          appBar: CustomAppBar(context, leadingOntap: () {
            switch (_currentIndex) {
              case 0:
                Dialogs.labelDialog(
                  context,
                  title: AppLocalizations.of(context)!
                      .are_you_sure_you_want_to_cancel_registration,
                  primaryButtonLabel: AppLocalizations.of(context)!.yes,
                  onPrimaryButtonTap: () {
                    Get.back();
                    Get.back();
                  },
                );
                break;
              default:
                _controller.previousPage(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInCirc,
                );
            }
          }),
          resizeToAvoidBottomInset: true,
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Expanded(
                  child: PageView(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (v) {
                      setState(() => _currentIndex = v);
                    },
                    children: [
                      _RegisterFormSection(
                        title: AppLocalizations.of(context)!.create_an_account,
                        subtitle:
                            AppLocalizations.of(context)!.sign_up_to_continue,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        confirmPasswordController: _confirmPasswordController,
                        obscureText: _obscureText,
                        onObscureTextTap: () {
                          setState(() {
                            _obscureText = !_obscureText!;
                          });
                        },
                      ),
                      _UserFormSection(
                        file: state.file,
                        title: AppLocalizations.of(context)!
                            .we_just_need_some_information_about_you,
                        firstNameController: _firstNameController,
                        lastNameController: _lastNameController,
                        onSelectImageTap: () =>
                            Get.to(const CustomImageCropperScreen()),
                      ),
                      _AddressFormSection(
                        title: AppLocalizations.of(context)!.where_are_you_from,
                        locationController: _locationController,
                        countryController: _countryController,
                      ),
                    ],
                  ),
                ),
                _BuildButton(
                  isLoading: _isLoading,
                  currentIndex: _currentIndex,
                  onSignUp: () {
                    switch (_currentIndex) {
                      case 0:
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        }
                        break;
                      case 1:
                        if (!_formKey.currentState!.validate()) {
                        } else if (state.file == null) {
                          showToast(
                              msg: AppLocalizations.of(context)!
                                  .please_select_your_profile_photo);
                        } else {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.linear,
                          );
                        }
                        break;
                      case 2:
                        if (_formKey.currentState!.validate()) {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            _isLoading = true;
                          });
                          Future.delayed(const Duration(seconds: 2),
                              () => Get.offAllNamed(Routes.home));
                        }
                        break;
                      default:
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _willPopScope(BuildContext context) {
    switch (_currentIndex) {
      case 0:
        Dialogs.labelDialog(
          context,
          title: AppLocalizations.of(context)!
              .are_you_sure_you_want_to_cancel_registration,
          primaryButtonLabel: AppLocalizations.of(context)!.yes,
          onPrimaryButtonTap: () {
            Get.back();
            Get.back();
          },
        );
        break;
      default:
        _controller.previousPage(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInCirc,
        );
    }
    Future.value(false);
  }
}

class _BuildButton extends StatelessWidget {
  final VoidCallback? onSignUp;
  final bool? isLoading;
  final int? currentIndex;

  const _BuildButton(
      {Key? key, this.onSignUp, this.isLoading, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? const Padding(
            padding: EdgeInsets.all(Const.margin),
            child: Center(child: CircularProgressIndicator()),
          )
        : Padding(
            padding: const EdgeInsets.all(Const.margin),
            child: CustomElevatedButton(
              label: currentIndex == 0
                  ? AppLocalizations.of(context)!.sign_up
                  : currentIndex == 2
                      ? AppLocalizations.of(context)!.finish
                      : AppLocalizations.of(context)!.next,
              onTap: onSignUp!,
            ),
          );
  }
}
