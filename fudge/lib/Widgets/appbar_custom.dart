import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title: '',
    this.height = kToolbarHeight,
    required this.color,
  });
  final String title;
  final double height;
  final Color color;

  //final GlobalKey<ScaffoldState> globalKey;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: widget.color,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontSize: 17.0),
        ),
        actions: <Widget>[
          //-----Notification-Bell------------------
          Container(
              margin: EdgeInsets.only(right: 0.0),
              child: IconButton(
                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {},
              )),
        ],
      ),
    );
  }
}
