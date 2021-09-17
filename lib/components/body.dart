import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitpay_testovoe/bloc/product_bloc.dart';
import 'package:unitpay_testovoe/components/product_card.dart';
import 'package:unitpay_testovoe/theme_constants.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      width: double.infinity,
      height: double.infinity,
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductsLoaded) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  index: index,
                  product: state.products[index],
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: kTextColor,
            ),
          );
        },
      ),
    );
  }
}
