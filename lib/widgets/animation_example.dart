import 'package:flutter/material.dart';

class ImplicitAnimationExample extends StatefulWidget {
  @override
  _ImplicitAnimationExampleState createState() => _ImplicitAnimationExampleState();
}

class _ImplicitAnimationExampleState extends State<ImplicitAnimationExample> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Implicit Animation Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleExpanded,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: _isExpanded ? 200.0 : 100.0,
            height: _isExpanded ? 200.0 : 100.0,
            color: _isExpanded ? Colors.blue : Colors.red,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ImplicitAnimationExample(),
  ));
}
