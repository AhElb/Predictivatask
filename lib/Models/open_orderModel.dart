/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import 'package:predictiva/Models/Portfolio_model.dart';

class Dataorder {
  List<Order>? orders;

  Dataorder({this.orders});

  Dataorder.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Order>[];
      json['orders'].forEach((v) {
        orders!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['orders'] =
        orders != null ? orders!.map((v) => v?.toJson()).toList() : null;
    return data;
  }
}

class Order {
  String? symbol;
  String? type;
  String? side;
  double? quantity;
  int? creationtime;
  double? price;

  Order(
      {this.symbol,
      this.type,
      this.side,
      this.quantity,
      this.creationtime,
      this.price});

  Order.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    type = json['type'];
    side = json['side'];
    quantity = json['quantity'];
    creationtime = json['creation_time'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['symbol'] = symbol;
    data['type'] = type;
    data['side'] = side;
    data['quantity'] = quantity;
    data['creation_time'] = creationtime;
    data['price'] = price;
    return data;
  }
}

class OrderModel {
  Status? status;
  Dataorder? data;

  OrderModel({this.status, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status?.fromJson(json['status']) : null;
    data = json['data'] != null ? Dataorder?.fromJson(json['data']) : null;
  }
}
