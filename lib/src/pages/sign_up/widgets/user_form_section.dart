part of '../sign_up_page.dart';

class _UserFormSection extends StatelessWidget {
  final File? file;
  final String title;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final VoidCallback? onSelectImageTap;

  const _UserFormSection({
    required this.title,
    required this.firstNameController,
    required this.lastNameController,
    required this.onSelectImageTap,
    required this.file,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<ThemeProvider>(builder: (context, state, snapshot) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Const.margin),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: Screens.width(context) / 3,
              ),
              child: Text(title, style: theme.textTheme.headlineLarge),
            ),
            const SizedBox(height: Const.space25),
            BuildCircleAvatar(
              file: file,
              image: Assets.profilePhoto,
              onChangeImageTap: () => Get.to(const CustomImageCropperScreen()),
            ),
            const SizedBox(height: Const.space25),
            _BuildTextField(
              textController: firstNameController!,
              textFieldType: TextFieldType.Text,
              hintText: AppLocalizations.of(context)!.first_name,
            ),
            const SizedBox(height: Const.space12),
            _BuildTextField(
              textController: lastNameController!,
              textFieldType: TextFieldType.Text,
              hintText: AppLocalizations.of(context)!.last_name,
            ),
            const SizedBox(height: Const.space12),
            const _BuildGenderRadio(),
          ],
        ),
      );
    });
  }
}
