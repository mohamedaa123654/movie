import 'package:flutter/material.dart';
import 'package:movie/core/utils/app_constants.dart';

class MovieCard extends StatelessWidget {
  String imageURL;
  String movieName;
  String date;
  String disc;
  double rate;
  Color? backgrowndColor;
  void Function()? onTap;

  MovieCard(
      {required this.imageURL,
      required this.movieName,
      required this.date,
      required this.disc,
      required this.rate,
      this.onTap,
      this.backgrowndColor = Colors.white70});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(SizeConfig.orientation);
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          width: double.infinity,
          height: SizeConfig.h / 7,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),

                spreadRadius: 3,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
                width: SizeConfig.tw * 0.3,
                height: SizeConfig.h / 7,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: SizeConfig.tw * 0.49,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      movieName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          date.substring(0, 4),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        rate.toString(),
                      ),
                    ],
                  ),
                 
                  SizedBox(
                    width: SizeConfig.tw * 0.49,
                    child: Text(
                      disc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          
          ]),
        ),
      ),
    );
  }
}
