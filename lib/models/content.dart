import 'dart:io';

class Content{

  File image;
  String title;
  String description;
  String price;

  Content(this.title, this.description,
   this.image, this.price);

  static List<Content> contents=[

  ];
}