import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/card_container_column.dart';
import '../../../../../core/widgets/card_container.dart';
import '../../../../../core/widgets/circle_image.dart';

List<String> imagesUrl = [
  'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jb3RyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
  'https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg',
  'https://t4.ftcdn.net/jpg/03/05/41/27/360_F_305412791_XRNiWaFCREjLLpSQfj0e736foBoYXXYv.jpg',
];

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: "Your Doctors",
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleImage(
              image: Image.network(
                imagesUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[2],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[1],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[2],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[0],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[2],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[1],
                fit: BoxFit.cover,
              ),
            ),
            CircleImage(
              image: Image.network(
                imagesUrl[2],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
