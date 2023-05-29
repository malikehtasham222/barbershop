

import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/helpers/screens.dart';
import 'package:barbershop_new/src/helpers/toast.dart';
import 'package:barbershop_new/src/mock_data/barber_mock.dart';
import 'package:barbershop_new/src/mock_data/barbershop_mock.dart';
import 'package:barbershop_new/src/models/barber_model.dart';
import 'package:barbershop_new/src/models/barbershop_model.dart';
import 'package:barbershop_new/src/pages/browse_barber/browse_barber_page.dart';
import 'package:barbershop_new/src/pages/browse_barbershop/browse_barbershop_page.dart';
import 'package:barbershop_new/src/widgets/custom_app_bar.dart';
import 'package:barbershop_new/src/widgets/custom_elevated_button.dart';
import 'package:barbershop_new/src/widgets/custom_text_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:octo_image/octo_image.dart';

part 'screens/nearby_screen.dart';
part 'widgets/build_header.dart';
part 'widgets/build_barber_card.dart';
part 'widgets/build_barbershop_card.dart';
part 'widgets/build_scrollable_barber.dart';
part 'widgets/build_scrollable_barbershop.dart';
part 'widgets/change_address_bottomsheet.dart';
