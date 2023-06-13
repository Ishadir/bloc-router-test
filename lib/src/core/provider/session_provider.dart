


import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {

  final SharedPreferences _prefs;

  late bool _isSignedIn;

  SessionProvider(this._prefs){
    _isSignedIn = _prefs.getBool('session') ?? false;
  }

  bool get isSignedIn => _isSignedIn;


  void setSignedIn (bool value ) {
    _isSignedIn = value;

    _prefs.setBool('session', value);
  }


}