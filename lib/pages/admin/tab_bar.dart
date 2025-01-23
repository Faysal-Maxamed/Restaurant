import 'package:flutter/material.dart';
import 'package:resturent_app/pages/admin/adminfoodpage.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    text: "Foods",
                  ),
                  Tab(
                    text: "Fruits",
                  ),
                  Tab(
                    text: "Pidzza",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Tab(
                    child: Adminfoodpage(),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
