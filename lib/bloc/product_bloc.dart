import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unitpay_testovoe/repositories/product_repository.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _productRepository;
  ProductBloc({required ProductRepository productRepository})
      : _productRepository = productRepository,
        super(ProductInitial());
  StreamSubscription? _productsStreamSubscription;

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is StartInitialProducts) {
      yield* _mapStartInitialProductsToState(event);
    }
    if (event is LoadListProducts) {
      yield* _mapLoadListProductsToState(event);
    }
    if (event is UpdateListProducts) {
      yield* _mapUpdateListProductsToState(event);
    }
    if (event is AddProduct) {
      yield* _mapAddProductToState(event);
    }
    if (event is DeleteProduct) {
      yield* _mapDeleteProductToState(event);
    }
  }

  Stream<ProductState> _mapStartInitialProductsToState(
    StartInitialProducts event,
  ) async* {
    _productRepository.addFirstGeneratedListToStream();
    add(LoadListProducts());
  }

  Stream<ProductState> _mapLoadListProductsToState(
    LoadListProducts event,
  ) async* {
    _productsStreamSubscription?.cancel();
    _productsStreamSubscription =
        _productRepository.productsUpdates.listen((products) {
      add(
        UpdateListProducts(products),
      );
    });
  }

  Stream<ProductState> _mapUpdateListProductsToState(
    UpdateListProducts event,
  ) async* {
    yield ProductsLoading();
    yield ProductsLoaded(event.products);
  }

  Stream<ProductState> _mapAddProductToState(
    AddProduct event,
  ) async* {
    _productRepository.addElement();
  }

  Stream<ProductState> _mapDeleteProductToState(
    DeleteProduct event,
  ) async* {
    _productRepository.removeElement(event.index);
  }

  @override
  Future<void> close() {
    _productsStreamSubscription?.cancel();
    return super.close();
  }
}
