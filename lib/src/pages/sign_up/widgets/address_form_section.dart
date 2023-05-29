part of '../sign_up_page.dart';

class _addressFormSection extends StatelessWidget {
  final String title;
  final TextEditingController? locationController;
  final TextEditingController? countryController;

  const _addressFormSection({
    required this.title,
    required this.locationController,
    required this.countryController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer2<UtilProvider, ThemeProvider>(
        builder: (context, state, themeState, snapshot) {
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
            CustomTextFormField(
              controller: locationController!,
              hintText: AppLocalizations.of(context)!.location,
            ),
            const SizedBox(height: Const.space15),
            _BuildCountryNameTextField(countryController: countryController!),
            const SizedBox(height: Const.space15),
          ],
        ),
      );
    });
  }
}
