part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class StartInitialProducts extends ProductEvent {}

class LoadListProducts extends ProductEvent {}

class UpdateListProducts extends ProductEvent {
  final List products;

  UpdateListProducts(this.products);

  @override
  List<Object> get props => [products];
}

class AddProduct extends ProductEvent {}

class DeleteProduct extends ProductEvent {
  final int index;

  const DeleteProduct(this.index);
  @override
  List<Object> get props => [index];
}
