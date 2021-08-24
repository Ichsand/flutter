import 'package:flutter/material.dart';
import 'package:providder/modelapi/book.dart';
import 'package:providder/view_model1/view_model.dart';
import 'package:provider/provider.dart';

class BookFormScreen extends StatefulWidget {
  const BookFormScreen({ Key? key }) : super(key: key);

  @override
  _BookFormScreenState createState() => _BookFormScreenState();
}

class _BookFormScreenState extends State<BookFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BERAPI API"),),
      body: Container(
        child: ChangeNotifierProvider(
          create: (context)=> ViewModel(),
          builder: (context,child){
            return Column(
              children:[ ElevatedButton(onPressed: (){
                    context.read<ViewModel>().addBook(Book(
                      title: 'this id title',
                      desc: 'desc',
                      year: 0,
                      pages: 0,
                      language: 'language',
                      publisher: 'publisher',
                      price: 0,
                      stock: 0,
                      ));
                  }, child: Text('Add')),
              ]
            );
          },)
      ),
    );
  }
}