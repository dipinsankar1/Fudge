import 'package:flutter/material.dart';
import 'package:fudge/Screens/card_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class tittle_Box extends StatelessWidget {
  tittle_Box({
    required this.titleText,
  });

  String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
              ),
              child: Text(
                titleText,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CardScreen(),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/more.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(9),
                  ),
                  height: 30,
                  width: 60,
                ),
              ),
            ),
          ],
        ));
  }
}
