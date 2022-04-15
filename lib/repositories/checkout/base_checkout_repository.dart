import '../../models/models.dart';

abstract class BaseCheckOutRepository{
  Future<void> AddCheckout(Checkout checkout);
}