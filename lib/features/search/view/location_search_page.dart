import 'package:flutter/material.dart';

import 'location_search_view.dart';

class LocationSearchPage extends StatelessWidget {
  const LocationSearchPage({Key? key}) : super(key: key);

  static Route<String> route() {
    return MaterialPageRoute(builder: (_) => const LocationSearchPage());
  }

  @override
  Widget build(BuildContext context) {
    return const LocationSearchView();
  }
}
