/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Data {
  Portfolio? portfolio;

  Data({this.portfolio});

  Data.fromJson(Map<String, dynamic> json) {
    portfolio = json['portfolio'] != null
        ? Portfolio?.fromJson(json['portfolio'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['portfolio'] = portfolio!.toJson();
    return data;
  }
}

class Portfolio {
  dynamic balance;
  dynamic profit;
  dynamic profitpercentage;
  int? assets;

  Portfolio({this.balance, this.profit, this.profitpercentage, this.assets});

  Portfolio.fromJson(Map<String, dynamic> json) {
    balance = json['balance'];
    profit = json['profit'];
    profitpercentage = json['profit_percentage'];
    assets = json['assets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['balance'] = balance;
    data['profit'] = profit;
    data['profit_percentage'] = profitpercentage;
    data['assets'] = assets;
    return data;
  }
}

class PortfolioModel {
  Status? status;
  Data? data;

  PortfolioModel({this.status, this.data});

  PortfolioModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? Status?.fromJson(json['status']) : null;
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
  }
}

class Status {
  String? msg;

  Status({this.msg});

  Status.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['msg'] = msg;
    return data;
  }
}
