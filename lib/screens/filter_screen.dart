import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<PropertyTypeFilter> propertyType = [
    PropertyTypeFilter(title: 'Any', selected: false),
    PropertyTypeFilter(title: 'Apartment', selected: true),
    PropertyTypeFilter(title: 'Townhouse', selected: false),
    PropertyTypeFilter(title: 'Landplotting', selected: false),
  ];

  List<BedroomTypeFilter> bedroomNumber = [
    BedroomTypeFilter(title: 'Studio', selected: true),
    BedroomTypeFilter(title: '1', selected: false),
    BedroomTypeFilter(title: '2', selected: false),
    BedroomTypeFilter(title: '3', selected: false),
    BedroomTypeFilter(title: '4+', selected: false),
  ];
  List<FacilityTypeFilter> facilityType = [
    FacilityTypeFilter(
      title: 'Train',
      selected: false,
      icon: Icons.train,
    ),
    FacilityTypeFilter(
      title: 'Gym',
      selected: true,
      icon: Icons.fiber_smart_record_outlined,
    ),
    FacilityTypeFilter(
      title: 'Garage',
      selected: false,
      icon: Icons.car_repair,
    ),
    FacilityTypeFilter(
      title: 'Cafe',
      selected: false,
      icon: Icons.shopping_bag_rounded,
    ),
    FacilityTypeFilter(
      title: 'Ground',
      selected: false,
      icon: Icons.text_fields,
    ),
  ];

  var selectedRange = RangeValues(100000, 900000);

  static List<String> locations = [
    'London, UK',
    'Florida, USA',
    'Tokyo, Japan',
  ];

  String locationSpinnerValue = locations[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _buildAppbar(),
            _buildFilterTitle('Property Type'),
            _buildFilterChips(propertyType),
            _buildPriceRangeFilter(),
            _buildFilterTitle('Preffered locations'),
            _buildLocationFilter(),
            _buildFilterTitle('Bedrooms'),
            _buildFilterChips(bedroomNumber),
            _buildFilterTitle('Choose Facilities'),
            _buildFacilityFilter(facilityType),
          ],
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return SliverToBoxAdapter(
      child: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close)),
              Text(
                'Filter',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                textColor: Color(0xff0b1199),
                color: Color(0xffEAF0FC),
                child: Text('Reset'),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterTitle(String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChips(List filterList) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 20),
        height: 45,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                filterList[index].title,
                style: TextStyle(
                  color:
                      filterList[index].selected ? Colors.white : Colors.black,
                ),
              ),
              decoration: filterList[index].selected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0b1199),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff0b1199)),
                    ),
            );
          },
          itemCount: filterList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _buildPriceRangeFilter() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price Range',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${selectedRange.start.toInt()} - \$${selectedRange.end.toInt()}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff0b1199),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            RangeSlider(
              values: selectedRange,
              min: 0,
              max: 1000000,
              activeColor: Color(0xff0b1199),
              divisions: 10,
              onChanged: (RangeValues rangeValue) {
                setState(() {
                  selectedRange = rangeValue;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLocationFilter() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: DropdownButton(
          value: locationSpinnerValue,
          items: locations.map((course) {
            return DropdownMenuItem(
              child: Text(
                course,
                overflow: TextOverflow.ellipsis,
              ),
              value: course,
            );
          }).toList(),
          onChanged: (selectedLocation) {
            setState(
              () {
                locationSpinnerValue = selectedLocation;
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildFacilityFilter(filterList) {
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 20),
        height: 80,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(right: 10),
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Icon(
                    filterList[index].icon,
                    color: filterList[index].selected
                        ? Colors.white
                        : Colors.black,
                  ),
                  SizedBox(height: 5),
                  Text(
                    filterList[index].title,
                    style: TextStyle(
                      color: filterList[index].selected
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
              decoration: filterList[index].selected
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0b1199),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color(0xff0b1199)),
                    ),
            );
          },
          itemCount: filterList.length,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class PropertyTypeFilter {
  String title;
  bool selected;
  PropertyTypeFilter({this.title, this.selected});
}

class BedroomTypeFilter {
  String title;
  bool selected;
  BedroomTypeFilter({this.title, this.selected});
}

class FacilityTypeFilter {
  String title;
  bool selected;
  IconData icon;
  FacilityTypeFilter({this.title, this.icon, this.selected});
}
