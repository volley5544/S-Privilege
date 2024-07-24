import '/flutter_flow/flutter_flow_util.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for IDcard widget.
  FocusNode? iDcardFocusNode;
  TextEditingController? iDcardTextController;
  String? Function(BuildContext, String?)? iDcardTextControllerValidator;
  String? _iDcardTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '6opikl67' /* Field is required */,
      );
    }

    if (val.length < 12) {
      return FFLocalizations.of(context).getText(
        'aq3v8iu1' /* Please enter 12 characters */,
      );
    }
    if (val.length > 12) {
      return FFLocalizations.of(context).getText(
        '7f50fpiv' /* Please enter 12 characters */,
      );
    }

    return null;
  }

  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? _emailAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'd1gnnf7n' /* Field is required */,
      );
    }

    if (val.length < 10) {
      return FFLocalizations.of(context).getText(
        'g94st846' /* Please enter 10 characters */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'fjdgot2v' /* Please enter 10 characters */,
      );
    }

    return null;
  }

  // State field(s) for vehicleregistration widget.
  FocusNode? vehicleregistrationFocusNode;
  TextEditingController? vehicleregistrationTextController;
  String? Function(BuildContext, String?)?
      vehicleregistrationTextControllerValidator;
  // Stores action output result for [Custom Action - getBuildVersion] action in Button-Login widget.
  String? deviceBuildVersion;
  // Stores action output result for [Custom Action - queryUserCustomFirebase] action in Button-Login widget.
  String? firebaseBuildVersion;

  @override
  void initState(BuildContext context) {
    iDcardTextControllerValidator = _iDcardTextControllerValidator;
    emailAddressTextControllerValidator = _emailAddressTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    iDcardFocusNode?.dispose();
    iDcardTextController?.dispose();

    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    vehicleregistrationFocusNode?.dispose();
    vehicleregistrationTextController?.dispose();
  }
}
