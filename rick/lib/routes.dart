class Routes {
  static const host = 'https://rickandmortyapi.com/api';
  static String persons (int page) => '$host/character?page=$page';
  }