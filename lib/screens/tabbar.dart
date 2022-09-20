import 'package:flutter/material.dart';

class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  static const String routeName = '/tabbar-screen';

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen> {
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

  static const _kTabPages = <Widget>[
    _TempPages(appBartitle: 'Home', centerText: 'HomeScreen'),
    _TempPages(appBartitle: 'Shop', centerText: 'ShopScreen'),
    _TempPages(appBartitle: 'Bag', centerText: 'BagScreen'),
    _TempPages(appBartitle: 'Favorites', centerText: 'FavoritesScreen'),
    _TempPages(appBartitle: 'Profile', centerText: 'ProfileScreen'),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _kTabPages[index],
      bottomNavigationBar: Container(
        height: 60.0,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 1;
                });
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              icon: const Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 3;
                });
              },
              icon: const Icon(
                Icons.favorite_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  index = 4;
                });
              },
              icon: const Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
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
