import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart/cart_page.dart';
import '../res/romodel.dart';
import '../res/service.dart';
import 'appetizer/appetizerspage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantProvider>(
          create: (_) => RestaurantProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RestaurantFile(),
      ),
    ),
  );
}

class RestaurantFile extends StatelessWidget {
  const RestaurantFile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Cart()),
            );
          },
        ),
        body: const CreateProvider(),
      ),
    );
  }
}

class CreateProvider extends StatelessWidget {
  const CreateProvider({Key? key});

  @override
  Widget build(BuildContext context) {
    return RestaurantUi();
  }
}

class RestaurantProvider with ChangeNotifier {
  List<MenuItem> _data = [];
  List<CartData> cart = [];
  List<MenuCategory> menucategory = [];
  List<MenuCategoryDishType> dishtype = [];

  Future<void> getFeed() async {
    String jsonData = await rootBundle.loadString('assets/g.json');
    Res apidata = Res.fromJson(json.decode(jsonData));
    final dynamic items = apidata.result.menuCategories
        .expand((element) => element.dishTypes.expand((dish) => dish.menuItems))
        .toList();
    _data = items;
    menucategory = apidata.result.menuCategories;
    dishtype = menucategory.expand((element) => element.dishTypes).toList();

    notifyListeners();
  }

  void addToCart(CartData item) {
    final existingItemIndex = cart.indexWhere((cartItem) =>
        cartItem.name == item.name && cartItem.price == item.price);

    if (existingItemIndex != -1) {
      cart[existingItemIndex].quantity = (cart[existingItemIndex].quantity + 1);
    } else {
      cart.add(CartData(
        name: item.name,
        kcal: item.kcal,
        price: item.price,
        img: item.img,
        quantity: 1,
      ));
    }

    notifyListeners();
  }

  void removeFromCart(index) {
    if (cart[index].quantity > 1) {
      cart[index].quantity = cart[index].quantity - 1;
    } else {
      cart.removeAt(index);
    }

    notifyListeners();
  }

  void removeCart(item) {
    cart.removeAt(item);
    notifyListeners();
  }

  List<MenuItem> get data {
    return _data;
  }
}

class CartData {
  String name;
  String kcal;
  String price;
  String img;
  int quantity;

  CartData({
    required this.quantity,
    required this.kcal,
    required this.name,
    required this.price,
    required this.img,
  });
}

class RestaurantUi extends StatefulWidget {
  RestaurantUi({Key? key}) : super(key: key);

  @override
  _RestaurantUiState createState() => _RestaurantUiState();
}

class _RestaurantUiState extends State<RestaurantUi> {
  bool vegcolor = false;
  bool non_vegcolor = false;
  bool vegtextcolor = false;
  bool nonvegtextcolor = false;
  final serviceData = ServiceResData();
  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantProvider>(context, listen: false).getFeed();
    serviceData.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final dataprovider = Provider.of<RestaurantProvider>(context).data;

    if (dataprovider.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 154, 39, 72),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/restuarantphoto/Banner.png",
              height: 156,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 340, top: 8),
              child: SizedBox(
                child: Text(
                  "ANUKA",
                  style: TextStyle(
                    fontFamily: "ProximaNovaA",
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff313840),
                    height: 19 / 16,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 300),
              child: Text(
                "TajSats Mumbai",
                style: TextStyle(
                  fontFamily: "ProximaNovaA",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff3b414f),
                  height: 17 / 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        vegcolor = !vegcolor;
                        vegtextcolor = !vegtextcolor;
                      });
                    },
                    child: Container(
                      height: 25,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 0.5),
                        color: vegcolor
                            ? const Color(0xffAD9198)
                            : const Color.fromARGB(52, 255, 254, 254),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(serviceData.filters[0].imageUrl),
                          const SizedBox(width: 5),
                          Text(
                            serviceData.filters[0].name,
                            style: TextStyle(
                              color: vegtextcolor
                                  ? const Color.fromARGB(255, 255, 249, 249)
                                  : const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            non_vegcolor = !non_vegcolor;
                            nonvegtextcolor = !nonvegtextcolor;
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.5),
                            color: non_vegcolor
                                ? const Color(0xffAD9198)
                                : const Color.fromARGB(52, 255, 254, 254),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(serviceData.filters[1].imageUrl),
                              const SizedBox(width: 5),
                              Text(
                                serviceData.filters[1].name,
                                style: TextStyle(
                                  color: nonvegtextcolor
                                      ? const Color.fromARGB(255, 255, 249, 249)
                                      : const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            AppetizersPage(),
          ],
        ),
      );
    }
  }
}
