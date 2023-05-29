import 'package:barbershop_new/l10n/l10n.dart';
import 'package:flutter/material.dart';
 

class LocaleProvider with ChangeNotifier{
  Locale? _locale;
  Locale? get locale => _locale;
  set locale (Locale? val){
    _locale = val;
    notifyListeners();
  }

  void setLocale(Locale locale){
    if(!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale(){
    _locale=null;
    notifyListeners();
  }

}
