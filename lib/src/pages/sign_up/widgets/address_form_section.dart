part of '../sign_up_page.dart';

class _AddressFormSection extends StatelessWidget {
  final String title;
  final TextEditingController? locationController;
  final TextEditingController? countryController;

  const _AddressFormSection({
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
            _BuildTextField(
              textController: locationController!,
              hintText: AppLocalizations.of(context)!.location,
              textFieldType: TextFieldType.Text,
            ),
            const SizedBox(height: Const.space15),
            _BuildTextField(
              textController: countryController!,
              hintText: AppLocalizations.of(context)!.select_country,
              textFieldType: TextFieldType.Text,
            ),
            const SizedBox(height: Const.space15),
          ],
        ),
      );
    });
  }
}
