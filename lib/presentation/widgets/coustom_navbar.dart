import 'package:flutter/material.dart';
import 'package:myneweccomerce/config/app_router.dart';

class CoustomNavBar extends StatelessWidget {
  const CoustomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){
                if (rout != '/'){
                  Navigator.pushNamed(context, '/');
                }else{
                  
                }
              },
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cart');
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/profile');
              },
              icon: Icon(Icons.person),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
