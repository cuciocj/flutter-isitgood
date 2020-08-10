import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 24);

    return new Scaffold(
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search results goes here...'),
            sizedBox,
            OutlineButton.icon(
              label: Text('Back to home'),
              icon: Icon(Icons.arrow_back),
              highlightedBorderColor: Theme.of(context).colorScheme
                .onSurface.withOpacity(0.12),
              onPressed: () => Navigator.pushNamed(context, "/"),
            )
          ],
        ),
      ),
    );
  }
}
