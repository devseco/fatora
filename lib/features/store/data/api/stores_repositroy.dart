import '../models/stores_model.dart';

class StoreRepository {
  Future<List<Store>> getStores() async {
    return [
      Store(name: 'متجر 1', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '20%'),
      Store(name: 'متجر 2', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '15%'),
    ];
  }
}