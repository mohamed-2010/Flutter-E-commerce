import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myneweccomerce/config/app_router.dart';

class CoustomAppBarWidget extends StatelessWidget with PreferredSizeWidget{
  CoustomAppBarWidget({Key? key,required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(6)
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),),
      ),
      iconTheme: IconThemeData(color: Colors.black),
      actions: [
        rout == '/' ? IconButton(
          onPressed: (){
            Navigator.pushNamed(context, '/mywishes');
          },
          icon: Icon(Icons.favorite),
        ) :
            Container()
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>Size.fromHeight(50);
}
