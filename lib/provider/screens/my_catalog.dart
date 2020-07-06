import 'package:flutter/material.dart';
import 'package:flutter_app/provider/common/text_styles.dart';
import 'package:flutter_app/provider/common/theme.dart';
import 'package:flutter_app/provider/models/cart.dart';
import 'package:flutter_app/provider/models/catalog.dart';
import 'package:flutter_app/provider/screens/my_cart.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _MyAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) => _MyListItem(index),
              ),
            )
          ],

        ),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        'Catalog22',
        style: headerStyle,
      ),
      floating: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
//          onPressed: () => Navigator.pushNamed(context, '/cart'),
          onPressed: () =>  Navigator.push(context,MaterialPageRoute(builder: (context) => MyCart())),
          tooltip: 'Cart',
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index, {Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var catalog = Provider.of<CataLogModel>(context);
    var item = catalog.getByPosition(index);
    var textTheme = titleStyle;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: LimitedBox(
          maxHeight: 48,
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: item.color,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
              child: Text(
                item.name, style: subHeaderStyle,
              ),
            ),
            SizedBox(
              width: 24,
            ),
            _AddButton(item: item),
          ],
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: cart.items.contains(item) ? null : () => cart.add(item),
      splashColor: Theme.of(context).primaryColor,
      child: cart.items.contains(item)
      ? Icon(Icons.check, semanticLabel: 'ADDED') : Text('ADD')
    );
  }
}



