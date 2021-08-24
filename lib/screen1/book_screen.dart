import 'package:flutter/material.dart';
import 'package:providder/modelapi/book.dart';
import 'package:providder/repository1/book_repository.dart';
import 'package:providder/view_model1/view_model.dart';
import 'package:provider/provider.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  _BookScreenState createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
BookRepository _bookRepo = BookRepository();
TextEditingController bookTitle = new TextEditingController();
TextEditingController bookPublisher = new TextEditingController();
TextEditingController bookId = new TextEditingController();
final GlobalKey<FormState> _fK = GlobalKey<FormState>();
Book? book;
getBook(String id) async{
  final gotBook = await _bookRepo.getBookById(id);
  setState((){
    book = gotBook;
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('DB Form'),),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _fK,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder() , labelText: 'Title'),
                       controller: bookTitle,      
                       validator: (String? value){
                         if(value == null || value.isEmpty){
                           return 'Title of book must be required';
                         }
                         return null;
                       },
                      ),
                      TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder() , labelText: 'Publisher'),
                       controller: bookPublisher,      
                       validator: (String? value){
                         if(value == null || value.isEmpty){
                           return 'Publisher must be identified';
                         }
                         return null;
                       },
                      ),
                      ElevatedButton(onPressed: (){
                        if(_fK.currentState!.validate()){
                            setState(() {
                            // _bookRepo.addBook(new Book(title: bookTitle.text, publisher: bookPublisher.text));
                            });
                          }
                        }, child: const Text('submit')),
                    ],
                  )),),
                  TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder() , labelText: 'Enter your id Book'),
                       controller: bookId,      
                       validator: (String? value){
                         if(value == null || value.isEmpty){
                           return "Where's your ID??";
                         }
                         return null;
                       },
                      ),
                  ChangeNotifierProvider(
                    create: (context) => ViewModel(),
                    builder: (context,child){
                      return Column(
                        children: [
                  Text( 
                    context.watch<ViewModel>().book?.title??''
                    ),
                  Text(
                     context.watch<ViewModel>().book?.publisher??''
                     ),
                  ElevatedButton(onPressed: (){
                    context.read<ViewModel>().getBookById(bookId.text);
                  }, child: Text('Find book title!'),)
                        ]
                      );
                    }
                  )
            ],
          ),
        )
      )
    );
  }
}