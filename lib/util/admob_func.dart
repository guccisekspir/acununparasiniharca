


import 'package:firebase_admob/firebase_admob.dart';

class AdMobFunc{

  static final String appIDCanli="ca-app-pub-7605273585426904~1558139115";
  static final String appIDTest=FirebaseAdMob.testAppId;



static adMobInitialize(){
  FirebaseAdMob.instance.initialize(appId: appIDTest);
}

static final MobileAdTargetingInfo targetingInfo=MobileAdTargetingInfo(
  keywords: <String>['survivor', 'acun ılıcalı'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
  testDevices: <String>["kGADSimulatorID"], // Android emulators are considered test devices
);



static InterstitialAd buildInters(){

  return InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

}

}