//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/8/29
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';

class NewCoffeeBeansPage extends StatefulWidget {
  const NewCoffeeBeansPage({Key? key}) : super(key: key);

  @override
  State<NewCoffeeBeansPage> createState() => _NewCoffeeBeansPageState();
}

class _NewCoffeeBeansPageState extends State<NewCoffeeBeansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        title: "咖啡豆",
        elevation: 0.1,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                BrnNormalFormGroup(
                  title: "基本信息",
                  children: [
                    BrnTextInputFormItem(
                      title: "品名",
                      isRequire: true,
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "净含量",
                      unit: "克",
                      isRequire: true,
                      onChanged: (newValue) {
                      },
                    ),
                    SizedBox(height: 8),
                    BrnMultiChoiceInputFormItem(
                      title: "类型",
                      options: ["单品", "拼配"],
                      value: [
                        "单品",
                      ],
                      tipLabel: "",
                      isRequire: false,
                      onTip: () {
                        BrnToast.show("点击触发onTip回调", context);
                      },
                      onChanged: (List<String> oldValue, List<String> newValue) {
                        BrnToast.show(
                            "点击触发onChanged回调${oldValue.length}_${newValue.length}_onChanged", context);
                      },
                    ),
                    BrnTextSelectFormItem(
                      title: "产地",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),
                    BrnTextSelectFormItem(
                      title: "工艺",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),

                    SizedBox(height: 10),
                    BrnTextSelectFormItem(
                      title: "烘焙程度",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),
                    BrnTextSelectFormItem(
                      title: "SCAA风味轮",
                      hint: "",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),
                    BrnTextSelectFormItem(
                      title: "风味描述",
                      hint: "",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                BrnExpandFormGroup(
                  title: "环境信息",
                  isExpand: false,
                  children: [
                    BrnTextInputFormItem(
                      title: "庄园/处理站",
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "产季",
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "批次",
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "等级",
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "海拔范围",
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "密度",
                      unit: '克/升',
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextInputFormItem(
                      title: "含水率",
                      unit: '%',
                      onChanged: (newValue) {
                      },
                    ),
                    BrnTextSelectFormItem(
                      title: "土质",
                      onTap: () {
                        BrnToast.show("点击触发回调_onTap", context);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 15),
                BrnTextBlockInputFormItem(
                  title: "备注",
                  minLines: 1,
                  maxLines: 5,
                  onChanged: (newValue) {
                    BrnToast.show("点击触发回调_${newValue}_onChanged", context);
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BrnBottomButtonPanel(
              mainButtonName: '保存',
              mainButtonOnTap: () {
                BrnToast.show("", context);
              },
            ),
          )
        ],
      ),
    );
  }
}
