part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
}

abstract class _Paths {
  _Paths._();
  static const String home = '/home';
}