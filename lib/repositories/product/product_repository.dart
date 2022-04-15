import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myneweccomerce/models/models.dart';
import 'package:myneweccomerce/repositories/category/category_repository.dart';
import 'package:myneweccomerce/repositories/product/base_product_repository.dart';

class ProductRepository extends BaseProductRepository{
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore,}) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
       return snapshot.docs.map((doc) => Product.fromSnapShoutProduct(doc)).toList();
    });
  }
}