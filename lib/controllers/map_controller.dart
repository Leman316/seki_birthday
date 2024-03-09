import 'package:get/get.dart';
import '/consts/consts.dart';

class MapController extends GetxController {
  RxInt currentMap = 1.obs;

  Map<int, String> showMap = {
    1: AppAssets.map1,
    2: AppAssets.map2,
    3: AppAssets.map3,
    4: AppAssets.map4,
  }.obs;

  List<List<List<double>>> map1NoGoZones = [
    [
      [0.10, 0.35],
      [0.45, 0.52],
    ],
    [
      [0.13, 0.39],
      [0.33, 0.40]
    ],
    [
      [0.65, 0.80],
      [0.35, 0.45]
    ],
    [
      [0.42, 0.58],
      [0.09, 0.19]
    ],
  ];

  List<List<List<double>>> map2NoGoZones = [
    [
      [0.18, 0.44],
      [0.13, 0.25],
    ],
    [
      [0.58, 0.73],
      [0.08, 0.25],
    ],
    [
      [0.40, 0.50],
      [0.44, 0.51],
    ],
  ];

  List<List<List<double>>> map3NoGoZones = [
    [
      [0.17, 0.31],
      [0.07, 0.23],
    ],
    [
      [0.54, 0.72],
      [0.13, 0.20],
    ],
    [
      [0.18, 0.33],
      [0.40, 0.50],
    ],
  ];
  List<List<List<double>>> map4NoGoZones = [];
  List<List<List<double>>> map5NoGoZones = [];
}
