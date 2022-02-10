import 'dart:convert';

List<ProductListResponse> productListResponseFromJson(String str) =>
    List<ProductListResponse>.from(
        json.decode(str).map((x) => ProductListResponse.fromJson(x)));

String productListResponseToJson(List<ProductListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListResponse {
  int? id;
  String? brand;
  String? name;
  double? price;
  String? priceSign;

  // String? currency;
  String? imageLink;

  // String? productLink;
  // String? websiteLink;
  // String? description;
  // double? rating;
  // String? category;
  // String? productType;
  // List<String>? tagList;
  // String? createdAt;
  // String? updatedAt;
  // String? productApiUrl;
  // String? apiFeaturedImage;
  // List<String>? productColors;

  ProductListResponse({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.priceSign,
    // this.currency,
    this.imageLink,
    // this.productLink,
    // this.websiteLink,
    // this.description,
    // this.rating,
    // this.category,
    // this.productType,
    // this.tagList,
    // this.createdAt,
    // this.updatedAt,
    // this.productApiUrl,
    // this.apiFeaturedImage,
    // this.productColors
  });

  ProductListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    price = double.parse(json['price']);
    priceSign = json['price_sign'];
    // currency = json['currency'];
    imageLink = json['image_link'];
    // productLink = json['product_link'];
    // websiteLink = json['website_link'];
    // description = json['description'];
    // rating = json['rating'];
    // category = json['category'];
    // productType = json['product_type'];
    // tagList = null;
    // if (json['tag_list'] != null) {
    //   tagList = <String>[];
    //   json['tag_list'].forEach((v) {
    //     tagList!.add(new String.fromJson(v));
    //   });
    // }
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // productApiUrl = json['product_api_url'];
    // apiFeaturedImage = json['api_featured_image'];
    // productColors = null;
    // if (json['product_colors'] != null) {
    //   productColors = <Null>[];
    //   json['product_colors'].forEach((v) {
    //     productColors!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['price'] = this.price;
    data['price_sign'] = this.priceSign;
    // data['currency'] = this.currency;
    data['image_link'] = this.imageLink;
    // data['product_link'] = this.productLink;
    // data['website_link'] = this.websiteLink;
    // data['description'] = this.description;
    // data['rating'] = this.rating;
    // data['category'] = this.category;
    // data['product_type'] = this.productType;
    // data['tag_list'] =null;
    // // if (this.tagList != null) {
    // //   data['tag_list'] = this.tagList!.map((v) => v.toJson()).toList();
    // // }
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['product_api_url'] = this.productApiUrl;
    // data['api_featured_image'] = this.apiFeaturedImage;
    // data['product_colors'] =null;
    // if (this.productColors != null) {
    //   data['product_colors'] =
    //       this.productColors!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
