import 'package:flutter/material.dart';
import 'package:realstate_app/models/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  PropertyCard(this.property);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Material(
        //TODO: BorderRadius for the card,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ColorFiltered(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.srcOver),
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(property.image),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: 20,
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(128, 128, 128, .8),
                      radius: 15,
                      child: Icon(
                        Icons.favorite,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          property.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '\$${property.price}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
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
                    SizedBox(height: 5),
                    Row(
                      children: [
                        amenity(
                          icon: Icon(
                            Icons.bathtub,
                            color: Color(0xff74728B),
                          ),
                          title: '2 Baths',
                        ),
                        amenity(
                            icon: Icon(
                              Icons.king_bed_outlined,
                              color: Color(0xff74728B),
                            ),
                            title: '4 Beds'),
                        amenity(
                          icon: Icon(
                            Icons.house_outlined,
                            color: Color(0xff74728B),
                          ),
                          title: '2980 sqft',
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget amenity({Icon icon, String title}) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(title,
                style: TextStyle(
                  color: Color(0xff74728B),
                )),
          ),
        ],
      ),
    );
  }
}
