import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController=ScrollController();
  ScrollController _sscrollController=ScrollController();
  int _servet=1000000000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2c3848),

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
                          gradient: LinearGradient(colors: [Colors.limeAccent,Colors.cyanAccent]),
                          color: Colors.limeAccent,
                          shape: BoxShape.circle),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/acunpp.jpg"),
                      radius: 70, //TODO radiusları mediaquerye göre yap
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 22,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.limeAccent,
                ),

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Kalan Para "+_servet.toString()+" ₺",style: GoogleFonts.bangers(fontSize: 32),),
                ),),
            ),
            SizedBox(height: 30,),
            GridView.builder(
              controller: _sscrollController,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2
            ), itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(child: Text(index.toString()),),
              );
            },)
          ],

        ),
      ),
    );
  }
}
