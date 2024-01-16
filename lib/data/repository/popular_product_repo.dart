import 'package:get/get.dart';
import 'package:winedine/data/api/api_client.dart';
import 'package:winedine/data/repository/popular_product_repo.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});
  Future<Response> getPopularProductList() async {
    return await apiClient.getData("api/v1/products/popular");
  }
}
