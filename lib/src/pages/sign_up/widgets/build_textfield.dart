part of '../sign_up_page.dart';

class _BuildTextField extends StatelessWidget {
  const _BuildTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.textFieldType,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final TextFieldType textFieldType;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: textController,
      hintText: hintText,
      textFieldType: textFieldType,
    );
  }
}
