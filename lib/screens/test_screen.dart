
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  bool isPersonalSelected = true;

  void _onPersonalButtonClick() {
    setState(() {
      isPersonalSelected = true;
    });
  }

  void _onCompanyButtonClick() {
    setState(() {
      isPersonalSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Column(
         children: [
           SizedBox(
             height: 100,
             child: Stack(
               children: [
                 AnimatedPositioned(
                   duration: Duration(milliseconds: 500),
                   curve: Curves.easeInOut,
                   left: isPersonalSelected ? 20 : MediaQuery.of(context).size.width / 2 + 10,
                   top: 10,
                   child: AnimatedContainer(
                     duration: Duration(milliseconds: 500),
                     curve: Curves.easeInOut,
                     height: 50,
                     width: MediaQuery.of(context).size.width / 2 - 30,
                     decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(25),
                     ),
                   ),
                 ),
                 Row(
                   children: [
                     Expanded(
                       child: Center(
                         child: ElevatedButton(
                           onPressed: _onPersonalButtonClick,
                           child: Text('Personal Details'),
                         ),
                       ),
                     ),
                     Expanded(
                       child: Center(
                         child: ElevatedButton(
                           onPressed: _onCompanyButtonClick,
                           child: Text('Company Details'),
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),
           ),
           Expanded(
             child: Container(
               color: Colors.grey[200],
               child: Center(
                 child: isPersonalSelected
                     ? Text('Personal Details Content')
                     : Text('Company Details Content'),
               ),
             ),
           ),
         ],
       ),
     )
    );
  }
}
