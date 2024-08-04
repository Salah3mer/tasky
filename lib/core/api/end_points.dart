class EndPoints {
  static const String baseUrl = 'https://todo.iraqsapp.com/';
  static const String register = 'auth/register';
  static const String login = 'auth/login';
  static const String refeshToken = 'auth/refresh-token?token=';
  static const String logOut = 'auth/logout';
  static const String uploadImage = 'upload/image';
  static const String addTask = 'todos';
  static const String todos = 'todos/';
  static const String tasks = 'todos?page=';
  static String imageUrl(String name) =>
      'https://todo.iraqsapp.com/images/$name';
}
