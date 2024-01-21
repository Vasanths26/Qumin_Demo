// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:app_data/cart/cart_page.dart';
import 'package:app_data/res/cart_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './listforres.dart';
import './romodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'service.dart';

// void main() {
//   runApp( MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: DataListPage(),
//   ));
// }

class DataListPage extends StatefulWidget {
  DataListPage({super.key, this.img});

  final img;

  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  ServiceResData serviceResData = ServiceResData();
  bool user = true;
  List C = [];
  bool _isSelected = false;
  bool _isSelected1 = false;
  final cartStore = CartPage();
  @override
  void initState() {
    super.initState();
    serviceResData.fetchData();
  }

  count() {
    cartStore.add();
    cartStore.remove();
  }

  @override
  Widget build(BuildContext context) {
    print(serviceResData.filters.length);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     user = !user;
      //   });
      // }),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                  ),
                  elevation: 0,
                  backgroundColor: Colors.white,
                  pinned: false,
                  floating: false,
                  expandedHeight: 190.0,
                  flexibleSpace: FlexibleSpaceBar(
                    background : Image.network(
                      widget.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SliverAppBar(
                  leading: AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.white24.withOpacity(0.45),
                  ),
                  pinned: true,
                  floating: false,
                  backgroundColor: Colors.white,
                  toolbarHeight: 65,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    titlePadding: const EdgeInsets.only(
                      left: 12,
                      bottom: 12,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("ANUKA",
                            style: TextStyle(
                              color: Color(0xff313840),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            )),
                        const SizedBox(
                          height: 4,
                        ),
                        const Text(
                          "TajSats Mumbai",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff3B414F),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Observer(builder: (context) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    user = !user;
                                    _isSelected = !_isSelected;
                                  });
                                },
                                child: Container(
                                  width: 80,
                                  height: 30,
                                  // color: _isSelected == true
                                  //     ? Color.fromARGB(255, 230, 158, 132)
                                  //     : Colors.white,
                                  padding: const EdgeInsets.only(
                                      bottom: 4, left: 12, right: 12, top: 4),
                                  decoration: BoxDecoration(
                                      color: _isSelected == true
                                          ? const Color.fromARGB(
                                              255, 230, 158, 132)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 1, color: Colors.grey)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: Image.network(
                                            serviceResData.filters[0].imageUrl),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width: 22,
                                        child: Text(
                                          serviceResData.filters[0].name,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: _isSelected == true
                                                  ? Colors.white
                                                  : const Color(0xff3B414F)
                                                      .withOpacity(0.76)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    user = !user;
                                    _isSelected1 = !_isSelected1;
                                  });
                                },
                                child: Container(
                                  width: 95,
                                  height: 30,
                                  padding: const EdgeInsets.only(
                                      bottom: 4, left: 12, right: 12, top: 4),
                                  decoration: BoxDecoration(
                                    color: _isSelected == true
                                        ? const Color.fromARGB(
                                            255, 230, 158, 132)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 14,
                                        height: 14,
                                        child: Image.network(
                                            serviceResData.filters[1].imageUrl),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      SizedBox(
                                        height: 15,
                                        width: 47,
                                        child: Text(
                                          serviceResData.filters[1].name,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: _isSelected == true
                                                  ? Colors.white
                                                  : const Color(0xff3B414F)
                                                      .withOpacity(0.76)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Observer(builder: (context) {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: serviceResData.menuCategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          initiallyExpanded: true,
                          title: Text(
                              "${serviceResData.menuCategories[index].categoryName.toString()} (${serviceResData.menuCategories[index].menuItemsCount.toString()})",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                          children: [
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: serviceResData.dishtype.length,
                              itemBuilder: (BuildContext context, int index0) {
                                List<String> L = [];

                                print(serviceResData.menuItems[index].category
                                    .toLowerCase());

                                if (serviceResData
                                        .menuCategories[index].categoryName
                                        .toLowerCase() ==
                                    'Appetizers'.toLowerCase()) {
                                  for (var i = 0;
                                      i < serviceResData.dishtype.length;
                                      i++) {
                                    if (serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4001'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4000'.toLowerCase()) {
                                      L.clear();
                                      L.add(
                                        serviceResData
                                            .dishtype[index0].dishTypeName
                                            .toLowerCase(),
                                      );
                                    }
                                  }
                                } else if (serviceResData
                                        .menuCategories[index].categoryName
                                        .toLowerCase() ==
                                    'Desserts'.toLowerCase()) {
                                  for (var i = 0;
                                      i < serviceResData.dishtype.length;
                                      i++) {
                                    if (serviceResData
                                            .dishtype[index0].dishTypeId
                                            .toLowerCase() ==
                                        '4027'.toLowerCase()) {
                                      L.clear();
                                      L.add(
                                        serviceResData
                                            .dishtype[index0].dishTypeName
                                            .toLowerCase(),
                                      );
                                    }
                                  }
                                } else if (serviceResData
                                        .menuCategories[index].categoryName
                                        .toLowerCase() ==
                                    'Meal for One'.toLowerCase()) {
                                  for (var i = 0;
                                      i < serviceResData.dishtype.length;
                                      i++) {
                                    if (serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4006'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4013'.toLowerCase()) {
                                      L.clear();
                                      L.add(
                                        serviceResData
                                            .dishtype[index0].dishTypeName
                                            .toLowerCase(),
                                      );
                                    }
                                  }
                                } else {
                                  for (var i = 0;
                                      i < serviceResData.dishtype.length;
                                      i++) {
                                    if (serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4006'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4013'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4001'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4000'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '4027'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '3006'.toLowerCase() ||
                                        serviceResData
                                                .dishtype[index0].dishTypeId
                                                .toLowerCase() ==
                                            '3005'.toLowerCase()) {
                                    } else {
                                      L.clear();
                                      L.add(
                                        serviceResData
                                            .dishtype[index0].dishTypeName
                                            .toLowerCase(),
                                      );
                                    }
                                  }
                                }

                                return Column(
                                  children: L
                                      .map((ee) => ExpansionTile(
                                            iconColor: Colors.black,
                                            collapsedIconColor: Colors.black,
                                            initiallyExpanded: true,
                                            title: Text(
                                                "${ee.toString().toUpperCase()} (${serviceResData.menuCategories[index].menuItemsCount})",
                                                style: const TextStyle(
                                                  color: Color(0xFF979BA2),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            children: [
                                              Builder(builder: (context) {
                                                C.clear();

                                                for (var i = 0;
                                                    i <
                                                        serviceResData
                                                            .menuItems.length;
                                                    i++) {
                                                  if (ee ==
                                                      serviceResData
                                                          .menuItems[i].dishType
                                                          .toLowerCase()) {
                                                    MenuItem menuItem =
                                                        serviceResData
                                                            .menuItems[i];

                                                    if (menuItem.foodType ==
                                                            1 &&
                                                        user == true) {
                                                      C.add(
                                                        ListForRO(
                                                          img: menuItem
                                                              .plpImageUrl,
                                                          title: menuItem.title,
                                                          totalCalories:
                                                              menuItem
                                                                  .totalCalories
                                                                  .value
                                                                  .toString(),
                                                          price: menuItem.price
                                                              .toString(),
                                                          offerDetails: menuItem
                                                                  .offerDetails ??
                                                              '',
                                                        ),
                                                      );
                                                    } else if (menuItem
                                                                .foodType ==
                                                            2 &&
                                                        user == false) {
                                                      C.add(
                                                        ListForRO(
                                                          img: menuItem
                                                              .pdpImageUrl,
                                                          title: menuItem.title,
                                                          totalCalories:
                                                              menuItem
                                                                  .totalCalories
                                                                  .value
                                                                  .toString(),
                                                          price: menuItem.price
                                                              .toString(),
                                                          offerDetails: menuItem
                                                                  .offerDetails ??
                                                              '',
                                                        ),
                                                      );
                                                    }
                                                  }
                                                }

                                                return ListView.builder(
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  itemCount: C.length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index3) {
                                                    if (C.isEmpty) {
                                                      return const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      );
                                                    } else {
                                                      try {
                                                        return C[index3];
                                                      } catch (e) {
                                                        // Handle the error here
                                                        print('Error: $e');
                                                      }
                                                    }
                                                    return null;
                                                  },
                                                );
                                              })
                                            ],
                                          ))
                                      .toList(),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                padding: const EdgeInsets.only(left: 0, right: 16),
                height: 39,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    SizedBox(
                      height: 17,
                      width: 224,
                      child: Text(
                        "You have saved ${cartStore.count} items",
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Proxima Nova Alt',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: ((context) => Cart())));
                      },
                      child: Container(
                        height: 23,
                        width: 71,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xff901020)),
                        child: const Center(
                          child: Text(
                            "View Cart",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Proxima Nova Alt',
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
