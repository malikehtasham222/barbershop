part of '../sign_up_page.dart';

/*class _UserFormSection extends StatelessWidget {
  final File? file;
  final String title;
  final String? selectedDate;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? phoneNumberController;
  final VoidCallback? onSelectImageTap;
  final VoidCallback? onDatePickerTap;

  const _UserFormSection({
    required this.title,
    this.firstNameController,
    this.lastNameController,
    this.phoneNumberController,
    this.onSelectImageTap,
    this.file, this.onDatePickerTap, this.selectedDate,
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
              child: Text(title, style: theme.textTheme.headline1),
            ),
            SizedBox(height: Const.space25),
            GestureDetector(
              onTap: onSelectImageTap,
              child: CircleAvatar(
                  radius: Screens.width(context) / 5,
                  backgroundColor: theme.disabledColor,
                  backgroundImage: (file == null) ? null : FileImage(file!),
                  child: (file == null)
                      ? Icon(
                          FeatherIcons.camera,
                          color: Colors.white,
                          size: Screens.width(context) / 7,
                        )
                      : null),
            ),
            SizedBox(height: Const.space25),
            CustomTextFormField(
              controller: firstNameController,
              borderType: BorderType.Outline,
              textFieldType: TextFieldType.Text,
              hintText: AppLocalizations.of(context)!.first_name,
            ),
            SizedBox(height: Const.space15),
            CustomTextFormField(
              controller: lastNameController,
              borderType: BorderType.Outline,
              textFieldType: TextFieldType.Text,
              hintText: AppLocalizations.of(context)!.last_name,
            ),
            SizedBox(height: Const.space15),
            CustomTextFormField(
              controller: phoneNumberController,
              borderType: BorderType.Outline,
              textFieldType: TextFieldType.PhoneNumber,
              hintText: AppLocalizations.of(context)!.phone_number,
            ),
            SizedBox(height: Const.space15),
            GestureDetector(
              onTap:onDatePickerTap,
              child: Container(
                width: Screens.width(context),
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: theme.disabledColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: Const.margin),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate ?? AppLocalizations.of(context)!.select_date,
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: (selectedDate == null)
                            ? null
                            : (state.isLightTheme)
                                ? ColorLight.fontTitle
                                : ColorDark.fontTitle,
                      ),
                    ),
                    Icon(
                      FeatherIcons.calendar,
                      color: theme.disabledColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}*/
