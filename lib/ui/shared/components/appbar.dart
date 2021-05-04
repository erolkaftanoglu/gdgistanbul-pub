import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GDGAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size screenSize;
  const GDGAppBar(this.screenSize, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return Container(
        color: Colors.blue,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text('GDG Istanbul Logo'),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Discover',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return AppBar(
        title: Text("GDG Istanbul"),
      );
    }
  }

  @override
  Size get preferredSize =>
      kIsWeb ? const Size.fromHeight(100) : const Size.fromHeight(50);
}
