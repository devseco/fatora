import 'package:cashback/features/order/data/models/store_online_model.dart';

class StoresOnlineRepository {
  Future<List<StoreOnlineModel>> getStores() async {
    return [
      StoreOnlineModel(name: 'متجر 1', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '20%'),
      StoreOnlineModel(name: 'متجر 2', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '15%'),
    ];
  }
}