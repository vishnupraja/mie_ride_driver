import 'package:flutter/material.dart';
import '../../constant/sizes.dart';
import '../../utils/static.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({super.key});

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.appBarHeight,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: customAppbar("Terms and\nconditions")),
        ],
      ),
    );
  }
}
