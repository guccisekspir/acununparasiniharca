import 'package:acununparasiniharca/util/products.dart';
import 'package:acununparasiniharca/util/randomGradient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_text/gradient_text.dart';



class SummaryPage extends StatefulWidget {
  final List<Products> fullList;

  const SummaryPage({Key key, this.fullList}) : super(key: key);
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  List<Products> purchasedList=[];
  ScrollController _scrollController;
  ScrollController _scrollController2;

  @override
  void initState() {

    for(var i in widget.fullList){
      if(i.piece>0)purchasedList.add(i);
    }

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Container(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                          gradient: randomGradient(),
                          color: Colors.limeAccent,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/acunpp.jpg"),
                      radius: 70,
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 35,),
            GradientText("ACUNUN PARASIYLA ALDIĞIM ŞEYLER",gradient: randomGradient(),style: GoogleFonts.bangers(color: Colors.white,fontSize: 25),),
            SizedBox(height: 35,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Container(
                child: GridView.builder(
                  controller: _scrollController2,
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount:
                    purchasedList.length,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3.2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 5,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return badgeMaker(purchasedList[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget badgeMaker(Products purchased) {
    return FittedBox(
      child: Container(
        decoration: BoxDecoration(
            gradient: randomGradient(), borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 17,
                child: CircleAvatar(
                  child: Image.asset(
                    purchased.image,
                    fit: BoxFit.contain,
                  ),
                  radius: 14,
                  backgroundColor: Colors.limeAccent,
                )),
            Text(
              purchased.piece.toString()+"x "+purchased.name,
              style: GoogleFonts.righteous(fontSize: 10, color: Colors.black,fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
