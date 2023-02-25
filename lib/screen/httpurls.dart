class HttpUrl {
  static String login({String? mobilNumber}) => '/login/$mobilNumber';

  static String toCheckUserExistingOrNot({String? mobilNumber}) =>
      '/user/$mobilNumber';

  static String registration() => 'user/api/registration';
}
