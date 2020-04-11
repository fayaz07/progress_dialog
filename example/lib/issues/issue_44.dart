//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:progress_dialog/progress_dialog.dart';
//
//void main() => runApp(MaterialApp(home: IndexPage()));
//
//class IndexPage extends StatefulWidget {
//  IndexPage({Key key}) : super(key: key);
//
//  @override
//  _IndexPageState createState() => _IndexPageState();
//}
//
//// AutomaticKeepAliveClientMixin, see https://blog.csdn.net/a875801/article/details/92829950
//// TickerProviderStateMixin, see https://blog.csdn.net/u011272795/article/details/82740389
//class _IndexPageState extends State<IndexPage>
//    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
////  List<Course> recommendCourses = [];
////  List<Course> freeCourses = [];
////  List<News> recommendNews = [];
//  ProgressDialog pr;
//  TabController _tabController;
//
//  @override
//  bool get wantKeepAlive => true;
//
//  @override
//  void initState() {
//    print('Index, initState');
//
//    // pr = new ProgressDialog(context, showLogs: true);
////    _tabController = TabController(length: categories.length, vsync: this);
//    _tabController = TabController(length: 3, vsync: this);
//    _updateState();
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    print('Index, dispose');
//    _tabController.dispose();
//    super.dispose();
//  }
//
//  void _updateState() async {
//    pr.show();
//    print('pr.show()');
//    var _recommendCourses = await CommonService().getRecommendCourses(3);
//    var _freeCourses = await CommonService().getfreeCourses(2);
//    var _recommendNews = await CommonService().getRecommendNews(3);
//    print('_updateState: ${_recommendCourses}');
//    setState(() {
//      print('setState: ${_recommendCourses}');
//      recommendCourses = _recommendCourses;
//      freeCourses = _freeCourses;
//      recommendNews = _recommendNews;
//      pr.hide();
//      print('pr.hide()');
//    });
//  }
////...
//}
