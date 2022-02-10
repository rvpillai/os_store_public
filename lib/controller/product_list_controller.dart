import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:os_store/model/product_list_response.dart';
import 'package:os_store/network/url.dart';

import '../network/request.dart';

class ProductListController extends GetxController {
  var products = [].obs;

  var allProducts = [].obs;

  int currentMax = 10;

  RxBool hasMore = true.obs;

  int maxLength = 0;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    _fetchProductList();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getMoreData();
      }
    });

    super.onInit();
  }

  getMoreData() {
    if (hasMore.value) {
      for (int i = currentMax; i < currentMax + 10; i++) {
        if (i < maxLength) {
          products.value.add(allProducts[i]);
          update();
        } else {
          hasMore.value = false;
        }
      }
      currentMax = currentMax + 10;
    }
    update();
  }

  updateProductList(productsFromAPI) {
    allProducts.value = productsFromAPI;

    maxLength = allProducts.length;

    products.value = List.generate(10, (index) => productsFromAPI[index]);
    update();
  }

  sortUpPrice() {
    //Ascending
    products.sort((a, b) => a.price.compareTo(b.price));
    update();
  }

  sortDownPrice() {
    //Ascending
    products.sort((a, b) => b.price.compareTo(a.price));
    update();
  }

  void _fetchProductList() {
    Request request = Request(
      url: urlAllProductList,
    );
    request.get().then((value) {
      if (value.statusCode == 200) {
        final products = productListResponseFromJson(value.body);

        updateProductList(products);
      } else if (value.statusCode == 302) {
        Get.defaultDialog(middleText: "302:Found");
      } else {
        Get.defaultDialog(middleText: "Error");
      }
    }).catchError((onError) {});
  }
}
