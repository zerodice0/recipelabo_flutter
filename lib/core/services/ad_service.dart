import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AdService {
  static String get bannerAdUnitId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? dotenv.env['SAUCERER_TEST_ANDROID_BANNER_AD_ID'] ??
                'ca-app-pub-3940256099942544/6300978111'
          : dotenv.env['SAUCERER_TEST_IOS_BANNER_AD_ID'] ??
                'ca-app-pub-3940256099942544/2934735716';
    } else {
      return Platform.isAndroid
          ? dotenv.env['SAUCERER_ANDROID_BANNER_AD_ID'] ??
                'ca-app-pub-3940256099942544/6300978111'
          : dotenv.env['SAUCERER_IOS_BANNER_AD_ID'] ??
                'ca-app-pub-3940256099942544/2934735716';
    }
  }

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static BannerAd createBannerAd({
    required AdSize adSize,
    required BannerAdListener adListener,
  }) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: adSize,
      request: const AdRequest(),
      listener: adListener,
    );
  }
}
