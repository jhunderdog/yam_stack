import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart' as mimeManager;
import 'package:yam_stack/shared/constants/color.dart';
import 'package:yam_stack/shared/utils/size_config.dart';
import 'package:yam_stack/src/modules/list/controller/list_controller.dart';

import '../../camera_screen.dart';

class ReviewWriteScreen extends StatefulWidget {
  final File? imageFile;
  final int? id;

  const ReviewWriteScreen({Key? key, required this.id, this.imageFile})
      : super(key: key);

  @override
  _ReviewWriteScreenState createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  ListController _yamListController = Get.find<ListController>();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _visitingDateController = TextEditingController();
  TextEditingController _mealTimeController = TextEditingController();
  TextEditingController _companyController = TextEditingController();
  TextEditingController _commentController = TextEditingController();
  bool shared = false;
  String? mealTime;
  String? company;
  DateTime? _selectedDate;
  File? _uploadFile;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _visitingDateController.dispose();
    _visitingDateController.dispose();
    _mealTimeController.dispose();
    _companyController.dispose();
    _commentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var list = _yamListController.searchList;
    print(list.length);
    var index = list.indexWhere((element) => element!.id == widget.id);

    // var index = item!.indexWhere((element) => element!.id == widget.id);
    // print(index);
    // final index = _yamListController.mylist[0].content!
    //     .indexWhere((element) => element!.id == widget.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '?????? ??????',
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        _yamListController.searchList[index]!.restaurant!.name!,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        _yamListController
                            .searchList[index]!.restaurant!.category2depth!,
                        style: TextStyle(fontSize: 14, color: color696969),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.grey[200],
                thickness: 15,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "?????? ??????",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 16,
                        color: color696969,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        // width: SizeConfig().screenWidth * 3 / 5,
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          controller: _visitingDateController,
                          onTap: () {
                            _presentDatePicker();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "?????? ??????",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 16,
                        color: color696969,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          controller: _mealTimeController,
                          onTap: () {
                            _showBottomSheet();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "?????????     ",
                      style: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 16,
                        color: color696969,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        child: TextFormField(
                          showCursor: true,
                          readOnly: true,
                          controller: _companyController,
                          onTap: () {
                            print("ontap");
                            _showBottomScrollSheet();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: _commentController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 20.0),
                      hintText: "????????? ?????? ????????? ???????????? ??????????????????",
                      hintStyle: TextStyle(
                        fontFamily: "NotoSans-Regular",
                        fontSize: 16,
                        color: color696969,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _uploadFile == null
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: GestureDetector(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.photo_camera_outlined),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "?????? ??????",
                                style: TextStyle(
                                  fontFamily: "NotoSans-Regular",
                                  fontSize: 16,
                                  color: color696969,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            _openCamera();
                          }),
                    )
                  : SizedBox(
                      height: 5,
                    ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          _uploadFile == null
                              ? Text("")
                              : Image.file(
                                  _uploadFile!,
                                  width: SizeConfig().screenWidth / 4,
                                  height: SizeConfig().screenWidth / 4,
                                  fit: BoxFit.cover,
                                ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -15,
                      right: 260,
                      child: _uploadFile != null
                          ? IconButton(
                              icon: Icon(
                                Icons.cancel,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _uploadFile = null;
                                });
                              },
                            )
                          : Container(),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // SectionSwitch('?????? ??????'),
              ListTile(
                title: Text(
                  '????????????',
                  style: TextStyle(
                    fontFamily: "NotoSans-Regular",
                    fontSize: 16,
                    color: color202020,
                  ),
                ),
                trailing: Switch(
                  activeColor: colorFFD74A,
                  value: shared,
                  onChanged: (onValue) {
                    setState(() {
                      shared = onValue;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  "????????? ????????? ??????????????? ????????? ??? ????????????.",
                  style: TextStyle(
                    fontFamily: "NotoSans-Regular",
                    fontSize: 14,
                    color: color696969,
                  ),
                ),
              ),

              SizedBox(
                height: 35,
              ),
              ButtonTheme(
                minWidth: double.infinity,
                height: 55,
                child: MaterialButton(
                  color: colorFFD74A,
                  onPressed: () async {
                    ///???????????????///
                    String userToken;
                    String url = 'http://yam-stack.com/api/v1/review';
                    var headers = {
                      'Content-Type': 'multipart/form-???data',
                      'x-auth-token':
                          'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMzM4MndhdGVyQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiZXhwIjoxNjI2MDYxMDM4fQ.v0mbLLSUlBc9E0SbFI8Bx9qu8kUn6-uwQ1t0o4pjMqI',
                    };
                    var request = http.MultipartRequest('POST', Uri.parse(url));
                    var data = {
                      "comment": "very good",
                      "company": "2",
                      "yam": {"id": "81"},
                      "visitTime": "2021-07-08",
                      "shared": true,
                      "mealTime": "1"
                    };
                    var sendData = json.encode(data);
                    request.fields.addAll({'reviewdata': sendData});
                    print(_uploadFile!.path);
                    request.files.add(await http.MultipartFile.fromPath(
                        'image', _uploadFile!.path));
                    request.headers.addAll(headers);
                    http.StreamedResponse response = await request.send();
                    print(response.statusCode);
                    if (response.statusCode == 200) {
                      print(await response.stream.bytesToString());
                    } else {
                      print(response.reasonPhrase);
                    }
                    // Options options = Options(
                    //     contentType:
                    //         ContentType.parse('application/json').toString());
                    //
                    // String userToken;
                    // //???????????? ????????? ????????? ????????????????????? ????????? ??? ???????????? ????????????...
                    // var dioRequest = dio.Dio();
                    //
                    // dioRequest.options.headers['x-auth-token'] =
                    //     'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzMzM4MndhdGVyQGdtYWlsLmNvbSIsInJvbGUiOiJVU0VSIiwiZXhwIjoxNjI2MDYxMDM4fQ.v0mbLLSUlBc9E0SbFI8Bx9qu8kUn6-uwQ1t0o4pjMqI';
                    // dioRequest.options.headers["accept"] = "application/json";
                    //
                    // String url = 'http://yam-stack.com/api/v1/review';
                    // // var yam = {"id": "81"};

                    // print(json.encode(data));
                    // var formData = dio.FormData.fromMap({
                    //   'reviewdata': json.encode(data),
                    //   'image': await dio.MultipartFile.fromFile(_uploadFile.path,
                    //       contentType: MediaType('image',
                    //           mimeManager.lookupMimeType(_uploadFile.path)))
                    // });
                    // print(formData);
                    // var response = await dioRequest.post(url,
                    //     data: formData, options: options);
                    // print(response.statusCode);
                  },
                  child: Text('????????????'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openCamera() async {
    if (await checkIfPermissionGranted(context)) {
      var pic = await Get.to(() => CameraScreen());
      print(pic);
      setState(() {
        _uploadFile = pic;
        print(_uploadFile);
      });
    } else {
      Get.defaultDialog(
          title: "??????, ??????, ????????? ?????? ?????? ???????????? ?????? ???????????????",
          content: TextButton(
              onPressed: () {
                AppSettings.openAppSettings();
              },
              child: Text("?????? ??????")));
    }
  }

  Future<bool> checkIfPermissionGranted(BuildContext context) async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.microphone,
      Platform.isIOS ? Permission.photos : Permission.storage,
    ].request();
    print(statuses);
    bool permitted = true;
    print(permitted);
    statuses.forEach((permission, permissionStatus) {
      if (!permissionStatus.isGranted) permitted = false;
    });
    print(permitted);
    return permitted;
  }

  void _presentDatePicker() {
    showDatePicker(
        // ?????????????????? ???????????? ????????? ??? ????????????
        // locale: const Locale('ko', "KR"),
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: colorFFD74A, // header background color
                  onPrimary: colorFFFFFF, // header text color
                  onSurface: color202020, // body text color
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    primary: colorFFD74A, // button text color
                  ),
                ),
              ),
              child: child!);
        }).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
        String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate!);
        print(_selectedDate);
        _visitingDateController.text = formattedDate;
      });
    });
  }

  void _showBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "????????????",
                style: TextStyle(
                  fontFamily: "NotoSans-Bold",
                  fontSize: 18,
                  color: color202020,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 0,
            ),
            ListTile(
              title: Text(
                "??????",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                setState(() {
                  _mealTimeController.text = "??????";
                  mealTime = "0";
                });
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                "??????",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                setState(() {
                  _mealTimeController.text = "??????";
                  mealTime = "1";
                  Get.back();
                });
              },
            ),
            ListTile(
              title: Text(
                "??????",
                style: TextStyle(color: color202020),
              ),
              onTap: () {
                setState(() {
                  _mealTimeController.text = "??????";
                  mealTime = "2";
                  Get.back();
                });
              },
            ),
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorD9D9D9),
              ),
              child: GestureDetector(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "??????",
                        style: TextStyle(
                          fontFamily: "NotoSans-Bold",
                          fontSize: 16,
                          color: color202020,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
  void _showBottomScrollSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: true,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        builder: (context) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "?????????",
                style: TextStyle(
                  fontFamily: "NotoSans-Bold",
                  fontSize: 18,
                  color: color202020,
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 0,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                ListTile(
                  title: Text(
                    "??????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "??????";
                      company = "0";
                    });
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "??????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "??????";
                      company = "1";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "??????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "??????";
                      company = "2";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "??????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "??????";
                      company = "3";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "??????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "??????";
                      company = "4";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "?????????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "?????????";
                      company = "5";
                    });

                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    "????????????",
                    style: TextStyle(color: color202020),
                  ),
                  onTap: () {
                    setState(() {
                      _companyController.text = "????????????";
                      company = "6";
                    });

                    Get.back();
                  },
                ),
              ],
            ))),
            Container(
              height: 42,
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: colorD9D9D9),
              ),
              child: GestureDetector(
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "??????",
                        style: TextStyle(
                          fontFamily: "NotoSans-Bold",
                          fontSize: 16,
                          color: color202020,
                        ),
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
}
