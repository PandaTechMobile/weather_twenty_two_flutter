import 'package:flutter/material.dart';

class LocationSearchView extends StatefulWidget {
  const LocationSearchView({Key? key}) : super(key: key);

  @override
  State<LocationSearchView> createState() => _LocationSearchViewState();
}

class _LocationSearchViewState extends State<LocationSearchView> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void initState() {
    _textController.text = "Newcastle, AU";
    return super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                enabled: false,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Newcastle, AU',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('searchPage_search_iconButton'),
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.of(context).pop(_text),
          )
        ],
      ),
    );
  }
}
