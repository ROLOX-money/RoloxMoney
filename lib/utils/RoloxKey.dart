import 'dart:io';

class RoloxKey{
  static late String? baseUrl;
  static late String? token;
  static late String? deviceId;
  static String errorMessage = 'Something Went wrong...Please try again';
  static late Map<String, dynamic>? header;
  static late Map<String, dynamic>? acceptHeader = { HttpHeaders.acceptHeader: 'application/json' };
}