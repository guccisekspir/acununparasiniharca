


import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io';

class AdMobFunc{

  static final String appIDCanli=Platform.isIOS?"ca-app-pub-7605273585426904~6476613243":"ca-app-pub-7605273585426904~1558139115";
  static final String intersID=Platform.isIOS?"ca-app-pub-7605273585426904/4896223674":"ca-app-pub-7605273585426904/7422508182";
  static final String rewardID=Platform.isIOS?"ca-app-pub-7605273585426904/5163531572":"ca-app-pub-7605273585426904/7073996151";



static adMobInitialize(){
  FirebaseAdMob.instance.initialize(appId: appIDCanli);
}

static final MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
  keywords: <String>['survivor', 'acun ılıcalı'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>["kGADSimulatorID"], // Android emulators are considered test devices
);



static InterstitialAd buildInters(){

  return InterstitialAd(
    adUnitId: intersID,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

}

}