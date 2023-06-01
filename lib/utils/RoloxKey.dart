import 'dart:io';

class RoloxKey {
  static late String? baseUrl;
  static late String? token;
  static late String? deviceId;
  static String errorMessage = 'Something Went wrong...Please try again';
  static late Map<String, dynamic>? header;
  static late Map<String, dynamic>? acceptHeader = {
    HttpHeaders.acceptHeader: 'application/json'
  };

  static const supaBaseClientEnvUrl =
      'https://kqbaykvspaafegwhakvg.supabase.co';
  static const supaBaseClientClientKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtxYmF5a3ZzcGFhZmVnd2hha3ZnIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODUyNTkwMzEsImV4cCI6MjAwMDgzNTAzMX0.tbWMQlMM-fNPYTCY0i2htBTgMnVTZgUoiNQ22QJ87YI';

  static late String supaBaseUserTable = 'users';
  static late String supaBaseGSTTable = 'gstTable';
  static late String supaBasePANTable = 'panTable';
  static late String supaBaseCompanyTable = 'companyDB';
  static late String supaBaseClientTable = 'companyDB';
  static late String supaBaseProfileCompanyTable = 'ProfileCompany'; //client
  static late String supaBaseUserToClientMap = 'userToClientMap';
  static late String supaBaseAddresstable = 'addresstable';
}
