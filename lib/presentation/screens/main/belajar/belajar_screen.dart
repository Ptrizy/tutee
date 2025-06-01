import 'package:flutter/material.dart';
import 'package:tutee/presentation/styles/text.dart';

class BelajarScreen extends StatelessWidget {
  const BelajarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Sedang dalam masa pengembangan^^",
        style: TextStyles.body1(),
      ),
    );
  }
}
