import 'package:flutter/material.dart';
import '../../constant/sizes.dart';
import '../../utils/static.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.appBarHeight,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: customAppbar("FAQ")),
        ],
      ),
    );
  }
}
