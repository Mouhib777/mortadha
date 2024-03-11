import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  double? rating;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          // column principal l 9assemt beha page
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .center, // amlt'ha besh yabda mn center (vertical)
            crossAxisAlignment: CrossAxisAlignment
                .start, // amlt'ha besh yabda mn lissar (horizontal)
            children: [
              Text(
                "Ratings and reviews are verified and are from people who use the same type of device that you use.",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                children: [
                  Text(
                    "4.7",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
                  ),
                  SizedBox(
                    width: screenWidth * 0.17,
                  ),
                  // column li feha progress 5 - 4 - 3 - 2 - 1
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "5",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            "4",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: Stack(
                              children: [
                                Container(
                                  width: 180,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            "3",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Container(
                            width: 200,
                            height: 20,
                            child: Stack(
                              children: [
                                Container(
                                  width: 160,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Container(
                            width: 200,
                            height: 15,
                            child: Stack(
                              children: [
                                Container(
                                  width: 140,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.005,
                      ),
                      Row(
                        children: [
                          Text(
                            "1",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: screenWidth * 0.04,
                          ),
                          Container(
                            width: 200,
                            height: 15,
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              //bdina column jdida
              //BEGIN

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StarRating(
                      rating: 3.7 /* houni t7ot review average example 3.7*/),
                  SizedBox(width: 5),
                  Text(
                    '12.611', // houni t7ot nombre total te3 reviews
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight*0.05,),

              //END
              //khrajna mn column edhika
              // houni amtlek review static ama besh t7otou f return te3 ListView.Builder
              //ask chat gpt for help, juste atih li maktoub louta w kolou hotou f return te3 listview builder  :D
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.blue,// en cas famesh taswira besh f release todhher moshkolt null si non yati couleur par defaut
                        // backgroundImage: 
                        // houni shtaaml if statement  
                        // on suppose image url te3k jeyk mn api haka <review"[user_image_url"]>
                        // review"[user_image_url"] != null ? NetworkImage("url") : null
                        // akeka maatinesh backgroundImage w todhher circle lounha zar9a fergha 
                        // taaml hakka besh tebaad mn mashekl null 
                        
                      ) , 
                      SizedBox(width: screenWidth*0.02,),
                      Text("John Doe", 
                      style: TextStyle(
                        fontWeight: FontWeight.w600 , 
                        fontSize: 16
                      ),
                      ), 
                    ],
                  ), 
                  SizedBox(height: screenHeight*0.01,),
                  Row(
                    children: [
                       _buildStarRating(3),  // f 3oudh 3 t7ot nombre l jeyek mn api 
                       SizedBox(width: screenWidth*0.01,) , 
                       Text("01-Nov-2023")

                    ],
                  )
                 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// edheya widget te3 rating fi west comment (review)
  Widget _buildStarRating(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(Icon(Icons.star, size: 14, color: Colors.blue));
      } else {
        stars.add(Icon(Icons.star_border, size: 14, color: Colors.grey));
      }
    }
    return Row(children: stars);
  }
}

// houni amlna class jdina li average review
class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final IconData filledStar;
  final IconData halfStar;
  final IconData emptyStar;

  StarRating({
    this.rating = 0.0,
    this.size = 30,
    this.color = Colors.blue,
    this.filledStar = Icons.star,
    this.halfStar = Icons.star_half,
    this.emptyStar = Icons.star_border,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(
            filledStar,
            size: size,
            color: color,
          );
        } else if (index == rating.floor() && rating % 1 != 0) {
          return Icon(
            halfStar,
            size: size,
            color: color,
          );
        } else {
          return Icon(
            emptyStar,
            size: size,
            color: color,
          );
        }
      }),
    );
  }
}
