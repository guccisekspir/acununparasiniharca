import 'package:acununparasiniharca/pages/homePage.dart';
import 'package:flutter/cupertino.dart';

class Products {
  String name;
  String image;
  int price = 10;
  int piece = 0;

  Products({this.name, this.price,this.image});

  addPiece() {
    piece++;
  }

  minusPiece() {
    if (piece >= 0) {
      piece -= 1;
    }
  }
}
