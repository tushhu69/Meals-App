import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggle;
  final Function isfav;
  MealDetailScreen(this.toggle, this.isfav);
  Widget selecttitle(BuildContext ctx, String text) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,

          // ignore: deprecated_member_use
          style: Theme.of(ctx).textTheme.headline6,
        ));
  }

  Widget buildcontainer(Widget childd) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black87)),
      height: 200,
      width: 300,
      child: childd,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    //here firstwhere stop when it finds the fisrt maching element ,it only gives one result
    final selectedid =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedid.title}')),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                selectedid.imageUrl,
                fit: BoxFit.cover,
              )),
          selecttitle(context, 'Ingredients'),
          buildcontainer(ListView.builder(
            itemBuilder: (ctx, index) => Card(
              color: Theme.of(context).accentColor,
              child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Text(selectedid.ingredients[index])),
            ),
            itemCount: selectedid.ingredients.length,
          )),
          selecttitle(context, 'Steps'),
          buildcontainer(ListView.builder(
            itemBuilder: (ctx, index) => Column(children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text(selectedid.steps[index]),
              ),
              Divider(),
            ]),
            itemCount: selectedid.steps.length,
          ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggle(mealId),
        /*here pop(mealId) send meadlId to the page we are comming from, it sends it back */
      ),
    );
  }
}
/*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () => Navigator.of(context).pop(
            mealId), /*here pop(mealId) send meadlId to the page we are comming from, it sends it back */ */
