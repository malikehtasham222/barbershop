import 'package:barbershop_new/src/helpers/constants.dart';
import 'package:barbershop_new/src/models/on_boarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<OnBoardingModel> onBoardingMockList(BuildContext context) => [
  OnBoardingModel(
    image: Assets.onBoarding1,
    title: AppLocalizations.of(context)!.on_boarding_title_1,
    subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_1,
  ),
  OnBoardingModel(
    image: Assets.onBoarding2,
    title: AppLocalizations.of(context)!.on_boarding_title_2,
    subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_2,
  ),
  OnBoardingModel(
    image: Assets.onBoarding3,
    title: AppLocalizations.of(context)!.on_boarding_title_1,
    subtitle: AppLocalizations.of(context)!.on_boarding_subtitle_1,
  ),

];
