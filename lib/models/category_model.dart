import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  Category({
   required this.name,
   required this.imageUrl
});

  @override
  // TODO: implement props
  List<Object?> get props => [name,imageUrl];

  static Category fromSnapShost(DocumentSnapshot snap){
    Category category = Category(name: snap['name'], imageUrl: snap['imageUrl']);
    return category;
  }
  static List<Category> categories = [
    Category(name: "juhina", imageUrl: 'https://th.bing.com/th/id/R.ff848560aa4ca05b4d42b49c213c24bb?rik=El8AOnEKYToc7g&pid=ImgRaw&r=0'),
    Category(name: "Milk", imageUrl: 'https://th.bing.com/th/id/R.1fb437443e19d36eda7f1cfda817538b?rik=cEi9Zzhr%2f2q0dg&pid=ImgRaw&r=0'),
    Category(name: "Toned Milk", imageUrl: 'https://fonterrafuturedairy.in/images/dremery/product/large/Toned-Milk-banner.jpg')
  ];
}