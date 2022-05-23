import 'package:flutter/material.dart';

class DetailOrder extends StatelessWidget {
  const DetailOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services Computer",
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontWeight: FontWeight.w600),
            ),
            const ListTile(
              contentPadding: EdgeInsets.only(left: 0),
              leading: Text(
                "Service",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              trailing: ImageIcon(AssetImage("img/technical-support.png")),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text(
                        "Description",
                        style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      ),
                      trailing: const Text(
                        "Reinstall Windows",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      title: Text(
                        "Estimated",
                        style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                      ),
                      trailing: const Text(
                        "\$79",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Service Evaluation",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              height: 270,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      width: 1, color: Colors.grey.withOpacity(0.2))),
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: const [
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      leading: ImageIcon(AssetImage("img/calendar.png")),
                      title: Text(
                        "Requested Time",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text("May 12th, 00.00 - 00.00 PM"),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      leading: ImageIcon(AssetImage("img/placeholder.png")),
                      title: Text(
                        "Location",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "Jakarta",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      leading: ImageIcon(AssetImage("img/telephone.png")),
                      title: Text(
                        "Contact Details",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        "+62 812345678",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              // boxShadow: [
              //   BoxShadow(
              //       color: Colors.black.withOpacity(0.4),
              //       offset: Offset(1, 1),
              //       blurRadius: 1)
              // ],
              ),
          // width: 40,
          child: Row(
            children: [
              Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(15),
                    // color: Colors.amber
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ImageIcon(
                      AssetImage("img/messenger.png"),
                      // size: 40,
                    ),
                  )),
              const SizedBox(
                width: 15,
              ),
              Container(
                  height: 60,
                  width: 260,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Colors.grey.withOpacity(0.4)),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black),
                  child: Padding(
                    padding: EdgeInsets.all(13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ImageIcon(
                          AssetImage("img/phone-call.png"),
                          color: Colors.white,
                          // size: 40,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Contact",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
