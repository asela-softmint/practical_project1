import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  var jasonList;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get('https://fakestoreapi.com/products/');
      print(response);
      if (response.statusCode == 200) {
        setState(() {
          jasonList = response.data as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              color: Color.fromARGB(255, 156, 242, 253),
              width: 50,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.network(
                      jasonList[index]['image'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 270,
                        height: 100,
                        child: Text(jasonList[index]['title']),
                      ),
                      Container(
                        width: 270,
                        height: 100,
                        child: Text(jasonList[index]['title']),
                      )
                    ],
                  ),
                ],
              ));
          // return Card(
          //   child: ListTile(
          //     leading: ClipRRect(
          //       borderRadius: BorderRadius.circular(80),
          // child: Image.network(
          //   jasonList[index]['image'],
          //   fit: BoxFit.fitWidth,
          // ),
          //     ),
          //     title: Text(jasonList[index]['title']),
          //     subtitle: Text(jasonList[index]['category']),
          //   ),
          // );
        },
        itemCount: jasonList == null ? 0 : jasonList.length,
      ),
    );
  }
}
