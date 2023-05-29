part of '../booking_success_page.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Const.margin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: theme.primaryColor,
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 70,
              ),
            ),
            const SizedBox(height: Const.space25),
            Text(
              AppLocalizations.of(context)!
                  .your_appointment_booking_is_successfully,
              style: theme.textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space12),
            Text(
              AppLocalizations.of(context)!
                  .you_can_view_the_appointment_booking_info_in_the_appointment_section,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: Const.space25),
            CustomElevatedButton(
              onTap: () => Get.offAllNamed<dynamic>(Routes.home),
              label: AppLocalizations.of(context)!.back_to_dashboard,
            )
          ],
        ),
      ),
    );
  }
}
