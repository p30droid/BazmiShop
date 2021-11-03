import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobService {
  static String get bannerAdUnitId => Platform.isAndroid
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-3940256099942544/6300978111";

  static initializer() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAds() {
    BannerAd ad = new BannerAd(
        size: AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(
            onAdClosed: (Ad ad) => print('Ad Closed'),
            onAdLoaded: (Ad ad) => print('Ad Loaded'),
            onAdFailedToLoad: (Ad ad, LoadAdError) {}),
        request: AdRequest());

    return ad;
  }

  static intestialLoad() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
// Keep a reference to the ad so you can show it later.
            // this._interstitialAd = ad;
            ad.show();
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }
}
