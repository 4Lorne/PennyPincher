import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/customer_elevated_button.dart';
import 'package:flutter_application_1/widgets/nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 1);
  int currentIndex = 1; // Default selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.green[500],
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
          )
        ],
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
        CustomElevatedButtonRow(
          buttons: [
            ButtonData(
                text: "Summary",
                icon: Icons.arrow_drop_down,
                onPressed: () => {}),
            ButtonData(
                text: "Recurring Expenses",
                icon: Icons.currency_exchange_outlined,
                onPressed: () => {}),
          ],
        ),
      ]),
    );
  }
}
