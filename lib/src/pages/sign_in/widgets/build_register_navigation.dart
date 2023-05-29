part of '../sign_in_page.dart';

class _BuildRegisterNavigation extends StatelessWidget {
  const _BuildRegisterNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.dont_have_an_account,
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(width: Const.space5),
        InkWell(
          onTap: ()=>Get.toNamed<dynamic>(Routes.signUp),
          child: Text(
            AppLocalizations.of(context)!.sign_up,
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.primaryColor),
          ),
        ),
      ],
    );
  }
}
