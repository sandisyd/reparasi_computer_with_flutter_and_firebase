import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:repair_services_computer/home/profil_screen.dart';

import 'signUp/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List? foto;
  final user = FirebaseAuth.instance.currentUser;
  // List? navbar;
  @override
  void initState() {
    super.initState();

    foto = [
      {
        'gambar': 'computer.jpg',
        'title': 'service',
        'subtitle': 'Quick Maintenance',
        'onTap': () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DetailScreen()));
        }
      },
      {
        'gambar': 'keyboard.jpg',
        'title': 'service',
        'subtitle': 'Quick Maintenance',
        'onTap': () {}
      },
    ];
  }

  int c_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(DateFormat.yMMMMd().format(DateTime.now())),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Hello, Anonymous",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                    ImageIcon(AssetImage("img/bell.png"))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey.withOpacity(0.2),
                            filled: true,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search places...",
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 60,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: ImageIcon(AssetImage("img/filter.png")),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 20, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Preferential",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "10% Save on your next service",
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 220),
                          child: MaterialButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {},
                            child: Row(
                              children: const [
                                Text(
                                  "Recive",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Home Appliances Repair",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 20,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 400,
                  child: ListView.builder(
                      itemCount: foto!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  foto![index]['onTap']();
                                },
                                child: Container(
                                  height: 250,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(
                                          255,
                                          Random().nextInt(256),
                                          Random().nextInt(256),
                                          Random().nextInt(256)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Image(
                                    image: AssetImage(
                                        "img/${foto![index]['gambar']}"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${foto![index]['title']}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                              Text("${foto![index]['subtitle']}"),
                            ],
                          ),
                        );
                      }),
                )
                // Center(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(user!.uid),
                //       const SizedBox(
                //         height: 15,
                //       ),
                //       MaterialButton(
                //         color: Colors.blue,
                //         onPressed: () => FirebaseAuth.instance.signOut(),
                //         child: const Text(
                //           "Log Out",
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 50,
      //   child: ListView.builder(
      //       itemCount: navbar!.length,
      //       scrollDirection: Axis.horizontal,
      //       itemBuilder: (context, index) {
      //         return Padding(
      //           padding: const EdgeInsets.only(bottom: 20),
      //           child: Container(
      //               width: MediaQuery.of(context).size.width / 3,
      //               child: GestureDetector(
      //                 onTap: () {
      //                   setState(() {
      //                     c_index = index;
      //                     navbar![index]['onTap']();
      //                   });
      //                 },
      //                 child: Image(
      //                   image: AssetImage("img/${navbar![index]['gambar']}"),
      //                   color: c_index == index ? Colors.black : Colors.grey,
      //                 ),
      //               )),
      //         );
      //       }),
      // ),
    );
  }
}
