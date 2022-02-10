import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:os_store/config/theme/app_colors.dart';
import 'package:os_store/config/theme/app_sizes.dart';
import 'package:os_store/config/theme/app_txt_theme.dart';
import 'package:os_store/config/theme/styles.dart';
import 'package:os_store/controller/product_list_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:os_store/utils/utilities.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    ProductListController dx = Get.put(ProductListController());

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        toolbarHeight: AppSizes().appBarHeight,
        title: Text(
          "Open Sesame",
          style: AppTxtStyles().titleHeaderStyle,
        ),
        leading: GestureDetector(
          onTap: () {},
          child: Image.asset(
            'assets/images/splash_logo.png',
            fit: BoxFit.contain,
            height: AppSizes().appBarIconSize,
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Utilities().showToast("Coming soon...");
                },
                child: const Icon(
                  Icons.search,
                  size: 26.0,
                ),
              )),
        ],
        flexibleSpace: Container(
          decoration: containerBGDecoration,
        ),
      ),
      body: SafeArea(
        child:
            // Expanded(
            //   flex: 8,
            //   child:
            GetBuilder<ProductListController>(
          builder: (_dx) => ListView.builder(
              // itemExtent: 100,
              controller: dx.scrollController,
              itemCount: _dx.products.length + 1,
              itemBuilder: (context, index) {
                if (index == _dx.products.length) {
                  return _dx.hasMore.value
                      ? Lottie.asset(
                          'assets/lottie/loader.json',
                          width: 60,
                          height: 60,
                          fit: BoxFit.scaleDown,
                        )
                      : Container();
                }
                return Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    // borderRadius: BorderRadius.circular(40),
                  ),
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      // borderRadius: BorderRadius.circular(40), // if you need this
                      side: BorderSide(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    color: AppColors.WHITE,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 33,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: CachedNetworkImage(
                              imageUrl: dx.products[index].imageLink ??= "",
                              placeholder: (context, url) => Lottie.asset(
                                'assets/lottie/loader_image.json',
                                width: 70,
                                height: 70,
                                fit: BoxFit.scaleDown,
                              ),
                              //     CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 66,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 40,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 10, 0, 10),
                                  child: Text(dx.products[index].name,
                                      style: AppTxtStyles().titleStyle),
                                ),
                              ),
                              Expanded(
                                flex: 10,
                                child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Text(
                                        dx.products[index].priceSign ??= "\$" +
                                            dx.products[index].price.toString(),
                                        style: AppTxtStyles().subTitleStyle)),
                              ),
                              Expanded(
                                flex: 40,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton.icon(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                color: Colors.black),
                                            backgroundColor: Colors.orange[400],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          onPressed: () => {
                                            Utilities()
                                                .showToast("Coming soon...")
                                          },
                                          icon: const Icon(
                                              Icons.price_change_rounded,
                                              color: Colors.black),
                                          label: const Text(
                                            'Buy Now',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: TextButton.icon(
                                          style: TextButton.styleFrom(
                                            textStyle: const TextStyle(
                                                color: Colors.black),
                                            backgroundColor: Colors.yellow[600],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                          ),
                                          onPressed: () => {
                                            Utilities()
                                                .showToast("Coming soon...")
                                          },
                                          icon: const Icon(Icons.shopping_cart,
                                              color: Colors.black),
                                          label: const Text(
                                            'Add to Cart',
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
        // ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.price_change_outlined,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              backgroundColor: Colors.deepPurple,
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => dx.sortUpPrice()),
          SpeedDialChild(
              child: const Icon(
                Icons.arrow_drop_up,
                color: Colors.white,
              ),
              backgroundColor: Colors.deepPurple,
              labelStyle: const TextStyle(fontSize: 18.0),
              onTap: () => dx.sortDownPrice()),
        ],
      ),
    );
  }
}
