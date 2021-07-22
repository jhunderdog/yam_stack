import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/constants/storage.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/controller/yam_list_controller.dart';
import 'package:yam_stack/src/models/response/kakao_list_response.dart';
import 'package:yam_stack/src/models/response/yam_list_response.dart';
import 'package:yam_stack/src/modules/list/controller/list_controller.dart';
import 'package:yam_stack/src/modules/list/screen/list_screen.dart';

class ListAddScreen extends StatelessWidget {
  final ListController controller = Get.arguments;
  ListController _listController = Get.find<ListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '리스트 추가',
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "식당명",
                        style: TextStyle(
                          fontFamily: "NotoSans-Regular",
                          fontSize: 16,
                          color: color696969,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "찾는 식당이 없나요?",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: SizeConfig().screenWidth,
                    child: TypeAheadField<KakaoListModel>(
                      debounceDuration: Duration(milliseconds: 100),
                      textFieldConfiguration: TextFieldConfiguration(
                          controller: controller.restaurantNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: '식당명을 입력해주세요',
                          )),
                      suggestionsCallback:
                          KakaoListModelApi.getKakaoListModelSuggestions,
                      itemBuilder: (context, suggestion) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(suggestion.place_name!),
                            ),
                          ],
                        );
                      },
                      noItemsFoundBuilder: (context) => Container(
                        height: 100,
                        child: Center(
                          child: Text(
                            '찾는 식당이 없어요',
                            style: TextStyle(
                              fontFamily: "NotoSans-Regular",
                              fontSize: 18,
                              color: color202020,
                            ),
                          ),
                        ),
                      ),
                      onSuggestionSelected: (KakaoListModel suggestion) {
                        final chosenList = suggestion;
                        _listController.place_name.value =
                            chosenList.place_name!;
                        _listController.id = chosenList.id!;
                        _listController.category_name =
                            chosenList.category_name!;
                        _listController.category_group_code =
                            chosenList.category_group_code!;
                        _listController.category_group_name =
                            chosenList.category_group_name!;
                        _listController.phone = chosenList.phone!;
                        _listController.address_name = chosenList.address_name!;
                        _listController.road_address_name =
                            chosenList.road_address_name!;
                        _listController.x = chosenList.x!;
                        _listController.y = chosenList.y!;
                        _listController.place_url = chosenList.place_url!;
                        _listController.restaurantNameController.text =
                            chosenList.place_name!;
                        // setState(() {
                        //   _restaurantNameController.text =
                        //   chosenList.place_name!;
                        // });
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Obx(() => Text(
                          _listController.place_name.value,
                          style: TextStyle(
                            fontFamily: "NotoSans-Regular",
                            fontSize: 18,
                            color: color202020,
                          ),
                        )),
                    tileColor: colorFFFFFF,
                    leading: SvgPicture.asset("assets/icons/카테고리 이미지.svg"),
                    subtitle: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "카테고리",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              " | ",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                            Text(
                              "3.2km",
                              style: TextStyle(
                                fontFamily: "NotoSans-Regular",
                                fontSize: 14,
                                color: colorD9D9D9,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "먹고싶은음식",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  Container(
                    width: SizeConfig().screenWidth,
                    // child: Tags(
                    //   textField: TagsTextField(
                    //       autofocus: false,
                    //       width: SizeConfig().screenWidth,
                    //       hintText: "음식을 입력해주세요",
                    //       textStyle: TextStyle(fontSize: 14),
                    //       onSubmitted: (string) {
                    //         setState(() {
                    //           _foodtags.add(string);
                    //           print(_foodtags);
                    //         });
                    //       }),
                    // ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //_foodtags != null
                  //     ? Tags(
                  //   heightHorizontalScroll: 36,
                  //   horizontalScroll: true,
                  //   itemCount: _foodtags.length,
                  //   itemBuilder: (index) => ItemTags(
                  //     index: index,
                  //     title: _foodtags[index],
                  //     textActiveColor: color696969,
                  //     pressEnabled: false,
                  //     borderRadius: BorderRadius.circular(15),
                  //     elevation: 0,
                  //     activeColor: colorD9D9D9,
                  //     removeButton: ItemTagsRemoveButton(onRemoved: () {
                  //       setState(() {
                  //         _foodtags.removeAt(index);
                  //       });
                  //       return true;
                  //     }),
                  //   ),
                  // )
                  //: Container(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "메모",
                    style: TextStyle(
                      fontFamily: "NotoSans-Regular",
                      fontSize: 16,
                      color: color696969,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextField(
                      textAlign: TextAlign.start,
                      controller: controller.memoController,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 20.0),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "태그",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 16,
                        color: color696969,
                      ),
                    ),
                    Container(
                      width: SizeConfig().screenWidth,
                      // child: Tags(
                      //   textField: TagsTextField(
                      //       autofocus: false,
                      //       width: SizeConfig().screenWidth,
                      //       hintText: "태그를 입력해주세요",
                      //       textStyle: TextStyle(fontSize: 14),
                      //       onSubmitted: (string) {
                      //         setState(() {
                      //           _tags.add(string);
                      //         });
                      //       }),
                      // ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // _tags != null
                    //     ? Tags(
                    //   heightHorizontalScroll: 36,
                    //   horizontalScroll: true,
                    //   itemCount: _tags.length,
                    //   itemBuilder: (index) => ItemTags(
                    //     index: index,
                    //     title: _tags[index],
                    //     textActiveColor: color696969,
                    //     pressEnabled: false,
                    //     borderRadius: BorderRadius.circular(15),
                    //     elevation: 0,
                    //     activeColor: colorD9D9D9,
                    //     removeButton: ItemTagsRemoveButton(onRemoved: () {
                    //       setState(() {
                    //         _tags.removeAt(index);
                    //       });
                    //       return true;
                    //     }),
                    //   ),
                    // )
                    //     : Container(),
                  ],
                ),
              ),
            ),
            ButtonTheme(
              minWidth: double.infinity,
              height: 55,
              child: MaterialButton(
                color: colorFFD74A,
                onPressed: () async {
                  await _listController.postAddRestaurantList();
                  Get.back();
                },
                child: Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//
// class ListAddScreen extends StatefulWidget {
//   const ListAddScreen({Key? key}) : super(key: key);
//
//   @override
//   _ListAddScreenState createState() => _ListAddScreenState();
// }
//
// class _ListAddScreenState extends State<ListAddScreen> {
//   YamListController _yamListController = Get.find<YamListController>();

//   List _foodtags = [];
//   List _tags = [];

//
//   String _place_name = "";
//   String _id = "";
//   String _category_name = "";
//   String _category_group_code = "";
//   String _category_group_name = "";
//   String _phone = "";
//   String _address_name = "";
//   String _road_address_name = "";
//   String _x = "";
//   String _y = "";
//   String _place_url = "";
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _restaurantNameController.dispose();
//     _memoController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           '리스트 추가',
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "식당명",
//                         style: TextStyle(
//                           fontFamily: "NotoSans-Regular",
//                           fontSize: 16,
//                           color: color696969,
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text(
//                           "찾는 식당이 없나요?",
//                           style: TextStyle(fontSize: 15),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     width: SizeConfig().screenWidth,
//                     child: TypeAheadField<KakaoListModel>(
//                       debounceDuration: Duration(milliseconds: 100),
//                       textFieldConfiguration: TextFieldConfiguration(
//                           controller: _restaurantNameController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.search),
//                             hintText: '식당명을 입력해주세요',
//                           )),
//                       suggestionsCallback:
//                       KakaoListModelApi.getKakaoListModelSuggestions,
//                       itemBuilder: (context, suggestion) {
//                         return Column(
//                           children: [
//                             ListTile(
//                               title: Text(suggestion.place_name!),
//                             ),
//                           ],
//                         );
//                       },
//                       noItemsFoundBuilder: (context) => Container(
//                         height: 100,
//                         child: Center(
//                           child: Text(
//                             '찾는 식당이 없어요',
//                             style: TextStyle(
//                               fontFamily: "NotoSans-Regular",
//                               fontSize: 18,
//                               color: color202020,
//                             ),
//                           ),
//                         ),
//                       ),
//                       onSuggestionSelected: (KakaoListModel suggestion) {
//                         final chosenList = suggestion;
//                         _place_name = chosenList.place_name!;
//                         _id = chosenList.id!;
//                         _category_name = chosenList.category_name!;
//                         _category_group_code = chosenList.category_group_code!;
//                         _category_group_name = chosenList.category_group_name!;
//                         _phone = chosenList.phone!;
//                         _address_name = chosenList.address_name!;
//                         _road_address_name = chosenList.road_address_name!;
//                         _x = chosenList.x!;
//                         _y = chosenList.y!;
//                         _place_url = chosenList.place_url!;
//                         // print(chosenList.place_name);
//                         // print(chosenList.id);
//                         // print(chosenList.category_name);
//                         // print(chosenList.category_group_code);
//                         // print(chosenList.category_group_name);
//                         // print(chosenList.phone);
//                         // print(chosenList.address_name);
//                         // print(chosenList.road_address_name);
//                         // print(chosenList.x);
//                         // print(chosenList.y);
//                         // print(chosenList.place_url);
//                         setState(() {
//                           _restaurantNameController.text =
//                               chosenList.place_name!;
//                         });
//                       },
//                     ),
//                   ),
//                   ListTile(
//                     onTap: () {},
//                     title: Text(
//                       _restaurantNameController.text,
//                       style: TextStyle(
//                         fontFamily: "NotoSans-Regular",
//                         fontSize: 18,
//                         color: color202020,
//                       ),
//                     ),
//                     tileColor: colorFFFFFF,
//                     leading: SvgPicture.asset("assets/icons/카테고리 이미지.svg"),
//                     subtitle: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "카테고리",
//                               style: TextStyle(
//                                 fontFamily: "NotoSans-Regular",
//                                 fontSize: 14,
//                                 color: colorD9D9D9,
//                               ),
//                             ),
//                             Text(
//                               " | ",
//                               style: TextStyle(
//                                 fontFamily: "NotoSans-Regular",
//                                 fontSize: 14,
//                                 color: colorD9D9D9,
//                               ),
//                             ),
//                             Text(
//                               "3.2km",
//                               style: TextStyle(
//                                 fontFamily: "NotoSans-Regular",
//                                 fontSize: 14,
//                                 color: colorD9D9D9,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     "먹고싶은음식",
//                     style: TextStyle(
//                       fontFamily: "NotoSans-Regular",
//                       fontSize: 16,
//                       color: color696969,
//                     ),
//                   ),
//                   Container(
//                     width: SizeConfig().screenWidth,
//                     // child: Tags(
//                     //   textField: TagsTextField(
//                     //       autofocus: false,
//                     //       width: SizeConfig().screenWidth,
//                     //       hintText: "음식을 입력해주세요",
//                     //       textStyle: TextStyle(fontSize: 14),
//                     //       onSubmitted: (string) {
//                     //         setState(() {
//                     //           _foodtags.add(string);
//                     //           print(_foodtags);
//                     //         });
//                     //       }),
//                     // ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   //_foodtags != null
//                   //     ? Tags(
//                   //   heightHorizontalScroll: 36,
//                   //   horizontalScroll: true,
//                   //   itemCount: _foodtags.length,
//                   //   itemBuilder: (index) => ItemTags(
//                   //     index: index,
//                   //     title: _foodtags[index],
//                   //     textActiveColor: color696969,
//                   //     pressEnabled: false,
//                   //     borderRadius: BorderRadius.circular(15),
//                   //     elevation: 0,
//                   //     activeColor: colorD9D9D9,
//                   //     removeButton: ItemTagsRemoveButton(onRemoved: () {
//                   //       setState(() {
//                   //         _foodtags.removeAt(index);
//                   //       });
//                   //       return true;
//                   //     }),
//                   //   ),
//                   // )
//                       //: Container(),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     "메모",
//                     style: TextStyle(
//                       fontFamily: "NotoSans-Regular",
//                       fontSize: 16,
//                       color: color696969,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     child: TextField(
//                       textAlign: TextAlign.start,
//                       controller: _memoController,
//                       decoration: InputDecoration(
//                         contentPadding:
//                         const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 20.0),
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     "태그",
//                     style: TextStyle(
//                       fontFamily: "NotoSans-Regular",
//                       fontSize: 16,
//                       color: color696969,
//                     ),
//                   ),
//                   Container(
//                     width: SizeConfig().screenWidth,
//                     // child: Tags(
//                     //   textField: TagsTextField(
//                     //       autofocus: false,
//                     //       width: SizeConfig().screenWidth,
//                     //       hintText: "태그를 입력해주세요",
//                     //       textStyle: TextStyle(fontSize: 14),
//                     //       onSubmitted: (string) {
//                     //         setState(() {
//                     //           _tags.add(string);
//                     //         });
//                     //       }),
//                     // ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   // _tags != null
//                   //     ? Tags(
//                   //   heightHorizontalScroll: 36,
//                   //   horizontalScroll: true,
//                   //   itemCount: _tags.length,
//                   //   itemBuilder: (index) => ItemTags(
//                   //     index: index,
//                   //     title: _tags[index],
//                   //     textActiveColor: color696969,
//                   //     pressEnabled: false,
//                   //     borderRadius: BorderRadius.circular(15),
//                   //     elevation: 0,
//                   //     activeColor: colorD9D9D9,
//                   //     removeButton: ItemTagsRemoveButton(onRemoved: () {
//                   //       setState(() {
//                   //         _tags.removeAt(index);
//                   //       });
//                   //       return true;
//                   //     }),
//                   //   ),
//                   // )
//                   //     : Container(),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 35,
//             ),
//             ButtonTheme(
//               minWidth: double.infinity,
//               height: 55,
//               child: MaterialButton(
//                 color: colorFFD74A,
//                 onPressed: () {
//
//                 },
//                 child: Text('저장'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
