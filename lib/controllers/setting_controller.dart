import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '/consts/consts.dart';
import '/services/api_services.dart';
import '/utils/helpers.dart';

class SettingController extends GetxController {
  RxBool isLoading = true.obs;

  RxString applicationId = ''.obs;
  RxString appopenPlacementId = ''.obs;
  RxString bannerPlacementId = ''.obs;
  RxString interstitialPlacementId = ''.obs;
  RxString nativePlacementId = ''.obs;
  RxInt sliderIndex = 0.obs;
  Rxn<PackageInfo> appInfo = Rxn<PackageInfo>().obs();

  loadData() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      try {
        String url = '${AppConsts.baseUrl}${AppConsts.settings}';
        Map<String, String> headers = {
          'X-API-KEY': AppConsts.apiKey,
        };
        Map<String, dynamic> body = {};
        var response = await ApiService.post(
          url,
          headers: headers,
          body: body,
        );

        var jsonString = response.body;
        dd(jsonString);
        // var responseModel = Setting.fromJson(jsonDecode(jsonString));

        // if (responseModel.status == true) {
        //   //onInitApp(responseModel.data!.androidApplicationId!);
        //   await Future.delayed(2.seconds);

        //   Get.offAll(() => const GameScreen(page: 0));
        // } else {}
      } catch (e) {
        dd(e);
      }
    } else {}
  }

  bool showAd() {
    // var setting = settings.value;

    // if (Platform.isAndroid) {
    //   if (setting.androidEnableAds != '0') {
    //     adCount.value = adCount.value + 1;
    //     if (adCount.value == int.parse(setting.androidInterstitialAdClick ?? '5')) {
    //       adCount.value = 0;
    //       return true;
    //     }
    //   }
    // } else {
    //   if (setting.iosEnableAds != '0') {
    //     adCount.value = adCount.value + 1;
    //     if (adCount.value == int.parse(setting.iosInterstitialAdClick ?? '5')) {
    //       adCount.value = 0;
    //       return true;
    //     } else {}
    //   }
    // }
    return false;
  }

  static const platform = MethodChannel('await/xml');
  Future<void> onInitApp(id) async {
    // if (Platform.isAndroid) {
    //   try {
    //     final String result = await platform.invokeMethod('updateAppId', {
    //       'appId': id,
    //     });
    //     dd('RESULT -> $result');
    //   } on PlatformException catch (e) {
    //     dd(e);
    //   }
    // }

    // WidgetsFlutterBinding.ensureInitialized();
    // MobileAds.instance.updateRequestConfiguration(
    //   RequestConfiguration(
    //     tagForChildDirectedTreatment: TagForChildDirectedTreatment.unspecified,
    //     testDeviceIds: <String>[
    //       "8FECD77B9178A2514A9BFB8F6DB2C99F",
    //     ],
    //   ),
    // );
  }

  @override
  void onInit() {
    super.onInit();

    loadData();
  }
}
