part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState extends Equatable {
  const WishlistState();
}

class WishlistLoading extends WishlistState {
  @override
  List<Object> get props => [];
}

class WishlistLoaded extends WishlistState {
  final WishList wishlist;

  const WishlistLoaded({this.wishlist = const WishList()});

  @override
  List<Object> get props => [wishlist];
}

class WishlistError extends WishlistState {
  @override
  List<Object> get props => [];
}