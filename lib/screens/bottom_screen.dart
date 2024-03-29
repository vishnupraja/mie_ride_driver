import 'package:flutter/material.dart';

class BottomNavigationBarWithCards extends StatefulWidget {
  @override
  _BottomNavigationBarWithCardsState createState() =>
      _BottomNavigationBarWithCardsState();
}

class _BottomNavigationBarWithCardsState
    extends State<BottomNavigationBarWithCards> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CardPage(icon: Icons.home, title: 'Home'),
    CardPage(icon: Icons.business, title: 'Business'),
    CardPage(icon: Icons.school, title: 'School'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation Bar with Cards'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}




class CardPage extends StatelessWidget {
  final IconData icon;
  final String title;

   CardPage({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 100),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}