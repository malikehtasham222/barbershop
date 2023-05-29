part of '../profile_edit_page.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController _emailController;
  late TextEditingController _fullNameController;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _fullNameController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<UtilProvider>(builder: (context, state, snapshot) {
      return Scaffold(
        appBar: CustomAppBar(
          context,
          title: AppLocalizations.of(context)!.edit_profile,
        ),
        body: ListView(
          children: [
            _BuildCircleAvatar(
              file: state.file,
              image: Assets.profilePhoto,
              onChangeImageTap: () => Get.to(const CustomImageCropperScreen()),
            ),
            const SizedBox(height: Const.space25),
            _BuildEmailTextField(controller: _emailController),
            const SizedBox(height: Const.space15),
            _BuildFullNameTextField(controller: _fullNameController),
            const SizedBox(height: Const.space15),
            const _BuildGenderRadio(),
            const SizedBox(height: Const.space25),
            CustomElevatedButton(
              onTap: () {
                setState(() => _isLoading = true);
                Future.delayed(const Duration(seconds: 2), () {
                  setState(() => _isLoading = false);
                  Get.back<dynamic>();
                  showToast(msg: AppLocalizations.of(context)!.profile_updated);
                });
              },
              margin: const EdgeInsets.symmetric(horizontal: Const.margin),
              isLoading: _isLoading,
              label: AppLocalizations.of(context)!.save,
              labelLoading: AppLocalizations.of(context)!.saving,
            ),
          ],
        ),
      );
    });
  }
}
