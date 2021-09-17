import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitpay_testovoe/bloc/product_bloc.dart';
import 'package:unitpay_testovoe/components/custom_icon_button.dart';
import 'package:unitpay_testovoe/models/item.dart';
import '../theme_constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key, required product, required index})
      : _product = product,
        _index = index,
        super(key: key);

  final int _index;
  final Item _product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      height: 180.0,
      color: kMainColor,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 150.0,
                  width: 150.0,
                  child: Image.network(_product.url),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _product.label,
                      style: TextStyle(color: kTextColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: CustomIconButton(
              icon: Icons.delete,
              onPress: () {
                BlocProvider.of<ProductBloc>(context)
                    .add(DeleteProduct(_index));
              },
            ),
          ),
        ],
      ),
    );
  }
}
