import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/data/model/choice_data.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/features/profilescreen/profilescreen_view_model.dart';
import 'package:plstka_app/redux/app/app_state.dart';

class ProfileScreenView extends StatelessWidget {
  ProfileScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProfileScreenViewModel>(
      distinct: true,
      converter: (store) => ProfileScreenViewModel.fromStore(store),
      builder: (_, viewModel) => ProfileScreenViewContent(
        viewModel: viewModel,
      ),
    );
  }
}

class ProfileScreenViewContent extends StatefulWidget {
  final ProfileScreenViewModel viewModel;

  ProfileScreenViewContent({Key key, this.viewModel}) : super(key: key);

  @override
  _ProfileScreenViewContentState createState() =>
      _ProfileScreenViewContentState();
}

class _ProfileScreenViewContentState extends State<ProfileScreenViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(ProfileScreenViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {});
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var widget;

    widget = Text("Hello word");
    return Scaffold(
      key: _scaffoldKey,
      body: widget,
    );
  }

  List<Widget> _buildActionButton() {
    return <Widget>[
      IconButton(
        icon: Icon(choices[0].icon),
        onPressed: () {
          _select(choices[0]);
        },
      ),
    ];
  }

  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {});
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Save', icon: Icons.save),
];
