import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecomended;
  final bool isPopular;

  const Product({
    this.id,
   required this.name,
   required this.category,
   required this.imageUrl,
   required this.price,
   required this.isPopular,
    required this.isRecomended
});

  @override
  // TODO: implement props
  List<Object?> get props => [name,category,imageUrl,price,isPopular,isRecomended];
  static Product fromSnapShoutProduct(DocumentSnapshot snap){
    Product product = Product(name: snap['name'], category: snap['category'], imageUrl: snap['imageUrl'], price: snap['price'], isPopular: snap['isPopular'], isRecomended: snap['isRecommended']);
    return product;
  }
  static List<Product> products = [
    const Product(
        name: 'Juhina',
        category: "juhina",
        imageUrl: "https://th.bing.com/th/id/R.ff848560aa4ca05b4d42b49c213c24bb?rik=El8AOnEKYToc7g&pid=ImgRaw&r=0",
        price: 20.03,
        isRecomended: true,
        isPopular: false
    ),
    const Product(
        name: 'Juhina1',
        category: "juhina",
        imageUrl: "https://fonterrafuturedairy.in/images/dremery/product/large/Toned-Milk-banner.jpg",
        price: 20.03,
        isRecomended: false,
        isPopular: true
    ),
    const Product(
        name: 'Juhina2',
        category: "Milk",
        imageUrl: "https://th.bing.com/th/id/R.1fb437443e19d36eda7f1cfda817538b?rik=cEi9Zzhr%2f2q0dg&pid=ImgRaw&r=0",
        price: 20.03,
        isRecomended: true,
        isPopular: false
    ),
    const Product(
        name: 'Juhina3',
        category: "Milk",
        imageUrl: "https://fonterrafuturedairy.in/images/dremery/product/large/cheese.jpg",
        price: 20.03,
        isRecomended: true,
        isPopular: false
    ),
    const Product(
        name: 'Juhina4',
        category: "Toned Milk",
        imageUrl: "https://th.bing.com/th/id/R.ff848560aa4ca05b4d42b49c213c24bb?rik=El8AOnEKYToc7g&pid=ImgRaw&r=0",
        price: 20.03,
        isRecomended: false,
        isPopular: true
    ),
    const Product(
        name: 'Juhina5',
        category: "Toned Milk",
        imageUrl: "https://th.bing.com/th/id/R.ff848560aa4ca05b4d42b49c213c24bb?rik=El8AOnEKYToc7g&pid=ImgRaw&r=0",
        price: 20.03,
        isRecomended: false,
        isPopular: true
    ),
  ];

}