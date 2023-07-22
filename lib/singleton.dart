/*Chinnadurai Viswanathan*/
import 'package:altogic/altogic.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Singleton {
  //1 = real device, 2= Testing device
  int deviceType = 1;
  static String mobileUserId = 'b8464be6-5217-44f6-82be-addf2e25b281';

  static final Singleton _singleton = Singleton._internal();

  static late final Supabase supabaseInstance;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static Singleton get instance => _singleton;
}
