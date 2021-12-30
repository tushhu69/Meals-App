import 'package:flutter/material.dart';
import '../widgets/maindrawer.dart';
// import 'package:meals_app/models/category.dart';
import './categories_screen.dart';
import './favoritesScreen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favmeal;
  TabsScreen(this.favmeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> pages;
  int selectedpageindex = 0;
  //hrer flutte rrwill provide index itsel to our function
  void selectTab(int index) {
    setState(() {
      selectedpageindex = index;
    });
  }

  @override
  void initState() {
    pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favmeal), 'title': 'Favorites'}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedpageindex]['title']),
      ), //
      //it is a widget whicfh gives us a drawer built in flutter
      drawer: MainDrawer(),
      body: pages[selectedpageindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectTab,
          backgroundColor: Theme.of(context).primaryColor,
          /*unselecteditemcolor definesx the color for unselected tab,simlar fro selected itwem
          and currentindex tells which item is aseleted to flutter ,we need to pass index to surrentindex */
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.white,
          currentIndex: selectedpageindex,
          items: [
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.category),
                // ignore: deprecated_member_use
                title: Text('Categories')),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: Icon(Icons.favorite),
                // ignore: deprecated_member_use
                title: Text('Favorites')),
          ]),
    );
  }
}
/*here defaulttabcontroller and tabBar and tabview are all connected to each other internally
 as we selects between the Tab in the TabBar flutter automatically selects beyween the the children of tabView
 the order is important they are conected in order,
 means here firsdt tab is connectednto categtoryScree( and second with FavoritesScreen()*/
