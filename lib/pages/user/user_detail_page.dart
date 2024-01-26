//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icoffee2/gf/gf_action_tile.dart';
import 'package:icoffee2/gf/gf_menu_card.dart';

/// "我-编辑资料"页
class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  bool isLoading = false;

  @override
  void initState() {
    getUserDetail();
    super.initState();
  }

  Future<void> getUserDetail() async {
    isLoading = true;
    Future.delayed(Duration(seconds: 1)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        title: "编辑资料",
        elevation: 0.1,
      ),
      body: isLoading
          ? BrnPageLoading()
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 20),
                        child: Material(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
                          child: AnimatedContainer(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            duration: kThemeChangeDuration,
                            child: SvgPicture.asset(
                              "assets/icons/coffee.svg",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      GFMenuCard(
                        children: [
                          BrnTextInputFormItem(
                            title: "昵称",
                            hint: "请输入",
                          ),
                          GFActionTile(
                            title: "性别",
                            trailingText: "保密",
                            onTap: () {
                              showGenderSheet();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BrnBottomButtonPanel(
                    mainButtonName: '保存',
                    mainButtonOnTap: () {
                      BrnToast.show("保存成功", context);
                    },
                  ),
                ),
              ],
            ),
    );
  }

  void showGenderSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BrnCommonActionSheet(
            actions: [
              BrnCommonActionSheetItem("男"),
              BrnCommonActionSheetItem("女"),
              BrnCommonActionSheetItem("保密"),
            ],
            cancelTitle: "取消",
            clickCallBack: (int index, BrnCommonActionSheetItem actionEle) {
              String title = actionEle.title;
              print(title);
            },
          );
        });
  }
}
