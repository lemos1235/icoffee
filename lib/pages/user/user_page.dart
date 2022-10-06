//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/22
//
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:icoffee/app_routes.dart';
import 'package:icoffee/constants/app_colors.dart';
import 'package:icoffee/widgets/gf_action_tile.dart';

/// "我"页
class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _header(),
        _vipRow(),
        SizedBox(height: 12),
        _toolsRow(),
      ],
    );
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoutes.userDetail);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "匿名用户",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "编辑个人信息",
                      style: TextStyle(color: AppColors.deactivatedText),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                      color: Colors.grey,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _vipRow() {
    return Column(
      children: [
        GFActionCard(
          children: [
            GFActionTile(
              title: "我的会员",
              trailingText: "未开通",
              onTap: () {},
            ),
            GFActionTile(
              title: "帮助与反馈",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }

  Widget _toolsRow() {
    return Column(
      children: [
        GFActionCard(
          children: [
            GFActionTile(
              title: "智能电子秤",
              onTap: () {},
            ),
            GFActionTile(
              title: "金杯萃取计算器",
              onTap: () {},
            ),
            GFActionTile(
              title: "扫一扫",
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}
