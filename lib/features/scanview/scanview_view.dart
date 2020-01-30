import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/data/model/choice_data.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/features/scanview/scanview_view_model.dart';
import 'package:plstka_app/utils/progress_dialog.dart';

class ScanViewView extends StatelessWidget {
  ScanViewView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScanViewViewModel>(
      distinct: true,
      converter: (store) => ScanViewViewModel.fromStore(store),
      builder: (_, viewModel) => ScanViewViewContent(
        viewModel: viewModel,
      ),
    );
  }
}

class ScanViewViewContent extends StatefulWidget {
  final ScanViewViewModel viewModel;

  ScanViewViewContent({Key key, this.viewModel}) : super(key: key);

  @override
  _ScanViewViewContentState createState() => _ScanViewViewContentState();
}

class _ScanViewViewContentState extends State<ScanViewViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _status;
  var _processBar;

  @override
  void initState() {
    super.initState();
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

  void hideProcessBar() {
    if (_processBar != null && _processBar.isShowing()) {
      _processBar.hide();
      _processBar = null;
    }
  }

  void showProcessBar(String msg) {
    if (_processBar == null) {
      _processBar = new ProgressDialog(context);
    }
    _processBar.setMessage(msg);
    _processBar.show();
  }
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Add', icon: Icons.add),
];
