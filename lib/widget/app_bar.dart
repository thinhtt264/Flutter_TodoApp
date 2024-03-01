import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Stack(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ])));
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}
