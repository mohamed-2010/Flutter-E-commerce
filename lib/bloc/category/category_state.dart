part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> category;

  CategoryLoaded({this.category = const <Category>[]});

  @override
  List<Object> get props => [category];
}


