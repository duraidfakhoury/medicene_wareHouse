import 'package:flutter/material.dart';
import 'package:medicine_warehouse/controller/data_fetch.dart';
// import 'package:medicine_warehouse/controller/getCategories.dart';
import 'package:medicine_warehouse/models/productResponse.dart';
import 'package:medicine_warehouse/widgets/newProductDialog.dart';
import '../constant.dart';
import '../widgets/drawer.dart';
import '../widgets/productcard1.dart';
import '../widgets/categoryWidget.dart';

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> categories = [
    {"id":0,"name":""},
    {"id": 1, "name": "Diabetes"},
    {"id": 2, "name": "Urinary"},
    {"id": 3, "name": "Digestive"},
    {"id": 4, "name": "Dermal"},
    {"id": 5, "name": "Respiratory"},
    {"id": 6, "name": "Vitamins"},
    {"id": 7, "name": "Alimentary"},
    {"id": 8, "name": "Antibiotics"},
    {"id": 9, "name": "Pressure"},
  ];
  ApiResponse? productApiResponse;
  //ApiResponse? categoryApiResponse;
  final TextEditingController controller = TextEditingController();
  String searchTerm = '';
  String categoryTerm ='';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // Inside fetchData function
Future<void> fetchData() async {
  try {
    ApiResponse response =
        await fetchProducts(searchTerm, categoryTerm, acssesToken);
    setState(() {
      productApiResponse = response;
    });
  } catch (error) {
    print('Error fetching data: $error');
  }
}

  // Future<void> fetchCat() async {
  //   try {
  //     ApiResponse response =
  //         await fetchCategories(acssesToken);
  //     setState(() {
  //      categoryApiResponse = response;
  //     });
  //   } catch (error) {
  //     print('Error fetching category: $error');
  //   }
  // }

  void onSearchChanged(String value) {
    print('Search term changed: $value');
    setState(() {
      searchTerm = value;
      fetchData();
    });
  }
  void onCategoryChanged(String value) {
    print('category term changed: $value');
    setState(() {
      categoryTerm = value;
      fetchData();
    });
  }
  

  @override
  Widget build(BuildContext context) {
    var products = productApiResponse?.data ?? [];
    //print(products);
    // var categories=categoryApiResponse?.data ?? [];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 50,
                  color: kBackgroundColor,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                padding: EdgeInsets.zero,
                iconSize: 50,
              ),
            ),
            SizedBox(width: 50),
            Text(
              'Al-Fares for Medicines',
              style: TextStyle(
                color: kBackgroundColor,
                fontSize: MediaQuery.of(context).size.width * 0.03,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: kFirstColor,
      ),
      drawer: AppDrawer(),
      body: HomeContent(
        products: products,
        onSearchChanged: onSearchChanged,
        categories: categories,
        onCategoryChanged: onCategoryChanged,
      ),
    );
  }
}

// ignore: must_be_immutable
class HomeContent extends StatelessWidget {
  final List<Product> products;
  final Function(String) onSearchChanged;
  final Function(String) onCategoryChanged;
  List<Map<String, dynamic>> categories;
  // final List<Category> categories;

  HomeContent({
    required this.products,
    required this.onSearchChanged,
    required this.onCategoryChanged,
    required this.categories
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 20, 8, 15),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(start: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: kFirstColor.withOpacity(0.6),
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: TextFormField(
                      onChanged: onSearchChanged,
                      cursorColor: kFirstColor,
                      decoration: InputDecoration(
                        hintText: 'Search for medicine',
                        suffixIcon: Icon(
                          Icons.search,
                          color: kFirstColor,
                          size: 35,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.51,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                     child: Row(
                      children: categories.map<Widget>((category) {
                          return GestureDetector(
                            onTap: () {
                              onCategoryChanged(category['name']);
                            },
                            child: CategoryWidget(categoryname : category['name'],)
                            );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return NewProductDialog();
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: kFirstColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Center(
                        child: Text(
                          "New",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.width * 0.015,
                            color: kBackgroundColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          if (products.isEmpty)
            Center(
              child: Text(
                'No products to display',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width*0.015,
                  color: kFirstColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          else
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 0.75,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = products[index];
                warehouseId='${product.warehouseId}';
                return ProductCard1(
                  category: product.category.name,
                  id: product.id,
                  commercialName: product.commercialName,
                  price: product.price,
                  imagePath: product.image,
                );
              },
            ),
        ],
      ),
    );
  }
}

