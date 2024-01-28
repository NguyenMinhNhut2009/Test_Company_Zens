import 'package:flutter/material.dart';
import 'package:untitled/common/app_color.dart';
import 'package:untitled/common/app_text.dart';
import 'package:untitled/help/helper.dart';
import 'package:untitled/screens/cart/cart_screen.dart';
import 'package:untitled/screens/home/controller/home_controller.dart';
import 'package:untitled/screens/home/controller/home_controllerImpl.dart';

import '../../model/home_data_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<int> listData = [];

  late final HomeController homeController;
  @override
  void initState() {
    homeController = HomeControllerImpl();
    homeController.initData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final countStream = homeController.countStream;
    final saveStream = homeController.saveStream;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(children: [
        Container(
          height: 320,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Color(0xffffe6d4),
          ], begin: Alignment.centerLeft, end: Alignment.bottomRight)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: tra,
                              style: TextStyle(
                                color: Color(0xFF272D2F),
                                fontSize: 44,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: mix,
                              style: TextStyle(
                                color: Color(0xFFFE724C),
                                fontSize: 65,
                                fontFamily: 'Righteous',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      luaChon,
                      style: TextStyle(
                        color: Color(0xFF616161),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Image.asset('assets/images/img_background.png')
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Text(
                  search,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF111719),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                StreamBuilder(
                    stream: saveStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      final data = snapshot.data as HomeDataModel?;

                      return DropdownButton<SortItem>(
                        value: data?.sort ?? SortItem.popular,
                        icon: const Icon(Icons.expand_more),
                        elevation: 16,
                        style: TextStyle(color: orange),
                        onChanged: (SortItem? value) {
                          homeController.onPressSortData(value!);
                        },
                        items: SortItem.values
                            .map<DropdownMenuItem<SortItem>>((SortItem value) {
                          return DropdownMenuItem<SortItem>(
                            value: value,
                            child: Text(value.getDisplayName()),
                          );
                        }).toList(),
                      );
                    })
              ],
            ),
            StreamBuilder(
                initialData: 0,
                stream: countStream,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return GestureDetector(
                    onTap: () {
                      if (listData.isEmpty) {
                        return;
                      }
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CartScreen(
                                    count: 1,
                                    idDrink: listData.first,
                                  )));
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x4CD3D1D8),
                            blurRadius: 20,
                            offset: Offset(5, 10),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: Center(
                                child:
                                    Image.asset('assets/images/icon_card.png')),
                          ),
                          Positioned(
                            left: 22,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: ShapeDecoration(
                                color: totalCart,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: Text(
                                      "${snapshot.data}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: backgroundColor,
                                        fontSize: 10,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ]),
        ),
        Expanded(
            child: StreamBuilder(
          initialData: homeController.initialValue,
          stream: saveStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            HomeDataModel data = snapshot.data;
            return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: data.listNewData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 15);
                },
                itemBuilder: (context, index) {
                  String dem;
                  double temp = data.listNewData[index].favorite! / 1000;
                  if (temp > 1) {
                    dem = 'K';
                  } else {
                    dem = "M";
                  }

                  return Container(
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xffD3D1D8).withOpacity(0.25),
                              offset: Offset(18, 18),
                              blurRadius: 36)
                        ]),
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                '${data.listNewData[index].img}',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 84,
                                    height: 36,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 8),
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${formatter.format(data.listNewData[index].salePrice)}đ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: textCart,
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w600,
                                            height: 0.10,
                                            letterSpacing: 0.14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () =>
                                        homeController.onPressSave(index),
                                    child: Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Image.asset(data
                                                  .listNewData[index].save ==
                                              true
                                          ? 'assets/images/img_favourite_select.png'
                                          : 'assets/images/img_favourite.png'),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.listNewData[index].name!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.21,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 356,
                                  child: Text(
                                    data.listNewData[index].description!,
                                    style: TextStyle(
                                      color: Color(0xFF616161),
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/img_star.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Center(
                                              child: Text(
                                                "${data.listNewData[index].rating!}",
                                                style: TextStyle(
                                                  color: Color(0xFF616161),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                'assets/images/img_favourite_select.png'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Center(
                                              child: Text(
                                                "$temp$dem",
                                                style: TextStyle(
                                                  color: Color(0xFF616161),
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        homeController.onPressAddCount(context);
                                        listData
                                            .add(data.listNewData[index].id!);
                                      },
                                      child: Container(
                                        width: 32,
                                        height: 32,
                                        padding: const EdgeInsets.all(5.33),
                                        clipBehavior: Clip.antiAlias,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFFE724C),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12),
                                            ),
                                          ),
                                          shadows: [
                                            BoxShadow(
                                              color: Color(0x66FE724C),
                                              blurRadius: 18.21,
                                              offset: Offset(0, 8.50),
                                              spreadRadius: 0,
                                            )
                                          ],
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                width: 21.33,
                                                height: 21.33,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(),
                                                child: Icon(
                                                  Icons.add,
                                                  color: backgroundColor,
                                                )),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                        )
                      ],
                    )),
                  );
                });
          },
        ))
      ]),
    );
  }
}
