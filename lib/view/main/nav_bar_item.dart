
import 'package:asset_management/core/res/colors.dart';
import 'package:asset_management/core/res/styles.dart';
import 'package:asset_management/view/change_pwd/change_pwd_page.dart';
import 'package:asset_management/view/forgot_pwd/forgot_pwd_page.dart';
import 'package:asset_management/view/login/login_page.dart';
import 'package:asset_management/view/register/register_page.dart';
import 'package:asset_management/widgets/button.dart';
import 'package:asset_management/widgets/edit_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';


import 'assets/asset_page.dart';
import 'employee/employee_page.dart';
import 'main_layout_viewmodel.dart';

//
// class MainPage extends ViewModelBuilderWidget<MainPageViewModel>{
//
//   int index;
//   MainPage(this.index);
//
//   @override
//   void onViewModelReady(MainPageViewModel viewModel) {
//     viewModel.init(index);
//     super.onViewModelReady(viewModel);
//   }
//
//   @override
//   Widget builder(BuildContext context, MainPageViewModel viewModel, Widget? child) {
//     return Scaffold(
//       backgroundColor: AppColor.background,
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
//           // child: IndexedStack(
//           //   index: viewModel.index,
//           //   children: [
//           //   Text("welcome"),
//           //   Text("welcome"),
//           //   EmployeePage()
//           // ],),
//         ),
//       ),
//     );
//   }
//
//   @override
//   MainPageViewModel viewModelBuilder(BuildContext context) => MainPageViewModel();
// }
//
//



class NavBarItem extends StatefulWidget {
   String text;
  IconData iconData;
  Function() tap;
  int position;
  int selectPos;

  NavBarItem({
    required this.text,required this.iconData,required this.tap,required this.selectPos,required this.position
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {

  Color selected =AppColor.primary;
  Color notSelected = AppColor.nav;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // onEnter: (value) {
      //   setState(() {
      //     color = selected;
      //     boxDecoration = BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)));
      //
      //   });
      // },
      // onExit: (value) {
      //   setState(() {
      //     color = notSelected;
      //       boxDecoration = BoxDecoration(border: Border(bottom: BorderSide.none));
      //
      //   });
      // },
      // onHover: (value){
      //   setState(() {
      //    color = selected;
      //     boxDecoration = BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)));
      //
      //   });
      // },
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
           setState(() {
             widget.tap();
           });
          },
          child: Container(
            decoration: widget.position == widget.selectPos ? BoxDecoration(border: Border(bottom: BorderSide(color:selected,width: 2)))
                : BoxDecoration(border: Border(bottom: BorderSide.none)),
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(0, 0, 18.5, 13),
            child: Row(
              children: [
                Icon(widget.iconData,color: widget.position == widget.selectPos ? selected : notSelected),
                SizedBox(width: 8.5,),
                Text(widget.text,style: AppTextStyle.body1SemiBold.copyWith(
                    fontSize: 16,color:widget.position == widget.selectPos ? selected:notSelected)),
              ],
            ),

          ),
        ),
      ),
    );
  }
}



