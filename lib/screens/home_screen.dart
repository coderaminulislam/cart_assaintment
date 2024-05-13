import 'package:flutter/material.dart';
import '../Data/product_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = productList.fold(
        0, (sum, item) => sum + (item['itemPrice'] * item['itemQty']));

    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 24,
              ))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _cartTitleText(),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  _cartListViewBuilder(),
                  const SizedBox(height: 40,),
                  _cartTotalAmount(totalPrice),
                  const SizedBox(
                    height: 10,
                  ),
                  _cartCheckoutButton(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffDB3022),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14)),
          onPressed: () {},
          child: const Text(
            'CHECK OUT',
            style: TextStyle(
              fontSize: 14,
            ),
          )),
    );
  }

  Widget _cartTotalAmount(double totalPrice) {
    return Row(
      children: [
        const Text(
          'Total Amount:',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color(0xff9b9b9b)),
        ),
        const Spacer(),
        Text(
          '$totalPrice\$',
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ],
    );
  }

  Widget _cartListViewBuilder() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final itemsData = productList[index];
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.10),
                    blurRadius: 4,
                    offset: const Offset(4, 8), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  _cartProductImage(itemsData),
                  _cartProductInfo(itemsData, index)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        );
      },
    );
  }

  Widget _cartProductInfo(Map<String, dynamic> itemsData, int index) {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${itemsData['itemName']}',
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Color:',
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              Text(
                                ' ${itemsData['itemColor']}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 11),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Size:',
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              Text(
                                ' ${itemsData['itemSize']}',
                                style: const TextStyle(
                                    fontSize: 11, color: Colors.black),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 18,
                    color: Colors.grey,
                  )),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    productList[index]['itemQty']--;
                                    setState(() {});
                                    if (productList[index]['itemQty'] < 1) {
                                      productList[index]['itemQty'] = 1;
                                    }
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  icon: const Icon(
                                    Icons.remove,
                                    size: 20,
                                  )),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text('${productList[index]['itemQty']}'),
                            const SizedBox(
                              width: 16,
                            ),
                            Container(
                              width: 36,
                              height: 36,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.08),
                                    blurRadius: 20,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    productList[index]['itemQty']++;
                                    setState(() {});
                                    if ((productList[index]['itemQty']) == 5) {
                                      message(index);
                                    }
                                  },
                                  style: IconButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.black,
                                  ),
                                  icon: const Icon(
                                    Icons.add,
                                    size: 20,
                                  )),
                            ),
                          ],
                        )
                      ])
                ],
              ),
              const Spacer(),
              Text(
                "${itemsData['itemPrice'] * productList[index]['itemQty']}\$",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget _cartProductImage(Map<String, dynamic> itemsData) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(7), right: Radius.circular(7)),
          image: DecorationImage(
            image: AssetImage("${itemsData['itemImage']}"),
            fit: BoxFit.cover,
          )),
    );
  }

  Widget _cartTitleText() {
    return const Row(
      children: [
        Text(
          'My Bag',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: Color(0xff222222),
              fontFamily: 'Roboto'),
        ),
      ],
    );
  }

  void message(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            title: const Text(
              textAlign: TextAlign.center,
              'Congratulations!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            content: Text(
              textAlign: TextAlign.center,
              "You have added 5 ${productList[index]['itemName']} on your bag!",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            contentPadding: const EdgeInsets.all(24.0),
            actions: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDB3022),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14)),
                    onPressed: () {},
                    child: const Text(
                      'OKAY',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    )),
              ),
            ],
          );
        });
  }
}
