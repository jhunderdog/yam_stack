import 'package:flutter/material.dart';



class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    List typeList = ["여기 가까워", "여긴 강추", "여긴 가봤어"];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    bool _listPinned = false;
    String message = "여기얌";
    double height2 = 40.0;



    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notificationInfo) {
          if (notificationInfo is ScrollStartNotification) {
            print("scroll");
            print("detail:" + notificationInfo.dragDetails.toString());
            _listPinned = !_listPinned;
            setState(() {});

            /// your code
          }
          return true;
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              pinned: _pinned,
              snap: _snap,
              floating: _floating,
              elevation: 0,
              expandedHeight: 128,
              flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 64, left: 16),
                      child: Row(
                        children: [
                          Text(message),
                        ],
                      ),
                    ),
                  )),
            ),
            SliverPersistentHeader(
              pinned: _listPinned,
              floating: _listPinned,
              delegate: _SliverAppBarDelegate(
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(40.0),
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.purple,
                          height: 38,
                          child: Text('$index'),
                        );
                      },
                    ),
                  )),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(typeList[index],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.black)),
                                    TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "모두 보기 >",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                  ]))),
                      Container(
                        height: 340,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("고독한 미식"),
                                      Text("냠냠 박사",)
                                    ],
                                  ),
                                  Text("2021.06.03")
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)
                                ),
                                height: 195,
                                width: width - 32,
                                child: Image.asset("assets/example1.jpg",fit: BoxFit.fill,),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("디망쉬"),
                                  Text("ㅁㄴㅇㄹㅁㄴㅇㄹ")
                                ],
                              ),
                              Text("ajsdkflajsd;klfas;lfjaslf")
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 153.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Container(
                                  color: Colors.white,
                                  height: 88,
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Image.asset("assets/example1.jpg"),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text('페이퍼앤펜슬'),
                                      SizedBox(
                                        height: 1,
                                      ),
                                      Text('양식')
                                    ],
                                  )),
                              onTap: () {
                                print(123);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                childCount: 3,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}