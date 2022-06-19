import 'package:flutter/material.dart';
import 'package:flutter_book_store_app/data/book_list.dart';
import 'package:flutter_book_store_app/model/book.dart';
import 'package:flutter_book_store_app/screen/detail_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color _accentColor = const Color(0xFF272727);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: const Icon(
          Iconsax.menu,
          color: Colors.black54,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23.0),
            child: Row(
              children: const [
                Icon(Iconsax.heart, color: Colors.black54),
                SizedBox(width: 15.0),
                Icon(Iconsax.notification, color: Colors.black54)
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: _accentColor,
          unselectedItemColor: Colors.grey[400],
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.book),
                activeIcon: Icon(
                  Iconsax.book,
                  color: _accentColor,
                ),
                label: 'Book',
                tooltip: "This is a Book Page"),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.shopping_cart),
                activeIcon: Icon(
                  Iconsax.shopping_cart,
                  color: _accentColor,
                ),
                label: 'Shop',
                tooltip: "This is a Business Page"),
            BottomNavigationBarItem(
                icon: const Icon(Iconsax.profile_circle),
                activeIcon: Icon(
                  Iconsax.personalcard,
                  color: _accentColor,
                ),
                label: 'My Page',
                tooltip: "This is a School Page")
          ]),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 23.0),
          child: Column(
            children: [
              _makeSearchBoxEl(),
              const SizedBox(
                height: 25.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _makeCategoryEl("Business"),
                    const SizedBox(
                      width: 7.0,
                    ),
                    _makeCategoryEl("Novel"),
                    const SizedBox(
                      width: 7.0,
                    ),
                    _makeCategoryEl("Biography"),
                    const SizedBox(
                      width: 7.0,
                    ),
                    _makeCategoryEl("History"),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Popular Books",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w700)),
                  Text(
                    "Seel all",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.lightBlue),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              _makeBookSlider(BookList.newArrivalBooks, context),
              const SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                height: 150.0,
                decoration: const BoxDecoration(
                    //shape: BoxShape.circle,
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    gradient: LinearGradient(
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight,
                        colors: [
                          Color(0xFFe4a972),
                          Color(0xFF9941d8),
                        ])),
                child: const Center(
                  child: Text(
                    'Best Seller 2021',
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  ///Make Search box widget
  Widget _makeSearchBoxEl() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.grey[200]),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "Search",
        ),
      ),
    );
  }

  ///Make book slier widget
  Widget _makeBookSlider(List<Book> books, dynamic context) {
    List<Widget> contents = [];
    for (Book book in books) {
      contents.add(_makeBookEl(book, context));
      contents.add(const SizedBox(width: 20.0));
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: contents,
      ),
    );
  }

  ///Make book widget.
  Widget _makeBookEl(Book book, dynamic context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  DetailScreen()));
      },
      child: Container(
        width: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              book.image,
              height: 140.0,
            ),
            const SizedBox(height: 10.0),
            Text(
              book.title,
              style:
                  const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5.0,
            ),
            RatingBar.builder(
                initialRating: 3.5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 10,
                ignoreGestures: true,
                itemPadding: const EdgeInsets.symmetric(horizontal: 0.5),
                itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (rating) {})
            // Text("★️ 3.5", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0, color: Colors.orangeAccent)),
          ],
        ),
      ),
    );
  }

  Widget _makeCategoryEl(String title) {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          color: Color(0xFFF0F2F5)),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
        ),
      ),
    );
  }
}
