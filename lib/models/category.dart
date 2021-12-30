import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  //here we use const counstruct because trhe values we dont want them to change once we created it
  //const is also used because we in dummy file stored this list in sconst variable
  const Category(
      {@required this.id, this.color = Colors.orange, @required this.title});
}
