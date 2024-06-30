import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';
import '../widgets/calendar_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 1);
  int currentIndex = 1; // Default selected index

  @override // Hides the status bar
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800], // BG
        elevation: 0,
        toolbarHeight: 90,

        flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: EdgeInsets.zero,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    padding: const EdgeInsets.only(right: 25),
                    icon: const Icon(Icons.calendar_month),
                    iconSize: 32,
                    color: Colors.white,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            const CalendarDialog(),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, 5), // changes position of shadow
                )
              ],
            ),
            height: 4.0,
          ),
        ),
      ),
      body: Stack(alignment: Alignment.bottomCenter, children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index; // Update the currentIndex on swipe
            });
          },
          children: const [
            Center(
              child: Text('Budget'),
            ),
            Center(
              child: Text('Home'),
            ),
            Center(
              child: Text('Settings'),
            ),
          ],
        ),
        NavBar(
          //Navigation bar on the bottom
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index; // Update the currentIndex on tap
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            });
          },
        ),
      ]),
    );
  }
}
