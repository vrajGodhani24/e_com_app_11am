import 'package:e_com_app_11am/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? dropDownValue;
  double sliderVal = 0;
  int start = 0;
  int end = 1750;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('cart_page');
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: (dropDownValue == null)
                  ? Row(
                      children: [
                        DropdownButton(
                          value: dropDownValue,
                          hint: const Text(
                            "Select category...",
                            style: TextStyle(letterSpacing: -0.5),
                          ),
                          items: Global.allProducts.map((e) {
                            return DropdownMenuItem(
                              value: Global.allProducts.indexOf(e),
                              child: Text("${e['categoryName']}"),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              dropDownValue = val!;
                            });
                          },
                        ),
                        Visibility(
                          visible: (dropDownValue != null) ? true : false,
                          child: ActionChip(
                            elevation: 0,
                            label: const Row(
                              children: [
                                Icon(
                                  Icons.clear,
                                  size: 15,
                                ),
                                Text(" Clear"),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                dropDownValue = null;
                              });
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            DropdownButton(
                              value: dropDownValue,
                              hint: const Text(
                                "Select category...",
                                style: TextStyle(letterSpacing: -0.5),
                              ),
                              items: Global.allProducts.map((e) {
                                return DropdownMenuItem(
                                  value: Global.allProducts.indexOf(e),
                                  child: Text("${e['categoryName']}"),
                                );
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  dropDownValue = val!;
                                });
                              },
                            ),
                            Visibility(
                              visible: (dropDownValue != null) ? true : false,
                              child: ActionChip(
                                elevation: 0,
                                label: const Row(
                                  children: [
                                    Icon(
                                      Icons.clear,
                                      size: 15,
                                    ),
                                    Text(" Clear"),
                                  ],
                                ),
                                onPressed: () {
                                  setState(() {
                                    dropDownValue = null;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Text('From'),
                                  Text(
                                    "\$ $start",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: RangeSlider(
                                values: RangeValues(
                                    start.toDouble(), end.toDouble()),
                                min: 0,
                                max: 1750,
                                onChanged: (val) {
                                  setState(() {
                                    start = val.start.toInt();
                                    end = val.end.toInt();
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  const Text('To'),
                                  Text(
                                    "\$ $end",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            ),
            Expanded(
              flex: (dropDownValue == null) ? 9 : 6,
              child: SingleChildScrollView(
                child: Column(
                  children: Global.allProducts.map((e) {
                    return (dropDownValue == null)
                        ? Container(
                            alignment: Alignment.centerLeft,
                            height: 375,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${e['categoryName']}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ...e['categoryProducts'].map((e) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                'detail_page',
                                                arguments: e);
                                          },
                                          child: Container(
                                            height: 300,
                                            width: 180,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 0.5,
                                                color: Colors.grey,
                                              ),
                                              boxShadow: const <BoxShadow>[
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(0, 3),
                                                ),
                                              ],
                                            ),
                                            margin: const EdgeInsets.only(
                                                right: 30, bottom: 30),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(
                                                            "${e['thumbnail']}"),
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .vertical(
                                                        top:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Container(
                                                      height: 40,
                                                      width: 80,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.red.shade700,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  14),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: Text(
                                                        "${e['discountPercentage']}%",
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "${e['title']}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        Text(
                                                          "\$ ${e['price']}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        RatingBar.builder(
                                                          initialRating:
                                                              double.parse(
                                                                  '${e['rating']}'),
                                                          direction:
                                                              Axis.horizontal,
                                                          allowHalfRating: true,
                                                          itemCount: 5,
                                                          itemSize: 22,
                                                          itemBuilder:
                                                              (context, i) {
                                                            return const Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            );
                                                          },
                                                          ignoreGestures: true,
                                                          onRatingUpdate:
                                                              (rating) {},
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : (Global.allProducts.indexOf(e) == dropDownValue)
                            ? Container(
                                alignment: Alignment.centerLeft,
                                height: 375,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${e['categoryName']}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ...e['categoryProducts'].map((e) {
                                            return (e['price'] >= start &&
                                                    e['price'] <= end)
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              'detail_page',
                                                              arguments: e);
                                                    },
                                                    child: Container(
                                                      height: 300,
                                                      width: 180,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        border: Border.all(
                                                          width: 0.5,
                                                          color: Colors.grey,
                                                        ),
                                                        boxShadow: const <BoxShadow>[
                                                          BoxShadow(
                                                            color: Colors.grey,
                                                            offset:
                                                                Offset(0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 30,
                                                              bottom: 30),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                            flex: 2,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                image:
                                                                    DecorationImage(
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  image: NetworkImage(
                                                                      "${e['thumbnail']}"),
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .topLeft,
                                                              child: Container(
                                                                height: 40,
                                                                width: 80,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .red
                                                                      .shade700,
                                                                  borderRadius:
                                                                      const BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            14),
                                                                  ),
                                                                ),
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child: Text(
                                                                  "${e['discountPercentage']}%",
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 1,
                                                            child: Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8),
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "${e['title']}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    "\$ ${e['price']}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  RatingBar
                                                                      .builder(
                                                                    initialRating:
                                                                        double.parse(
                                                                            '${e['rating']}'),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    allowHalfRating:
                                                                        true,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        22,
                                                                    itemBuilder:
                                                                        (context,
                                                                            i) {
                                                                      return const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color: Colors
                                                                            .amber,
                                                                      );
                                                                    },
                                                                    ignoreGestures:
                                                                        true,
                                                                    onRatingUpdate:
                                                                        (rating) {},
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container();
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
