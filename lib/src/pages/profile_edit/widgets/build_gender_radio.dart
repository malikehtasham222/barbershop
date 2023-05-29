part of '../profile_edit_page.dart';


class _BuildGenderRadio extends StatefulWidget {
  const _BuildGenderRadio({
    Key? key,
  }) : super(key: key);

  @override
  __BuildGenderRadioState createState() => __BuildGenderRadioState();
}

class __BuildGenderRadioState extends State<_BuildGenderRadio> {
  int _selectedGender = 0;
   List<String> _genderList(BuildContext context) => [
    AppLocalizations.of(context)!.male,
    AppLocalizations.of(context)!.female,
    AppLocalizations.of(context)!.other,
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Const.margin),
          child: Text(
            AppLocalizations.of(context)!.gender,
            style: theme.textTheme.titleLarge,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _genderList(context).asMap()
              .entries
              .map((e) => Row(
                    children: [
                      Radio(
                          value: e.key,
                          groupValue: _selectedGender,
                          focusColor: theme.primaryColor,
                          activeColor: theme.primaryColor,
                          hoverColor: theme.disabledColor,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedGender = value??0;
                            });
                          }),
                      Text(e.value, style: theme.textTheme.titleLarge),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
