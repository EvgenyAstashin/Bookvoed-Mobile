import 'package:bookvoed/models/price.dart';

class SaleInfo {
  String country;
  String saleability;
  bool isEbook;
  Price listPrice;
  Price retailPrice;
  String buyLink;

  SaleInfo(
      {this.country,
        this.saleability,
        this.isEbook,
        this.listPrice,
        this.retailPrice,
        this.buyLink});

  SaleInfo.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'] != null
        ? new Price.fromJson(json['listPrice'])
        : null;
    retailPrice = json['retailPrice'] != null
        ? new Price.fromJson(json['retailPrice'])
        : null;
    buyLink = json['buyLink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['saleability'] = this.saleability;
    data['isEbook'] = this.isEbook;
    if (this.listPrice != null) {
      data['listPrice'] = this.listPrice.toJson();
    }
    if (this.retailPrice != null) {
      data['retailPrice'] = this.retailPrice.toJson();
    }
    data['buyLink'] = this.buyLink;
    return data;
  }
}