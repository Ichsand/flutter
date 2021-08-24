abstract class BookDAO {
  static const String TABLE_NAME  = 'Book';
  static const String CREATE_TABLE = 'CREATE TABLE ${TABLE_NAME} (id INTEGER PRIMARY KEY, title TEXT, publisher TEXT)';
}