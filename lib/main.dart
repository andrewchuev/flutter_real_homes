import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const RealHomes());
}

class RealHomes extends StatelessWidget {
  const RealHomes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
