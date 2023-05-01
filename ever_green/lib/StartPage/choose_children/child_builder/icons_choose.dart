import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChooserAvatar extends StatefulWidget {
  const ChooserAvatar({Key? key}) : super(key: key);

  @override
  State<ChooserAvatar> createState() => _ChooserAvatarState();
}

class _ChooserAvatarState extends State<ChooserAvatar> {
  int activeIndex = 0;
  int childAge = 0;
  String childName = '';
  late List<CircleAvatar> avatars = List.generate(
    9,
    (index) => CircleAvatar(
      radius: 80.0,
      backgroundColor: const Color.fromRGBO(140,199,60, 1),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.asset('assets/profiles/$index.png'),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg-image2.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const SizedBox(width: 50,),
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2, color: Colors.black54),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10,),
                            TextFormField(
                                maxLength: 15,
                                decoration: const InputDecoration(
                                  alignLabelWithHint: true,
                                  labelStyle: TextStyle(
                                    fontFamily: 'Digital',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  label: Center( child: Text('Name'),),
                                ),
                                onChanged: (value) => childName = value),
                            const SizedBox(height: 20,),
                            TextFormField(
                                maxLength: 2,
                                decoration: const InputDecoration(
                                  labelStyle: TextStyle(
                                    fontFamily: 'Digital',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                  label: Center( child: Text('Age'),),
                                ),
                                onChanged: (value) => {
                                  if ( RegExp(r'^[0-9]+$').hasMatch(value) && int.tryParse(value) != null ){
                                    childAge = ((int.tryParse(value))!),
                                  }
                                }),
                            const SizedBox(height: 5

                              ,),
                            Center(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromRGBO(140,199,60, 1),
                                  side: const BorderSide(width: 3, color: Colors.white),
                                  elevation: 0,
                                  shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                ),
                                onPressed: () {print(childAge);},
                                child: const Text('ADD PLAYER !'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 115,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Avatar',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'Digital'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: CarouselSlider.builder(
                              itemCount: avatars.length,
                              itemBuilder: (context, index, realIndex) {
                                return avatars[index];
                              },
                              options: CarouselOptions(
                                  height: 170,
                                  enlargeCenterPage: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      activeIndex = index;
                                    });
                                  })),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AnimatedSmoothIndicator(
                          activeIndex: activeIndex,
                          count: avatars.length,
                          effect: const JumpingDotEffect(
                              dotColor: Colors.white, dotHeight: 10, dotWidth: 10),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
