class Book {
  int? id;
  String title;
  String desc;
  int year;
  int pages;
  String language;
  String publisher;
  int price;
  int stock;

  Book({
    this.id,
    required this.title,
    required this.desc,
    required this.year,
    required this.pages,
    required this.language,
    required this.publisher,
    required this.price,
    required this.stock,
  });

  Book.fromMap(Map<String, dynamic> map) : 
  id = map['id'],
  title = map['title'],
  desc = map['desc'],
  year = map['year'],
  pages = map['pages'],
  language = map['language'],
  publisher = map['publisher'],
  price = map['price'],
  stock = map['stock'];

  Map<String, dynamic> toMap()=>{
      'id':id ?? '',
      'title':title,
      'desc':desc,
      'year':year,
      'pages':pages,
      'language':language,
      'publisher':publisher,
      'price':price,
      'stock':stock,
  };

  factory Book.fromJson(Map<String, dynamic> parsedJson){
    return Book(
      id: parsedJson['id'],
      title: parsedJson['title'],
      desc: parsedJson['desc'],
      year: parsedJson['year'],
      pages: parsedJson['pages'],
      language: parsedJson['language'],
      publisher: parsedJson['publisher'],
      price: parsedJson['price'],
      stock: parsedJson['stock'],);
  }
}
