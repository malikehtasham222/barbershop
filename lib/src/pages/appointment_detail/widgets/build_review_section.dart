part of '../appointment_detail_page.dart';

class _BuildReviewSection extends StatelessWidget {
   _BuildReviewSection({
    Key? key,
    required this.appointment,
    required this.reviewController,
  }) : super(key: key);

  final AppointmentModel appointment;
  final TextEditingController reviewController;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: Screens.width(context),
      margin: const EdgeInsets.all(Const.margin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.primaryColor),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Const.margin),
            child: CustomRating(
              onRating: (v) {},
              star: Star(
                emptyColor: theme.disabledColor,
                fillColor: theme.primaryColor,
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Const.margin),
            child: TextField(
              cursorColor: theme.primaryColor,
              keyboardType: TextInputType.text,
              style: theme.textTheme.bodySmall,
              maxLines: 5,
              maxLength: 1000,
              controller: reviewController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                    vertical: Const.space15, horizontal: Const.margin),
                hintText:
                AppLocalizations.of(context)!.write_your_review,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: theme.unselectedWidgetColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (reviewController.text == '') {
                showToast(msg: 'Cannot send empty review');
              } else {
                Get.back();
                showToast(msg: 'Thank you for your feedback!');
              }
            },
            child: Container(
              width: Screens.width(context),
              height: 50.0,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                border: Border.all(color: theme.primaryColor),
              ),
              child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.send,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: Colors.white),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
