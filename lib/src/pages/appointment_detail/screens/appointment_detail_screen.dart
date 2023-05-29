part of '../appointment_detail_page.dart';

class AppointmentDetailScreen extends StatefulWidget {
  const AppointmentDetailScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentDetailScreen> createState() =>
      _AppointmentDetailScreenState();
}

class _AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
  late AppointmentModel _appointment;
  late TextEditingController _reviewController;

  @override
  void initState() {
    super.initState();
    _appointment = Get.arguments as AppointmentModel;
    _reviewController = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: AppLocalizations.of(context)!.appointment_details,
      ),
      body: ListView(
        children: [
          _BuildBookingDetail(appointment: _appointment),
          _BuildTotalPrice(appointment: _appointment),
          _BuildServiceDetail(appointment: _appointment),
          _appointment.status == AppointmentStatus.complete
              ? _BuildReviewSection(appointment: _appointment, reviewController: _reviewController,)
              : _appointment.status == AppointmentStatus.cancel
              ? Container()
              : Container(),
        ],
      ),
    );
  }
}
