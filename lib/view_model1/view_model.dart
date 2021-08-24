import 'package:flutter/cupertino.dart';
import 'package:providder/modelapi/book.dart';
import 'package:providder/repository1/book_repository.dart';

class ViewModel with ChangeNotifier{
  Book? _book;
  Book? get book{
    return _book;
  }

  BookRepository _bookRepo = BookRepository();
  
  getBookById(String id)async{
    final newBook = await _bookRepo.getBookById(id);
    _book = newBook;
    notifyListeners();
  }

  addBook(Book bluBook)async{
    final registerBook = await _bookRepo.addBook(bluBook);
    print(registerBook);
    notifyListeners();
  }

  getListBook(List<Book> books)async{
    final allBook = await _bookRepo.getProduct();
    print(allBook);
    notifyListeners();
  }  
}