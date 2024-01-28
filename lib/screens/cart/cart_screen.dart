import 'package:flutter/material.dart';
import 'package:untitled/common/app_color.dart';
import 'package:untitled/common/app_text.dart';
import 'package:untitled/help/helper.dart';
import 'package:untitled/screens/cart/controller/cart_controller.dart';
import 'package:untitled/screens/cart/controller/cart_controllerImpl.dart';

class CartScreen extends StatefulWidget {
  final int? idDrink;
  final int? count;
  const CartScreen({super.key, this.idDrink, this.count});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextEditingController noteVC = TextEditingController(text: '');

  late final CartController cartController;

  @override
  void initState() {
    super.initState();
    cartController = CartControllerImpl();
    cartController.initData(widget.idDrink!);
  }

  @override
  void dispose() {
    cartController.onClose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dataCart = cartController.dataCart;
    final listSize = cartController.listSize;
    final selectIndexSizeStream = cartController.selectIndexSizeStream;
    final listTopping = cartController.listTopping;
    final listOption = cartController.listOption;
    final selectIndexToppingStream = cartController.selectIndexToppingStream;
    final selectIndexOptionStream = cartController.selectIndexOptionStream;
    final countStream = cartController.countStream;
    final moneyStream = cartController.moneyStream;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "${dataCart!.img}",
                      fit: BoxFit.cover,
                      height: 230,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(24, 50, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16)),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 15,
                              ),
                            ),
                          ),
                          Container(
                            width: 45,
                            height: 45,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Center(
                                      child: Image.asset(
                                          'assets/images/icon_card.png')),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                          child: Text(
                                            "${widget.count}",
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
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, top: 24, bottom: 16),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              dataCart.name!,
                              style: TextStyle(
                                color: textCart,
                                fontSize: 24,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              dataCart.description!,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/img_star.png',
                                      width: 16,
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("${dataCart.rating}",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${formatter.format(dataCart.salePrice!.toDouble())}đ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: textColor,
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${formatter.format(dataCart.price!.toDouble())}đ',
                                      style: TextStyle(
                                        color: orange,
                                        fontSize: 24,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        )),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, top: 16, bottom: 0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tSize,
                            style: TextStyle(
                              color: textCart,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            tPrivate,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: listSize.length * (50 + 14),
                        child: StreamBuilder(
                          stream: selectIndexSizeStream,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            int selectedIndex = snapshot.data ?? 0;

                            return ListView.separated(
                              itemCount: listSize.length,
                              padding: const EdgeInsets.all(0),
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 14);
                              },
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      cartController.addSizePrice(index),
                                  child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: boderColor,
                                                  width: 0.5))),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset((index ==
                                                        selectedIndex
                                                    ? "assets/images/img_radio_button_select.png"
                                                    : "assets/images/img_radio_button.png")),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  listSize[index].name!,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: textCart,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${formatter.format(listSize[index].price!.toDouble())}đ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: textCart,
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tTopping,
                            style: TextStyle(
                              color: textCart,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            tPublic,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: listTopping.length * (50 + 14),
                          child: StreamBuilder(
                            stream: selectIndexToppingStream,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return ListView.separated(
                                itemCount: listTopping.length,
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 14);
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () =>
                                        cartController.addTopicPrice(index),
                                    child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: boderColor,
                                                    width: 0.5))),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(snapshot.data ==
                                                          index
                                                      ? "assets/images/img_radio_button_select.png"
                                                      : "assets/images/img_radio_button.png"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    listTopping[index].name!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: textCart,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${formatter.format(listTopping[index].price!.toDouble())}đ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: textCart,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              );
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tOption,
                            style: TextStyle(
                              color: textCart,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            tPublic,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: listOption.length * (50 + 14),
                          child: StreamBuilder(
                            stream: selectIndexOptionStream,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return ListView.separated(
                                itemCount: listOption.length,
                                padding: const EdgeInsets.all(0),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 14);
                                },
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () =>
                                        cartController.addOptionPrice(index),
                                    child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: boderColor,
                                                    width: 0.5))),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(snapshot.data ==
                                                          index
                                                      ? "assets/images/img_radio_button_select.png"
                                                      : "assets/images/img_radio_button.png"),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    listOption[index].name!,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: textCart,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${formatter.format(listOption[index].price)}đ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: textCart,
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              );
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tNote,
                            style: TextStyle(
                              color: textCart,
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            tPublic,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: TextField(
                          controller: noteVC,
                          cursorColor: Colors.black,
                          cursorWidth: 1,
                          keyboardType: TextInputType.text,
                          maxLines: 8,
                          maxLength: 4000,
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            fillColor: Color(0xfff7f7f7),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            hintStyle:
                                TextStyle(fontSize: 14, color: textColor),
                            hintText: note,
                            counterText: '',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
          SafeArea(
              child: Column(
            children: [
              StreamBuilder(
                  initialData: 1,
                  stream: countStream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (snapshot.data == 1) {
                              return;
                            } else {
                              cartController.onPressRemoveTotal();
                            }
                          },
                          child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Icon(
                                Icons.remove,
                                color: backgroundColor,
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${snapshot.data}",
                          style: TextStyle(
                            color: textCart,
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            cartController.onPressAddTotal();
                          },
                          child: Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(32)),
                              child: Icon(
                                Icons.add,
                                color: backgroundColor,
                              )),
                        )
                      ],
                    );
                  }),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder(
                  stream: moneyStream,
                  initialData: dataCart.price,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(32, 10, 32, 10),
                      height: 52,
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/img_cart.png',
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Thêm vào đơn - ${formatter.format(snapshot.data)}đ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ]),
                    );
                  }),
            ],
          ))
        ],
      ),
    );
  }
}
