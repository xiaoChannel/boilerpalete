part of 'app_pages.dart';

class Routes {
  static const main = '/main';
  static const discover = '/discover';
  static const vehicle = '/vehicle';
  static const profile = '/profile';
  static const register = '/register';
  static const login = '/login';
  static const uiWidget = '/uiWidget';
  static const uiSnackbar = '/uiSnackbar';
  static const socialShare = '/social-share';
  static const isarCourse = '/isar-course';

  static bool matches(String str) {
    final path = str.startsWith('/') ? str : ('/$str');

    return path == main ||
        path == discover ||
        path == vehicle ||
        path == profile ||
        path == register ||
        path == login ||
        path == uiWidget ||
        path == uiSnackbar ||
        path == socialShare ||
        path == isarCourse;
  }
}
