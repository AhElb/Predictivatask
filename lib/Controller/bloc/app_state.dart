part of 'app_bloc.dart';

@immutable
class AppState {
  bool isloading;
  List<Order>? coins;
  PortfolioModel? portfolioModel;
  int? curruntpage;
  int? listlength;

  bool? filteron;

  List<Order>? orderslist;
  int? pages;

  AppState(
      {required this.isloading,
      this.portfolioModel,
      this.coins,
      this.filteron,
      this.orderslist,
      this.listlength,
      this.curruntpage,
      this.pages});

  factory AppState.initi() {
    return AppState(
        isloading: false,
        pages: 0,
        listlength: 0,
        filteron: false,
        curruntpage: 0,
        orderslist: [],
        coins: [],
        portfolioModel: PortfolioModel(
            status: Status(msg: ''),
            data: Data(
                portfolio: Portfolio(
                    balance: 0, profit: 0, profitpercentage: 0, assets: 0))));
  }

  AppState update({
    required bool isloading,
    PortfolioModel? portfolioModel,
    List<Order>? orderslist,
    List<Order>? coins,
    int? curruntpage,
    bool? filteron,
    int? pages,
    int? listlength,
  }) {
    return AppState(
        isloading: isloading,
        filteron: filteron ?? this.filteron,
        orderslist: orderslist ?? this.orderslist,
        coins: coins ?? this.coins,
        portfolioModel: portfolioModel ?? this.portfolioModel,
        curruntpage: curruntpage ?? this.curruntpage,
        listlength: listlength ?? this.listlength,
        pages: pages ?? this.pages);
  }
}
