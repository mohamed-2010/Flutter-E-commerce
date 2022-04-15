import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myneweccomerce/repositories/checkout/base_checkout_repository.dart';

import '../../models/models.dart';

class CheckoutRepository extends BaseCheckOutRepository {
  final FirebaseFirestore _firebaseFirestore;

  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> AddCheckout(Checkout checkout) {
    return _firebaseFirestore
        .collection('checkout')
        .add(checkout
        .toDocument()
    );
  }
}