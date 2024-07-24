import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getBuildVersion] action in HomePage widget.
  String? deviceBuildVersion;
  // Stores action output result for [Custom Action - queryUserCustomFirebase] action in HomePage widget.
  String? firebaseBuildVersion;
  // Stores action output result for [Custom Action - getDeviceContractPhoneNumber] action in HomePage widget.
  List<String>? contactsNameList;
  // Stores action output result for [Custom Action - getDeviceContractPhoneNumber] action in HomePage widget.
  List<String>? contactsNumberList;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
