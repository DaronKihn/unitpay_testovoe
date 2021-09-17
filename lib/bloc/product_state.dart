part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductsLoaded extends ProductState {
  final List products;

  const ProductsLoaded(this.products);
  @override
  List<Object> get props => [products];
}

class ProductsLoading extends ProductState {}