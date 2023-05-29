part of '../profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.profile,
        enableLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.toNamed<dynamic>(Routes.setting),
            icon: const Icon(FeatherIcons.settings),
            color: (themeMode.isDarkTheme == true)
                ? ColorDark.fontTitle
                : ColorLight.fontTitle,
          )
        ],
      ),
      body: ListView(
        children: [
          const _BuildHeader(),
          const SizedBox(height: Const.space25),
          _BuildListTile(
            icon: FeatherIcons.shoppingCart,
            title: AppLocalizations.of(context)!.booking_order_and_Appointments,
            onTap: () => Get.toNamed<dynamic>(
              Routes.appointment,
              arguments: true,
            ),
          ),
          _BuildListTile(
            icon: FeatherIcons.heart,
            title: AppLocalizations.of(context)!.favourite_barbers_salon,
            onTap: () => Get.toNamed<dynamic>(Routes.favorite),
          ),
          _BuildListTile(
            icon: FeatherIcons.creditCard,
            title: AppLocalizations.of(context)!.payment_method,
            onTap: () => Get.toNamed<dynamic>(Routes.paymentMethod),
          ),
          _BuildListTile(
            icon: FeatherIcons.key,
            title: AppLocalizations.of(context)!.change_password,
            onTap: () => Get.toNamed<dynamic>(Routes.changePassword),
          ),
          _BuildListTile(
            icon: FeatherIcons.helpCircle,
            title: AppLocalizations.of(context)!.support,
            onTap: () => Get.toNamed<dynamic>(Routes.support),
          ),
          _BuildListTile(
            icon: FeatherIcons.star,
            title: AppLocalizations.of(context)!.rate_the_app,
            onTap: () {
              LaunchReview.launch(
                androidAppId: 'com.byneetdev.barbershop',
              );
            },
          ),
          _BuildListTile(
            icon: FeatherIcons.globe,
            title: AppLocalizations.of(context)!.language,
            onTap: () => Get.toNamed<dynamic>(Routes.language),
          ),
          _BuildListTile(
            icon: FeatherIcons.info,
            title: AppLocalizations.of(context)!.about_us,
            onTap: () => Get.toNamed<dynamic>(Routes.about),
          ),
          _BuildListTile(
            icon: FeatherIcons.logOut,
            title: AppLocalizations.of(context)!.log_out,
            onTap: () {
              logoutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
