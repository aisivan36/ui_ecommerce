import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  static const String routeName = '/tabbar-screen';

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
  static const _kTabPages = <Widget>[
    _TempPages(appBartitle: 'Home', centerText: 'HomeScreen'),
    _TempPages(appBartitle: 'Shop', centerText: 'ShopScreen'),
    _TempPages(appBartitle: 'Bag', centerText: 'BagScreen'),
    _TempPages(appBartitle: 'Favorites', centerText: 'FavoritesScreen'),
    _TempPages(appBartitle: 'Profile', centerText: 'ProfileScreen'),
  ];

  int index = 0;

  static const bottomNav = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Shop'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_bag_outlined), label: 'Bag'),
    BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border_outlined), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extent the body to make it more realistic
      extendBody: true,
      body: _kTabPages[index],
      bottomNavigationBar: Container(
        // color: Colors.amber,
        // padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          // color: Colors.amber,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 21,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
          child: BottomNavigationBar(
            items: bottomNav,
            currentIndex: index,
            elevation: 8.0,
            backgroundColor: const Color(0xff1d1f27),
            // backgroundColor: Colors.black,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

class _TempPages extends StatelessWidget {
  const _TempPages(
      {super.key, required this.appBartitle, required this.centerText});

  final String appBartitle, centerText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBartitle),
      ),
      body: Center(child: Text(centerText)),
    );
  }
}
