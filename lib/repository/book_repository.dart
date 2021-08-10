import 'package:providder/dao/book_dao.dart';
import 'package:providder/db/db_helper.dart';
import 'package:providder/model/book.dart';

class BookRepository{
  final DBHelper _dbHelp = DBHelper.INSTANCE;

  addBook(Book book)async{
    _dbHelp.insert(BookDAO.TABLE_NAME, {
      'title': book.title,
      'publisher': book.publisher
    });
  }

  Future<Book?> getBookById(String title)async{
    final List<dynamic> result = await _dbHelp
    .select(BookDAO.TABLE_NAME, 'id = ?', [title]);
    if(result != null){
      return Book.fromMap(result.first);
    }else{
      return null;
    }
  }
}