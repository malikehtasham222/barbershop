part of '../chat_page.dart';

class _BuildTextTextField extends StatelessWidget {
  const _BuildTextTextField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      textFieldType: TextFieldType.Text,
      hintText: AppLocalizations.of(context)!.type_a_message,
    );
  }
}
