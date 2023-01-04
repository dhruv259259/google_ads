import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MaterialApp(
    home: g_mod(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
  ));
}

class g_mod extends StatefulWidget {

  @override
  State<g_mod> createState() => _g_modState();
}

class _g_modState extends State<g_mod> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myBanner.load();
  }
  BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/6300978111ghk',
    size: AdSize.smartBanner,
    request: AdRequest(),
    listener:  BannerAdListener(
      // Called when an ad is successfully received.
      onAdLoaded: (Ad ad) => print('Ad loaded.'),
      // Called when an ad request failed.
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        // Dispose the ad here to free resources.
        ad.dispose();
        print('Ad failed to load: $error');
      },
      // Called when an ad opens an overlay that covers the screen.
      onAdOpened: (Ad ad) => print('Ad opened.'),
      // Called when an ad removes an overlay that covers the screen.
      onAdClosed: (Ad ad) => print('Ad closed.'),
      // Called when an impression occurs on the ad.
      onAdImpression: (Ad ad) => print('Ad impression.'),
    ),

  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    myBanner.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google ad mode"),
      ),

      bottomNavigationBar:Container(
        alignment: Alignment.center,
        child:  AdWidget(ad: myBanner),
        width: double.infinity,
        height: 50
      ),
    );
  }
}
