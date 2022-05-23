import 'package:flutter/material.dart';
import 'package:repair_services_computer/home/home_screen.dart';
import 'package:repair_services_computer/home/list_screen.dart';
import 'package:repair_services_computer/home/profil_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({this.iniTab, Key? key}) : super(key: key);
  final int? iniTab;

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  // List? navbar;

  int c_index = 0;

  int _selectNavbar = 0;

  void _selectedMenu(int index) {
    setState(() {
      _selectNavbar = index;
    });
  }

  List? page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = [HomeScreen(), const ListScreen(), ProfilScreen()];
    _selectNavbar = widget.iniTab ?? 0;
  }

  var navbar = [
    {
      'gambar': 'home.png',
    },
    {
      'gambar': 'clipboard.png',
    },
    {
      'gambar': 'user.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page![_selectNavbar],
      bottomNavigationBar: Container(
        height: 50,
        child: ListView.builder(
            itemCount: navbar.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          c_index = index;
                          _selectNavbar = index;
                        });
                      },
                      child: Image(
                        image: AssetImage("img/${navbar[index]['gambar']}"),
                        color: c_index == index ? Colors.black : Colors.grey,
                      ),
                    )),
              );
            }),
      ),
    );
  }
}
