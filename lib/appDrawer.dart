import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

class appDrawer extends StatelessWidget {
  appDrawer({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          //profile part
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  color: const Color(0xfffd9444),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: Text(
                  'cl-AIR-ity',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w600,
                    height: 0.96,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            
              
                    // Adobe XD layer: 'avatar' (group)
                    // Adobe XD layer: 'name' (group)
                   
                    
                       Text(
                        'Swaraj Bhagade',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    
                   Text(
                        'Aurangabad, India',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: const Color(0xffffffff),
                          height: 1.6,
                        ),
                        textAlign: TextAlign.left,
                      ),
            
              
            ],
          ),

          // Adobe XD layer: 'Menu' (group)
          Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-6.0, 111.0),
                child:
                    // Adobe XD layer: 'menu' (group)
                    Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(83.0, 107.0),
                      child: Text(
                        'AQI',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          height: 2.4,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(83.0, 216.0),
                      child: Text(
                        'Graphs',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          height: 2.4,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(83.0, 325.0),
                      child: Text(
                        'Insights',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w600,
                          height: 2.4,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(33.0, 345.0),
                      child:
                          // Adobe XD layer: 'Messages' (component)
                          Container(),
                    ),
                    Transform.translate(
                      offset: Offset(33.0, 236.0),
                      child:
                          // Adobe XD layer: 'graphs' (component)
                          Container(),
                    ),
                    Transform.translate(
                      offset: Offset(33.0, 127.0),
                      child:
                          // Adobe XD layer: 'aqi' (component)
                          Container(),
                    ),
                    Transform.translate(
                      offset: Offset(33.0, 563.0),
                      child:
                          // Adobe XD layer: 'signout' (shape)
                          SvgPicture.string(
                        _shapeSVG_19ce7906dbec41ecba8d55a820db9344,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(32.0, 455.0),
                      child:
                          // Adobe XD layer: 'faq' (component)
                          Container(),
                    ),
                    Transform.translate(
                      offset: Offset(78.0, 434.0),
                      child:
                          // Adobe XD layer: 'FAQ' (text)
                          SizedBox(
                        width: 50.0,
                        child: Text(
                          'FAQ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            height: 2.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(79.0, 543.0),
                      child:
                          // Adobe XD layer: 'Signout' (text)
                          SizedBox(
                        width: 92.0,
                        child: Text(
                          'Signout',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: const Color(0xff000000),
                            fontWeight: FontWeight.w600,
                            height: 2.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Adobe XD layer: 'Profile' (group)
            ],
          ),
        ],
      ),
    );
  }
}

const String _shapeSVG_19ce7906dbec41ecba8d55a820db9344 =
    '<svg viewBox="33.0 563.0 25.0 25.0" ><path transform="translate(33.0, 563.0)" d="M 0 25 L 0 21.8753547668457 C 0 18.43714332580566 5.624929428100586 15.62459278106689 12.5 15.62459278106689 C 19.37506866455078 15.62459278106689 25 18.43714332580566 25 21.8753547668457 L 25 25 L 0 25 Z M 6.249297142028809 6.250762939453125 C 6.249297142028809 2.7984619140625 9.047698974609375 0 12.5 0 C 15.95089435577393 0 18.74929618835449 2.7984619140625 18.74929618835449 6.250762939453125 C 18.74929618835449 9.7015380859375 15.95089435577393 12.50005054473877 12.5 12.50005054473877 C 9.047698974609375 12.50005054473877 6.249297142028809 9.7015380859375 6.249297142028809 6.250762939453125 Z" fill="#cccccc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _shapeSVG_5b5ec791a35c4001b53bd2117d5e6cf3 =
    '<svg viewBox="68.9 359.4 15.0 15.0" ><path transform="translate(68.88, 359.39)" d="M 0 15 L 0 13.12521362304688 C 0 11.06228637695312 3.374957799911499 9.374755859375 7.5 9.374755859375 C 11.62504100799561 9.374755859375 15 11.06228637695312 15 13.12521362304688 L 15 15 L 0 15 Z M 3.749578237533569 3.750457763671875 C 3.749578237533569 1.6790771484375 5.428619384765625 0 7.5 0 C 9.570536613464355 0 11.24957847595215 1.6790771484375 11.24957847595215 3.750457763671875 C 11.24957847595215 5.8209228515625 9.570536613464355 7.500030517578125 7.5 7.500030517578125 C 5.428619384765625 7.500030517578125 3.749578237533569 5.8209228515625 3.749578237533569 3.750457763671875 Z" fill="#fd9444" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
