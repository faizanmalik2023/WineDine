import 'package:get/get.dart';
import 'package:winedine/data/repository/popular_product_repo.dart';
import 'package:winedine/models/products_model.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      update();
    } else {
      //print(response.statusCode);
      // print("got products");
    }
  }

  int quantity = 0;
  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity = quantity + 1;
    } else {
      if (quantity == 0 || quantity < 0) {
        quantity = 0;
      } else {
        quantity = quantity - 1;
      }
    }
    update();
  }
}
