import 'package:flutter/material.dart';
import 'package:meals_app/widgets/maindrawer.dart';

// ignore: must_be_immutable
class FilttersScreen extends StatefulWidget {
  static const routeName = '/filtters';
  final Function setfill;
  Map<String, bool> currentFilters;
  FilttersScreen(this.currentFilters, this.setfill);

  @override
  _FilttersScreenState createState() => _FilttersScreenState();
}

class _FilttersScreenState extends State<FilttersScreen> {
  bool glutenFree = false;
  bool vegan = false;
  bool vegetarian = false;
  bool lactoosefree = false;
  initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactoosefree = widget.currentFilters['lactoose'];
    vegan = widget.currentFilters['vegan'];
    vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget fillterselect(
      String title, String subtitle, bool currentvalue, Function updatevalue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentvalue,
        onChanged: updatevalue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectFiltter = {
                    'gluten': glutenFree,
                    'lactoose': lactoosefree,
                    'vegetarian': vegetarian,
                    'vegan': vegan,
                  };
                  widget.setfill(selectFiltter);
                })
          ],
          title: Text('Filtters'),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Filtters',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  fillterselect('Gluten Free', 'Only include Guten free items',
                      glutenFree, (newvalue) {
                    setState(() {
                      glutenFree = newvalue;
                    });
                  }),
                  fillterselect(
                      'Lactoose Free',
                      'Only include Lactoose free items',
                      lactoosefree, (newvalue) {
                    setState(() {
                      lactoosefree = newvalue;
                    });
                  }),
                  fillterselect('Vegetarian', 'Only include Vegetarian  items',
                      vegetarian, (newvalue) {
                    setState(() {
                      vegetarian = newvalue;
                    });
                  }),
                  fillterselect('Vegan', 'Only incudes Vegan items', vegan,
                      (newvalue) {
                    setState(() {
                      vegan = newvalue;
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
