import 'dart:io';

import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/helpers/toast.dart';
import 'package:barbershop_new/src/widgets/custom_app_bar.dart';
import 'package:barbershop_new/src/widgets/custom_elevated_button.dart';
import 'package:barbershop_new/src/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../helpers/dialogs.dart';
import '../../helpers/screens.dart';
import '../../providers/theme_provider.dart';
import '../../providers/util_provider.dart';
import '../../widgets/custom_image_cropper.dart';
import '../profile_edit/profile_edit_page.dart';

part 'screens/sign_up_screen.dart';
part 'widgets/address_form_section.dart';
part 'widgets/build_gender_radio.dart';
part 'widgets/build_header.dart';
part 'widgets/build_password_textfield.dart';
part 'widgets/build_term_and_condition.dart';
part 'widgets/build_textfield.dart';
part 'widgets/register_form_section.dart';
part 'widgets/user_form_section.dart';
