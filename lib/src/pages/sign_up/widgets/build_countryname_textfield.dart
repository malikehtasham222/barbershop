part of '../sign_up_page.dart';

class _BuildCountryNameTextField extends StatelessWidget {
  const _BuildCountryNameTextField({
    Key? key,
    required this.countryController,
  }) : super(key: key);

  final TextEditingController countryController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: countryController,
      hintText: AppLocalizations.of(context)!.select_country,
    );
  }
}
