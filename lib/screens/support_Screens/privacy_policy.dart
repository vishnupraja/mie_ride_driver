import 'package:flutter/material.dart';
import '../../constant/sizes.dart';
import '../../utils/static.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: TSizes.appBarHeight,),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: customAppbar("Privacy policy")),
        ],
      ),
    );
  }
}
