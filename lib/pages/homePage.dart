import 'package:acununparasiniharca/util/myColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  ScrollController _sscrollController = ScrollController();
  int _servet = 1000000000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
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
                          gradient: LinearGradient(
                              colors: [Colors.limeAccent, Colors.cyanAccent]),
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
            SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      offset: Offset(-5.0, -5.0),
                      blurRadius: 6.0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(5.0, 5.0),
                      blurRadius: 6.0,
                    ),
                  ],
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Kalan Para " + _servet.toString() + " ₺",
                    style: GoogleFonts.bangers(fontSize: 32,color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
              controller: _sscrollController,
              shrinkWrap: true,
              itemCount: 10,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 6.0,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          offset: Offset(5.0, 5.0),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Color(0xFF292D32),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 8,
                            child: Image.asset(
                              "assets/hambur.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("Hamburger",style: GoogleFonts.bangers(fontSize: 20,color: Colors.white),),
                        SizedBox(height: 15,),
                        Text("10 ₺",style: GoogleFonts.bangers(fontSize: 20,color: Colors.greenAccent),),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(icon: Icon(Icons.add_circle,color: Colors.greenAccent,size: 35,),),
                            Container(child: Text("0 ",style: GoogleFonts.bangers(fontSize: 25,color: Colors.white),),),
                            IconButton(icon: Icon(Icons.do_not_disturb_on,color: Colors.redAccent,size: 35,),)

                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
