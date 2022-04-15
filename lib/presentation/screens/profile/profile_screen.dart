import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CoustomAppBarWidget(title: "Profile"),
      bottomNavigationBar: CoustomNavBar(),
    );
  }
}
