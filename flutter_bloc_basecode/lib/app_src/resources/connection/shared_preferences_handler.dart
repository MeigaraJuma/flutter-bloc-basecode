import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHandler {
  final String _accessToken = 'accessToken';
  final String _refreshToken = 'refreshToken';
  final String _tokenType = 'tokenType';
  final String _loginId = 'loginId';
  final String _expiresIn = 'expiresIn';
  final String _expireTime = 'expireTime';
  final String _userId = 'userId';
  final String _password = 'password';
  final String _otpCode = 'otpCode';
  final String _notification = 'notification';
  final String _isFirstTimeUse = 'firstTimeUse';
  final String _versionNumber = 'versionNumber';
  final String _versionCode = 'versionCode';

  Future<bool> cleanSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  Future<bool> setLoginId(String loginId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_loginId, loginId);
  }

  Future<String> getLoginId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_loginId);
  }

  Future<bool> setAccessToken(String accessToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_accessToken, accessToken);
  }

  Future<String> getAccessToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessToken);
  }

  Future<bool> setRefreshToken(String refreshToken) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_refreshToken, refreshToken);
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshToken);
  }

  Future<bool> setTokenType(String tokenType) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_tokenType, tokenType);
  }

  Future<String> getTokenType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenType);
  }

  Future<bool> setExpireIn(int expireIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_expiresIn, expireIn);
  }

  Future<int> getExpireIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_expiresIn);
  }

  Future<bool> setExpireTime(int expireTime) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_expireTime, expireTime);
  }

  Future<int> getExpireTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_expireTime);
  }

  Future<bool> setUserId(int userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(_userId, userId);
  }

  Future<int> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userId);
  }

  Future<bool> setPassword(String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_password, password);
  }

  Future<String> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password);
  }

  Future<bool> setOtpCode(String otpCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_otpCode, otpCode);
  }

  Future<String> getOtpCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_otpCode);
  }

  Future<bool> setVersionNumber(String versionNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_versionNumber, versionNumber);
  }

  Future<String> getVersionNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_versionNumber);
  }

  Future<bool> setVersionCode(String versionCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_versionCode, versionCode);
  }

  Future<String> getVersionCode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_versionCode);
  }

  Future<bool> setNotification(bool notif) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_notification, notif);
  }

  Future<bool> getNotification() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_notification);
  }

  Future<bool> setFirstTimeUse(bool isFirsTimeUse) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isFirstTimeUse, isFirsTimeUse);
  }

  Future<bool> getFirstTimeUse() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstTimeUse);
  }
}
