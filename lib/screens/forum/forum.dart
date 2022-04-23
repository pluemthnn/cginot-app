import 'package:cginot_app/constants.dart';
import 'package:cginot_app/models/buttom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForumPage extends StatefulWidget {
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  static final listItemsData = [
    ListEntry("Forum 1", "test", "description 1", 54, 2, true),
    ListEntry("Forum 2", "test", "description 2", 154, 3, false),
    ListEntry("Forum 3", "test", "description 3", 971, 0, false),
    ListEntry("Forum 4", "test", "description 4", 124, 2, true),
    ListEntry("Forum 5", "test", "description 5", 412, 5, true),
    ListEntry("Forum 6", "test", "description 6", 12, 1, true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0.0,
        title: const Text("forum"),
      ),
      body: Container(
          child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(listItemsData[index]),
        itemCount: listItemsData.length,
        shrinkWrap: true,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/createpost');
        },
        backgroundColor: cNavColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}

class ListEntry {
  final String title;
  final String icon;
  final String description;
  final int views;
  final int responses;
  final bool answered;

  ListEntry(this.title, this.icon, this.description, this.views, this.responses,
      this.answered);
}

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(this.icon, this.iconText, this.selected);

  final String iconText;
  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(icon),
            onPressed: _onSearchPressed,
            color: selected == true
                ? AppColorsTheme.myTheme.primarySwatch
                : Colors.black,
          ),
          Text(iconText)
        ],
      ),
    );
  }

  static void _onSearchPressed() {}
}

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final ListEntry entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 45.75),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: AppColorsTheme.myTheme.secondaryGradientColor,
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: ListTile(
        title: Text(entry.title),
        subtitle: Text(entry.description),
        leading: Icon(
          Icons.dashboard,
          color: AppColorsTheme.myTheme.primarySwatch,
        ),
        onTap: () {
          // Navigator.pushNamed(context, '/forum/1');
        },
      ),
    );
  }
}
