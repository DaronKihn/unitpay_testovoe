import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unitpay_testovoe/components/body.dart';
import 'package:unitpay_testovoe/components/custom_icon_button.dart';
import 'bloc/product_bloc.dart';
import 'theme_constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text(
          'Меню',
          style: TextStyle(color: kTextColor),
        ),
        centerTitle: false,
        actions: <Widget>[
          CustomIconButton(
            icon: Icons.add,
            onPress: () {
              BlocProvider.of<ProductBloc>(context).add(AddProduct());
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
