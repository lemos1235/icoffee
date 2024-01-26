//
// [Author] lg (https://github.com/lemos1235)
// [Date] 2022/9/24
//
import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:icoffee2/gf/gf_enhance_number_card.dart';

class CoffeeBeansDetailPage extends StatefulWidget {
  const CoffeeBeansDetailPage({Key? key}) : super(key: key);

  @override
  State<CoffeeBeansDetailPage> createState() => _CoffeeBeansDetailPageState();
}

class _CoffeeBeansDetailPageState extends State<CoffeeBeansDetailPage> {
  bool isLoading = false;

  @override
  void initState() {
    getBeansDetail();
    super.initState();
  }

  Future<void> getBeansDetail() async {
    isLoading = true;
    Future.delayed(const Duration(seconds: 1)).then((value) => {
          setState(() {
            isLoading = false;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BrnAppBar(
        title: isLoading ? "" : "标题",
        elevation: 0.1,
      ),
      body: isLoading
          ? const BrnPageLoading()
          : ListView(
              children: [
                GFEnhanceNumberCard(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  rowCount: 4,
                  itemChildren: [
                    GFNumberInfoItemModel(
                      number: '183',
                      lastDesc: "天",
                      title: '烘焙至今',
                    ),
                    GFNumberInfoItemModel(
                      number: '0',
                      lastDesc: "克",
                      title: '剩余',
                    ),
                    GFNumberInfoItemModel(
                      number: '2',
                      lastDesc: "次",
                      title: '总计饮用',
                    ),
                  ],
                ),
                BrnLine(),
                BrnNormalFormGroup(
                  title: "基本信息",
                  children: [
                    const ListTile(
                      title: Text("品名"),
                      trailing: Text("带"),
                    ),
                    BrnTextInputFormItem(
                      title: "净含量",
                      unit: "克",
                      isEdit: false,
                      controller: TextEditingController(text: "0"),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
