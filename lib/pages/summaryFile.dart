import 'dart:io';

import 'package:acununparasiniharca/util/admob_func.dart';
import 'package:acununparasiniharca/util/products.dart';
import 'package:acununparasiniharca/util/randomGradient.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';



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
  ScreenshotController screenshotController = ScreenshotController();
  File sharingPhoto;
  bool isSS=true;
  InterstitialAd interstitialAd;
  @override
  void initState() {
    AdMobFunc.adMobInitialize();
    interstitialAd=AdMobFunc.buildInters();
    interstitialAd..load()..show();

    for(var i in widget.fullList){
      if(i.piece>0)purchasedList.add(i);
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    interstitialAd.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(onPressed: (){
          setState(() {
            isSS=false;
          });
          screenshotController.capture().then((File image) {
            //Capture Done
            setState(() {
              sharingPhoto = image;
              isSS=true;
            });
            SocialShare.shareInstagramStory(sharingPhoto.path,"#000000","#000000","https://deep-link-url",
                );

          }).catchError((onError) {
            print(onError);
          });

        }, label: Row(
          children: [
            Icon(LineAwesomeIcons.instagram,),
            Text(isSS?"İnstagramda paylaş":"@sekspirdev",style: GoogleFonts.bangers(),),
          ],
        ),
          backgroundColor: Colors.red,


        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: 10,),
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
              GradientText("ACUNUN PARASIYLA ALDIĞIM ŞEYLER",gradient: randomGradient(),style: GoogleFonts.bangers(color: Colors.white,fontSize: 23),textAlign: TextAlign.center,),
              SizedBox(height: 35,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
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
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return badgeMaker(purchasedList[index]);
                      }),
                ),
              ),
            ],
          ),
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
