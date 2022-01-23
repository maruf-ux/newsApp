// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/Screen/all_news.dart';
import 'package:news/Screen/business.dart';
import 'package:news/Screen/entertainment.dart';
import 'package:news/Screen/health.dart';
import 'package:news/Screen/politics.dart';
import 'package:news/Screen/sports.dart';
import 'package:news/Screen/world.dart';
import 'package:news/other/gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'News',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xff142850), Color(0xff00909E)])),
              ),
              GradientText(
                'App',
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff142850),
                      Color(0xff00909E),
                    ]),
                style: TextStyle(fontSize: 22),
              )
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(8.0),
                primary: Colors.teal,
                textStyle: const TextStyle(fontSize: 12),
              ),
              onPressed: () {},
              child: const Text('Watch live TV'),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.lime,
            indicatorWeight: 7.0,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 18),
            labelPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              Text(
                'All News',
              ),
              Text(
                'World',
              ),
              Text(
                'Politics',
              ),
              Text(
                'Business',
              ),
              Text(
                'Heath',
              ),
              Text(
                'Entertainment',
              ),
              Text(
                'Sports',
              ),
            ],
          ),
        ),
        body: TabBarView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            AllNews(),
            World(),
            Politics(),
            Health(),
            Business(),
            Emtertainment(),
            Sports()
          ],
        ),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              backgroundColor: Colors.teal.shade200,
              indicatorColor: Colors.white70,
              labelTextStyle: MaterialStateProperty.all(
                  TextStyle(fontSize: 10, fontWeight: FontWeight.w500))),
          child: NavigationBar(
            selectedIndex: 0,
            height: 55,
            // onDestinationSelected: (index) => setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.home), label: 'Home'),
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.search), label: 'Search'),
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.bookmark), label: 'Save'),
              NavigationDestination(
                  icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
