class HTTPUrl {
  static String loginURL({required String? mobileNumber}) =>
      '/login/$mobileNumber';
}
