import 'package:cashback/features/order/data/models/store_branch_model.dart';

class StoresBranchRepository {
  Future<List<StoreBranchModel>> getStores() async {
    return [
      StoreBranchModel(name: 'متجر 1', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '20%', type: 'عرض'),
      StoreBranchModel(name: 'متجر 2', logoUrl: 'https://www.shutterstock.com/image-vector/kfc-logo-icon-art-design-260nw-2269871217.jpg', discount: '15%', type: 'فاتورة'),
    ];
  }
}
