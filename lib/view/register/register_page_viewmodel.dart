import 'dart:convert';

import 'package:asset_management/services/api_request/auth_request.dart';
import 'package:asset_management/services/shared/preference_service.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vgts_plugin/form/utils/form_field_controller.dart';
import '../../core/enum/view_state.dart';
import '../../core/model/service/auth/register_auth.dart';
import '../../core/model/service/auth/verify_mail_auth.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../vgts_base_view_model.dart';
//import '../views/vgts_base_view_model.dart';




class RegisterViewModel extends VGTSBaseViewModel {


  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ScrollController regScrollController = ScrollController();

  NameFormFieldController nameController= NameFormFieldController(ValueKey("regName"),
      required: true,requiredText: "Please enter your Name");

  NameFormFieldController orgController=NameFormFieldController(ValueKey("regtOrg"),
      required: true,requiredText: "Please enter Organization Name"
  );

  EmailFormFieldController emailController = EmailFormFieldController(ValueKey("regEmail"),
      required: true,requiredText: "Please enter an Email"
  );

  PasswordFormFieldController passwordController= PasswordFormFieldController(ValueKey("regPwd"),
      required: true,requiredText: "Password field is required");


  register(BuildContext context) async {

    if(registerFormKey.currentState?.validate() != true) {
      return;
    }

    setState(ViewState.Busy);

    RegisterAuth? auth = await request<RegisterAuth>(AuthRequest.register(nameController.text, emailController.text, passwordController.text,orgController.text));
    if (auth != null) {
      Fluttertoast.showToast(msg: "Verifying Email.....");
      context.go(Routes.verification,);
    }
    setState(ViewState.Idle);

    notifyListeners();
  }

}

