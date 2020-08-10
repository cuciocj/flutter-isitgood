import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchForm(),
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({Key key}) : super(key: key);

  @override
  SearchFormState createState() => SearchFormState();
}

class SearchFormState extends State<SearchForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String searchQuery = '';

  void _handleSubmit() {
    if(_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // handle search logic

    } else {
      searchQuery = '';
    }
    print('submit: $searchQuery');
  }

  String _validateSearch(String value) {
    print('validate: $value');
    return value.isEmpty ? 'Movie or tv title is required' : null;
  }

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 24);

    return new Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Scrollbar(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Is it Good?',
                    style: GoogleFonts.comingSoon(fontSize: 30),
                  ),
                  sizedBox,
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      hintText: 'Search for a movie or tv series name',
                      isDense: true,
                    ),
                    maxLines: 1,
                    validator: (value) => _validateSearch(value),
                    onSaved: (value) {
                      searchQuery = value;
                    },
                  ),
                  sizedBox,
                  OutlineButton.icon(
                    label: Text('Search'),
                    icon: Icon(Icons.search),
                    highlightedBorderColor:
                        Theme.of(context).colorScheme.onSurface.withOpacity(0.12),
                    onPressed: () => _handleSubmit(),
                  )
                ],
              ),
            )
          )
        ),
      )
    );
  }
}