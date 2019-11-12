//import 'dart:async';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:plstka_app/data/model/contactusmodel_data.dart';
//import 'package:flutter_redux/flutter_redux.dart';
//import 'package:plstka_app/redux/app/app_state.dart';
//import 'package:plstka_app/redux/action_report.dart';
//
//import 'contactus_view_model.dart';
//
//class ContactUsView extends StatelessWidget {
//  ContactUsView({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return StoreConnector<AppState, ContactUsViewModel>(
//      distinct: true,
//      converter: (store) => ContactUsViewModel.fromStore(store),
//      builder: (_, viewModel) => ContactUsViewContent(
//        viewModel: viewModel,
//      ),
//    );
//  }
//}
//
//class ContactUsViewContent extends StatefulWidget {
//  final ContactUsViewModel viewModel;
//
//  ContactUsViewContent({Key key, this.viewModel}) : super(key: key);
//
//  @override
//  _ContactUsViewContentState createState() => _ContactUsViewContentState();
//}
//
//class _ContactUsViewContentState extends State<ContactUsViewContent> {
//  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
//      GlobalKey<RefreshIndicatorState>();
//  final TrackingScrollController _scrollController = TrackingScrollController();
//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  void initState() {
//    super.initState();
//    if (this.widget.viewModel.contactusmodels.length == 0) {
//      this.widget.viewModel.getContactUsModels(true);
//    }
//  }
//
//  @override
//  void didUpdateWidget(ContactUsViewContent oldWidget) {
//    super.didUpdateWidget(oldWidget);
//    Future.delayed(Duration.zero, () {});
//  }
//
//  void showError(String error) {
//    final snackBar = SnackBar(content: Text(error));
//    _scaffoldKey.currentState.showSnackBar(snackBar);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var widget;
//
//    widget = NotificationListener(
//        onNotification: _onNotification,
//        child: RefreshIndicator(
//          key: _refreshIndicatorKey,
//          onRefresh: _handleRefresh,
//          child: ListView.builder(
//            controller: _scrollController,
//            physics: const AlwaysScrollableScrollPhysics(),
//            itemCount: this.widget.viewModel.contactusmodels.length + 1,
//            itemBuilder: (_, int index) => _createItem(context, index),
//          ),
//        ));
//    return Scaffold(
//      key: _scaffoldKey,
//      appBar: AppBar(
//        title: Text("ContactUsView"),
//      ),
//      body: widget,
//    );
//  }
//
//  bool _onNotification(ScrollNotification notification) {
//    if (notification is ScrollUpdateNotification) {
//      if (_scrollController.mostRecentlyUpdatedPosition.maxScrollExtent >
//              _scrollController.offset &&
//          _scrollController.mostRecentlyUpdatedPosition.maxScrollExtent -
//                  _scrollController.offset <=
//              50) {
//        // load more
//        if (this.widget.viewModel.getContactUsModelsReport?.status ==
//                ActionStatus.complete ||
//            this.widget.viewModel.getContactUsModelsReport?.status ==
//                ActionStatus.error) {
//          // have next page
//          _loadMoreData();
//          setState(() {});
//        } else {}
//      }
//    }
//
//    return true;
//  }
//
//  Future<Null> _loadMoreData() {
//    widget.viewModel.getContactUsModels(false);
//    return null;
//  }
//
//  Future<Null> _handleRefresh() async {
//    _refreshIndicatorKey.currentState.show();
//    widget.viewModel.getContactUsModels(true);
//    return null;
//  }
//
//  _createItem(BuildContext context, int index) {
//    if (index < this.widget.viewModel.contactusmodels?.length) {
//      return Container(
//          child: _ContactUsModelListItem(
//            contactusmodel: this.widget.viewModel.contactusmodels[index],
//            onTap: () {
//              //Navigator.push(
//              //  context,
//              //  MaterialPageRoute(
//              //    builder: (context) =>
//              //        ViewContactUsModel(contactusmodel: this.widget.viewModel.contactusmodels[index]),
//              //  ),
//              //);
//            },
//          ),
//          decoration: BoxDecoration(
//              border: Border(
//                  bottom: BorderSide(color: Theme.of(context).dividerColor))));
//    }
//
//    return Container(
//      height: 44.0,
//      child: Center(
//        child: _getLoadMoreWidget(),
//      ),
//    );
//  }
//
//  Widget _getLoadMoreWidget() {
//    if (this.widget.viewModel.getContactUsModelsReport?.status ==
//        ActionStatus.running) {
//      return Padding(
//          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
//          child: CircularProgressIndicator());
//    } else {
//      return SizedBox();
//    }
//  }
//}
//
//class _ContactUsModelListItem extends ListTile {
//  _ContactUsModelListItem(
//      {ContactUsModel contactusmodel, GestureTapCallback onTap})
//      : super(
//            title: Text("Title"),
//            subtitle: Text("Subtitle"),
//            leading: CircleAvatar(child: Text("T")),
//            onTap: onTap);
//}
