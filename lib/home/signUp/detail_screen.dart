import 'package:flutter/material.dart';

import '../detail_order.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var menu = [
    {'title': 'Service'},
    {'title': 'RAM'},
    {'title': 'Monitor'},
  ];

  int a_index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber.withOpacity(0.5),
                  image: const DecorationImage(
                    image: AssetImage("img/computer.jpg"),
                    fit: BoxFit.cover,
                  )),
              child: Center(
                child: Text(
                  "Service Repair",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            offset: Offset(2, 1),
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 3)
                      ]),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "\$75 Starting price",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Select service",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  itemCount: menu.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            a_index = index;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: a_index == index
                                  ? Colors.black
                                  : Colors.grey.withOpacity(0.5)),
                          child: Center(
                            child: Text(
                              "${menu[index]['title']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: a_index == index
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(height: 30),
            const Text(
              "Service Evaluation",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  border:
                      Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.6)),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://picsum.photos/seed/picsum/200/300"),
                      backgroundColor: Colors.grey,
                    ),
                    title: const Text(
                      "Antonio",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: const [
                          ImageIcon(
                            AssetImage("img/star.png"),
                            color: Colors.amber,
                            size: 13,
                          ),
                          Text(
                            "5.0",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                    child: Text(
                      "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.black,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const DetailOrder()));
          },
          child: ListTile(
            title: const Text(
              "Order",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            trailing: RichText(
                text: const TextSpan(
                    text: "\$79",
                    style: TextStyle(color: Colors.grey),
                    children: [
                  TextSpan(
                    text: " >",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
