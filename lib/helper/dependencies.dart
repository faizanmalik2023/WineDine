import 'package:get/get.dart';
import 'package:winedine/controllers/popular_product_controller.dart';
import 'package:winedine/data/api/api_client.dart';
import 'package:winedine/data/repository/popular_product_repo.dart';

Future<void> init() async {
  //apiclient
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://mvs.bslmeiyu.com/"));
  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
