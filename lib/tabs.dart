// import 'package:flutter/material.dart';
// // import 'package:meals_app/models/category.dart';
// import './categories_screen.dart';
// import './favoritesScreen.dart';

// class TabsScreen extends StatefulWidget {
//   @override
//   _TabsScreenState createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       //it preselects the index (whixch page to show corresponding to index)
//       initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(
//             tabs: [
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categories',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favoritet',
//               )
//             ],
//           ),
//         ),
//         body: TabBarView(children: [
//           CategoryScreen(),
//           FavoritesScreen(),
//         ]),
//       ),
//     );
//   }
// }
// /*here defaulttabcontroller and tabBar and tabview are all connected to each other internally
//  as we selects between the Tab in the TabBar flutter automatically selects beyween the the children of tabView
//  the order is important they are conected in order,
//  means here firsdt tab is connectednto categtoryScree( and second with FavoritesScreen()*/
