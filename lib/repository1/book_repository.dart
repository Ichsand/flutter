import 'package:providder/api/api_helper.dart';
import 'package:providder/dao1/book_dao.dart';
import 'package:providder/db1/db_helper.dart';
import 'package:providder/modelapi/book.dart';
import 'package:providder/modelapi/response.dart';

class BookRepository{
  final DBHelper _dbHelp = DBHelper.INSTANCE;
  final ApiHelper _apiHelp = ApiHelper.INSTANCE;

  addBook(Book book)async{
    final response = await _apiHelp.postData('book', book.toMap());
    return Book.fromMap(response);
  }

  Future<Book?> getBookById(String id)async{
    final List<dynamic> result = await _dbHelp
    .select(BookDAO.TABLE_NAME, 'id = ?', [id]);
    if(result != null){
      return Book.fromMap(result.first);
    }else{
      return null;
    }
  }

  Future<List<Book>> getProduct()async{
    final response = await _apiHelp.getData('/books');
    print(ResponseAPI.fromJson(response).data);
    return ResponseAPI.fromJson(response).data;
  }
}