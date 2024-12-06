part of 'app_page.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const pickImage = _Paths.pickImage;
}

abstract class _Paths {
  _Paths._();
  static const String home = '/home';
  static const String pickImage = '/pick-image';
}