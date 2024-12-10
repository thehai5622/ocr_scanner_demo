part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const dashboard = _Paths.dashboard;
  static const home = _Paths.home;
  static const pickImage = _Paths.pickImage;
  static const individual = _Paths.individual;
  static const requestSupport = _Paths.requestSupport;
}

abstract class _Paths {
  _Paths._();
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String pickImage = '/pick-image';
  static const String individual = '/individual';
  static const String requestSupport = '/request-support';
}