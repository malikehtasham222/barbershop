import 'dart:io';

import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/helpers/screens.dart';
import 'package:barbershop_new/src/helpers/toast.dart';
import 'package:barbershop_new/src/widgets/custom_app_bar.dart';
import 'package:barbershop_new/src/widgets/custom_elevated_button.dart';
import 'package:barbershop_new/src/widgets/custom_text_form_field.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../providers/util_provider.dart';
import '../../widgets/custom_image_cropper.dart';

part 'screens/profile_edit_screen.dart';
part 'widgets/build_email_textfield.dart';
part 'widgets/build_circle_avatar.dart';
part 'widgets/upload_bottomsheet.dart';
part 'widgets/build_full_name_textfield.dart';
part 'widgets/build_birthday_datepicker.dart';
part 'widgets/build_gender_radio.dart';
