import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {

  static BannerAd createBannerAd() {

    return BannerAd(
      adUnitId:
      "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    )..load();
  }

  static InterstitialAd? interstitialAd;

  static void loadInterstitial() {

    InterstitialAd.load(
      adUnitId:
      "ca-app-pub-3940256099942544/1033173712",
      request: const AdRequest(),
      adLoadCallback:
          InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          interstitialAd = ad;
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  static void showInterstitial() {

    if (interstitialAd != null) {

      interstitialAd!.show();

      interstitialAd = null;

      loadInterstitial();
    }
  }

  static void loadRewardAd() {

    RewardedAd.load(
      adUnitId:
      "ca-app-pub-3940256099942544/5224354917",
      request: const AdRequest(),
      rewardedAdLoadCallback:
          RewardedAdLoadCallback(
        onAdLoaded: (ad) {},
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  static void loadAppOpenAd() {

    AppOpenAd.load(
      adUnitId:
      "ca-app-pub-3940256099942544/9257395921",
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          ad.show();
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }
}