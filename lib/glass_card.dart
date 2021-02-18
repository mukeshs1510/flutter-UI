import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class GlassCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          'assets/backkkkk.jpg',
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.2)),
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.05),
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      right: 18,
                      child: Container(
                        height: size.height * 0.3 * 0.22,
                        width: size.width * 0.85 * 0.22,
                        child: Image.asset('assets/visa.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.3 * 0.40,
                      left: 18,
                      child: Container(
                        height: size.height * 0.3 * 0.22,
                        child: Image.asset('assets/chip_atm.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.3 * 0.62,
                      left: 23,
                      child: Container(
                        child: Text(
                          '1002 1741 4161 0033',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                              decoration: TextDecoration.none,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 24,
                      left: 23,
                      child: Container(
                        child: Text(
                          'Lazzy Engineer',
                          style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 26,
                      right: 18,
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '03/20',
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              child: Text(
                                '03/23',
                                style: GoogleFonts.lato(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
