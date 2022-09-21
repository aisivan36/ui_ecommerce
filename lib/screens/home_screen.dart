import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Stack(
            // alignment: Alignment.topCenter,
            children: [
              Image.asset(
                'assets/images/home.jpg',
                height: 628,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                top: 370,
                child: Opacity(
                  opacity: 0.6,
                  child: Container(
                    // width: 50.0,
                    height: 180.0,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: <Color>[
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.black,
                          Colors.transparent,
                          Colors.transparent,
                        ],
                        stops: [
                          0,
                          0.1,
                          0.2,
                          0.3,
                          0.8,
                          1,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 370,
                left: 15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 125,
                      width: 220,
                      // color: Colors.amber,
                      child: Text(
                        'Fashions Sale',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,

                        // softWrap: true,
                        textScaleFactor: 0.89,
                        style: TextStyle(
                          letterSpacing: 0.23,
                          fontWeight: FontWeight.w900,
                          fontSize: 48,
                        ),
                      ),
                    ),
                    TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              horizontal: 65,
                              vertical: 10,
                            ),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {},
                      child: const Text(
                        'Check',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (kDebugMode) print('ViewAll');
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(fontSize: 11),
                      ),
                    )
                  ],
                ),
                const Text(
                  "You've never seen it before!",
                  style: TextStyle(
                    color: Color(0xffabb4bd),
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  // color: Colors.amber,
                  height: 277,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        // color: Colors.red,
                        width: 150,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: Image.asset(
                                'assets/images/image1.jpg',
                                fit: BoxFit.cover,
                                height: 183,
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: 25,
                                width: 39,
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.only(top: 4.5),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  '-20%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: "Metropolis",
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 189,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 17,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        '(10)',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xffabb4bd),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  const Text(
                                    "Dorothy Perkins",
                                    style: TextStyle(
                                      color: Color(0xffabb4bd),
                                      fontSize: 11,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    "Evening Dress",
                                    style: TextStyle(
                                      color: Color(0xfff6f6f6),
                                      fontSize: 16,
                                      fontFamily: "Metropolis",
                                      fontWeight: FontWeight.w600,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: const [
                                      Text(
                                        "15\$",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                          fontFamily: "Metropolis",
                                          fontWeight: FontWeight.w500,
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        "12\$",
                                        style: TextStyle(
                                          color: Color(0xffff3d3d),
                                          fontSize: 14,
                                          fontFamily: "Metropolis",
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
