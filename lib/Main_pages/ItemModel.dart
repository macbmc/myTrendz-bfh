import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String name;
  String short_description;
  //Timestamp publishedDate;
  String image;
  String long_description;
  String status;
  String category;
  int your_price;
  int mrp;
  int discount;

  ItemModel(
      {this.name,
        this.short_description,
        //this.publishedDate,
        this.image,
        this.long_description,
        this.status,
      });

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    short_description = json['short_description'];
    image = json['image'];
    long_description = json['long_description'];
    status = json['status'];
    your_price = json['your_price'];
    mrp  = json['mrp'];
    discount = json['discount'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.name;
    data['shortInfo'] = this.short_description;
    data['price'] = this.your_price;
    data['mrp']= this.mrp;
    data['discount']=this.discount;
   data['category']=this.category;
    data['thumbnailUrl'] = this.image;
    data['longDescription'] = this.long_description;
    data['status'] = this.status;
    return data;
  }
}

class PublishedDate {


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }
}
