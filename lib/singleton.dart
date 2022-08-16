/*Chinnadurai Viswanathan*/
class Singleton {
  //1 = real device, 2= Testing device
  int deviceType = 1;

  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  static Singleton get instance => _singleton;
}
