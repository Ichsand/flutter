class Book {
  int? id;
  String title;
  String publisher;
  Book({this.id,required this.title,required this.publisher,});

  Book.fromMap(Map<String, dynamic> map) : 
  id = map['id'],
  title = map['title'],
  publisher = map['publisher'];
}
