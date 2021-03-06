import 'package:acununparasiniharca/pages/summaryFile.dart';
import 'package:acununparasiniharca/util/admob_func.dart';
import 'package:acununparasiniharca/util/myColors.dart';
import 'package:acununparasiniharca/util/myProducts.dart';
import 'package:acununparasiniharca/util/products.dart';
import 'package:acununparasiniharca/util/randomGradient.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

int servet = 3512660320;
final formatCurrency = new NumberFormat.simpleCurrency();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  ScrollController _sscrollController = ScrollController();
  Products newProduct = Products(name: "Eben", price: 10);
  List<Products> newProducts = [];
  ProgressDialog pr;
  Color kalanParaColor=Colors.blueAccent;

  @override
  void initState() {
    pr = ProgressDialog(context, isDismissible: false);
    // TODO: implement initState
    RewardedVideoAd.instance.listener =
        (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}) {
      if (event == RewardedVideoAdEvent.rewarded) {
        setState(() {
          servet += 300000000;
        });
        print(" *************** ODULLU REKLAM ***** ODUL VER");
        odulluReklamLoad();
      } else if (event == RewardedVideoAdEvent.loaded) {
        pr.hide();

        print(
            " *************** ODULLU REKLAM ***** REKLAM yuklendı ve gosterilecek");
        RewardedVideoAd.instance.show();
      } else if (event == RewardedVideoAdEvent.closed) {
        pr.hide();
        print(" *************** ODULLU REKLAM ***** REKLAM KAPATILDI");
      } else if (event == RewardedVideoAdEvent.failedToLoad) {
        pr.hide();
        print(" *************** ODULLU REKLAM ***** REKLAM BULUNAMADI");
        odulluReklamLoad();
      } else if (event == RewardedVideoAdEvent.completed) {
        pr.hide();
        print(" *************** ODULLU REKLAM ***** COMPLETED");
      }
    };

    super.initState();
  }

  void odulluReklamLoad() {
    RewardedVideoAd.instance.load(
        adUnitId: AdMobFunc.rewardID,
        targetingInfo: AdMobFunc.targetingInfo);
  }

  @override
  Widget build(BuildContext context) {

    pr.style(
        backgroundColor: Colors.greenAccent,
        messageTextStyle: TextStyle(color: Colors.black),
        message: "İşlem Gerçekleştiriliyor...",
        borderRadius: 30);
    for (int i = 0; i < productsPrices.length - 1; i++) {
      Products newProducta = Products(
          price: productsPrices[i],
          name: productsName[i],
          image: productImages[i]);
      newProducts.add(newProducta);
    }
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.restore_from_trash),
            mini: true,
            backgroundColor: Colors.red,
            onPressed: (){
              setState(() {
                for(var i in newProducts){
                  i.piece=0;
                }
                servet = 3512660320;
              });
            },
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.INFO,
                animType: AnimType.BOTTOMSLIDE,
                btnCancelText: "İptal",
                btnOkText: "Bitti",
                tittle: 'Özeti Gör',
                desc: 'İşleminiz bitti mi ? ',
                btnCancelOnPress: () {},
                btnOkOnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SummaryPage(
                                fullList: newProducts,
                              )));
                },
              )..show();
            },
            child: Icon(
              Icons.done_outline,
              color: Colors.black,
              size: 33,
            ),
            backgroundColor: Colors.greenAccent,
            elevation: 20,
          ),
          FloatingActionButton.extended(
              heroTag: "btn3",
              backgroundColor: kalanParaColor,
              onPressed: (){}, label: Text(formatCurrency.format(servet) + " ₺",textAlign: TextAlign.center,style: GoogleFonts.bangers(color: Colors.black,fontWeight: FontWeight.bold),))
        ],
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            
            SafeArea(
              child: Container(
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
                    "Kalan Para " + formatCurrency.format(servet) + " ₺",textAlign: TextAlign.center,
                    style:
                        GoogleFonts.bangers(fontSize: MediaQuery.of(context).size.height/37, color: Colors.black),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, right: 100, top: 20),
              child: GestureDetector(
                onTap: () {
                  pr.show();
                  RewardedVideoAd.instance.load(
                      adUnitId: AdMobFunc.rewardID,
                      targetingInfo: AdMobFunc.targetingInfo);
                },
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
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "300 MİLYON Ekle",textAlign: TextAlign.center,
                      style: GoogleFonts.bangers(
                          fontSize: MediaQuery.of(context).size.height/30, color: Colors.black),
                    ),
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
              itemCount: productsName.length - 1,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.6),
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
                              newProducts[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/40,//between image name
                        ),
                        Text(
                          productsName[index],
                          style: GoogleFonts.bangers(
                              fontSize: MediaQuery.of(context).size.height/40, color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          formatCurrency.format(newProducts[index].price) +
                              " ₺",
                          style: GoogleFonts.bangers(
                              fontSize: MediaQuery.of(context).size.height/45, color: Colors.greenAccent),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height/15, //between name buttons
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                color: Colors.greenAccent,
                                size: 35,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (!(servet - newProducts[index].price <
                                      0)) {
                                    newProducts[index].addPiece();
                                    servet -= newProducts[index].price;
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Yetersiz Bakiye"),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(milliseconds: 300),
                                    ));
                                  }
                                });
                              },
                            ),
                            Container(
                              child: Text(
                                newProducts[index].piece.toString(),
                                style: GoogleFonts.bangers(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {

                                    if (newProducts[index].piece > 0) {
                                      newProducts[index].minusPiece();
                                      servet += newProducts[index].price;
                                    }
                                   else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Önce Satın Alınız!"),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(milliseconds: 300),
                                    ));
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.do_not_disturb_on,
                                color: Colors.redAccent,
                                size: 35,
                              ),
                            )
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
