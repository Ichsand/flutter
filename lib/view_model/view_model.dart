import 'package:flutter/cupertino.dart';
import 'package:providder/model/book.dart';
import 'package:providder/repository/book_repository.dart';

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
}