import 'package:acununparasiniharca/pages/homePage.dart';
import 'package:flutter/cupertino.dart';


class Products{
  String name;
  int price=10;
  int piece=0;


  Products({this.name,this.price});



  addPiece(){
    piece++;

  }

  minusPiece(){
    if(piece<=0){
      piece-=1;

    }
  }



}