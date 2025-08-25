import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? backBtn;
  final List<Widget>? actionBtn;
  final Widget? titleWidget;
  final String? title;
  final bool homeMode;
  final bool centerTitle;
  const CustomAppBar(
      {Key? key,
      this.backBtn,
      this.actionBtn,
      this.title,
      this.titleWidget,
      this.homeMode = false,
      this.centerTitle = false})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(65);
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          if (widget.titleWidget == null && widget.title != null) ...[
            AppBar(
              automaticallyImplyLeading: true,
              centerTitle: true,
              elevation: 0,
              title: Container(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  widget.title!,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
          AppBar(
            automaticallyImplyLeading: true,
            centerTitle: widget.centerTitle,
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            title: widget.titleWidget,

            actions: widget.actionBtn,
            elevation: 1,
            toolbarHeight: 80,
          ),
        ],
      ),
    );

  }
}

AppBar simpleAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: primaryColor,
    centerTitle: true,
    leading: null,
    title: Center(child: Image.asset('assets/logo.png', height: 50)),
  );
}
