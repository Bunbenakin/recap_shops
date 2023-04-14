import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../providers/product_data_info.dart';
import '../providers/product.dart';
import '../widget/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showfavs;
  ProductsGrid(this.showfavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductDataInfo>(context);
    final products = showfavs
        ? productsData.ShowFavourites
        : productsData.items; //this get us the list of product with .items

    return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemBuilder: ((ctx, i) => ChangeNotifierProvider.value(
              //builder: (c) => products[i
              value: products[i],
              child: ProductItem(),
            )));
  }
}
