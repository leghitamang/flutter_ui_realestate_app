import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:realstate_app/components/property_card.dart';
import 'package:realstate_app/models/property.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<IconData> iconList = [
    Icons.home,
    Icons.compass_calibration_rounded,
    Icons.favorite,
    Icons.chat_bubble_outline,
  ];
  int _bottomNavIndex = 0;

  List<Property> properties = [
    Property(
      name: 'Spring Wood',
      price: '410,000',
      location: 'Moreley Road, Leytom E10',
      image:
          'https://i.pinimg.com/564x/a7/46/7b/a7467b482da58324fe919e629fb8be6d.jpg',
    ),
    Property(
      name: 'Houston Gale',
      price: '319,000',
      location: 'Moreley Road, Leytom E10',
      image:
          'https://i.pinimg.com/564x/aa/96/ca/aa96ca5d86e6abfaa75ec4f77280d413.jpg',
    ),
    Property(
      name: 'White Brandson',
      price: '819,000',
      location: 'Moreley Road, Leytom E10',
      image:
          'https://i.pinimg.com/564x/64/fd/23/64fd23b3a2f35decb8f8afbca8047397.jpg',
    ),
    Property(
      name: 'Morrous Neavy',
      price: '241,900',
      location: 'Moreley Road, Leytom E10',
      image:
          'https://i.pinimg.com/564x/dd/e3/c2/dde3c259cbcd01bd97c28f43fee7d1e6.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFF),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppbar(),
            _buildSearchbar(),
            _buildPropertiesList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff0B1199),
        child: Icon(Icons.send),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: _buildBottombar(),
    );
  }

  _buildAppbar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://i.pinimg.com/564x/1e/ea/13/1eea135a4738f2a0c06813788620e055.jpg'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    //TODO:long text leads to text overflow
                    'Hi, Oiga',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 20,
                  color: Color(0xff0B1199),
                ),
                Text(
                  'London,UK',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildSearchbar() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Property',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xff1F1B17),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xff0B1199),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(8),
                      fillColor: Color(0xffEAF0FC),
                      filled: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff0B1199),
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.filter_list_alt,
                    color: Color(0xffE0E3EA),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '232 properties found',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildPropertiesList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return PropertyCard(properties[index]);
      }, childCount: properties.length),
    );
  }

  _buildBottombar() {
    return AnimatedBottomNavigationBar(
      icons: iconList,
      activeIndex: _bottomNavIndex,
      activeColor: Color(0xff0b1199),
      inactiveColor: Colors.grey,
      gapLocation: GapLocation.end,
      notchSmoothness: NotchSmoothness.smoothEdge,
      onTap: (index) => setState(() => _bottomNavIndex = index),
      //other params
    );
  }
}
