import 'package:flutter/material.dart';
import '../screen/filtters.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //here IconData store the info about icon we want to show ,it is built is flutter ,for more hover over Icon
    Widget listt(String title, IconData icon, Function tapHandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 5),
            height: 120,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking up!!',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                  color: Colors.black87),
            ),
          ),
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          listt(
            'Meals',
            Icons.restaurant,
            () {
              //pushNamed  pushes the page upone the stack of pages,which means we never delete the pageas and ther stack of pages keeps on growing
              //so, to resolvwe thast we user pushRepalascementpage WHICH CLEARRES THE PAGES and then push the new pages or showws new page
              // Navigator.of(context).pushNamed('/');

              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          listt('Filtters', Icons.settings, () {
            Navigator.of(context)
                .pushReplacementNamed(FilttersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
