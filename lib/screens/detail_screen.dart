import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:realstate_app/models/property.dart';

class DetailScreen extends StatelessWidget {
  final Property property;

  DetailScreen(this.property);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppbar(),
          _buildPropertyImages(),
          _buildGeneralDetails(),
          _buildHeading(),
          _buildDetailsTab(),
          _buildDetailContent(),
        ],
      ),
      bottomNavigationBar: _buildBottombar(),
    );
  }

  Widget _buildBottombar() {
    return Builder(
      builder: (context) => Container(
        height: 100,
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff0B1199),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Icon(
                    Icons.favorite_outline,
                    size: 26,
                    color: Color(0xff0B1199),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff0B1199),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Send email',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Icon(Icons.phone, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailContent() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vel lectus lorem. Suspendisse malesuada dolor nec congue scelerisque. Cras ultrices placerat augue, eu ullamcorper est tristique sed. Etiam erat justo, mollis imperdiet euismod eget, maximus in erat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque aliquam aliquam elit. Mauris non lobortis neque. Aliquam dapibus sem in aliquam porta. Nam eget placerat quam, ac consectetur ligula. ',
        ),
      ),
    );
  }

  Widget _buildDetailsTab() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        height: 45,
        child: ListView(
          children: [
            _customDetailTab(
              title: 'Overview',
              selected: true,
              onTap: () {},
            ),
            _customDetailTab(
              title: 'Features',
              selected: false,
              onTap: () {},
            ),
            _customDetailTab(
              title: 'House Value',
              selected: false,
              onTap: () {},
            ),
            _customDetailTab(
              title: 'Neighbours',
              selected: false,
              onTap: () {},
            ),
          ],
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget _customDetailTab({String title, bool selected, Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: selected ? 5 : 0),
        height: 50,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: selected
            ? BoxDecoration(
                color: Color(0xffEAF0FC),
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(
                color: Colors.transparent,
              ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Color(0xff0B1199) : Color(0xff74728B),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text(
          'Detail',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildAppbar() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          icon: Icon(Icons.ios_share),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildPropertyImages() {
    return SliverToBoxAdapter(
      child: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.only(right: 5),
                      child: Image.network(
                        property.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 20,
                      bottom: 15,
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Text(
                              '360\u2070 View ',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff0b1199),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/0b/47/dc/0b47dc4de4c1cfdabaea501e923a3256.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.all(.1),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff0b1199),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff0b1199),
                          image: DecorationImage(
                            image: NetworkImage(property.image),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xff74728B),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '+5',
                        style: TextStyle(
                          color: Color(0xff74728B),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff0b1199),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/564x/0b/47/dc/0b47dc4de4c1cfdabaea501e923a3256.jpg'),
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralDetails() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  property.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$${property.price}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(
                  Icons.location_pin,
                  size: 18,
                  color: Color(0xff74728B),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3),
                  child: Text(
                    property.location,
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xff74728B),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                _buildAmenity(
                  icon: Icon(
                    Icons.bathtub,
                    color: Color(0xff74728B),
                  ),
                  title: 'Bathrooms',
                  value: '2',
                ),
                _buildAmenity(
                  icon: Icon(
                    Icons.king_bed_outlined,
                    color: Color(0xff74728B),
                  ),
                  title: 'Bedrooms',
                  value: '4',
                ),
                _buildAmenity(
                  icon: Icon(
                    Icons.house_outlined,
                    color: Color(0xff74728B),
                  ),
                  title: 'Area',
                  value: '2980 ft',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAmenity({Icon icon, String title, String value}) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  value,
                  style: TextStyle(
                    color: Color(0xff74728B),
                  ),
                ),
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              color: Color(0xff74728B),
            ),
          ),
        ],
      ),
    );
  }
}
