import 'package:flutter/material.dart';

class CardPayload {
  final String cardTitle;
  final String cardDescription;
  const CardPayload(this.cardTitle, this.cardDescription);
}

class CardSlider extends StatelessWidget {
  final String carouselName;
  final int cardsCount;
  final List<CardPayload> cardPayload;
  final Function? onLast;

  const CardSlider(
      {Key? key,
      required this.carouselName,
      required this.cardsCount,
      required this.cardPayload,
      this.onLast})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('${carouselName}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cardPayload.length,
                itemBuilder: (_, int index) {
                  return _CardPoster(
                    cardPayload[index].cardTitle,
                    cardPayload[index].cardDescription,
                    onTap: index + 1 < cardsCount ? null : onLast,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _CardPoster extends StatelessWidget {
  final String cardTitle;
  final String cardDescription;
  Function? onTap;

  _CardPoster(this.cardTitle, this.cardDescription, {this.onTap});

  @override
  Widget build(BuildContext context) {
    //envolver en un GestureDetector, para usar el onTab y moverse a otra ventana
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: () => {onTap!()},
        child: Container(
          width: 130,
          height: 190,
          color: Color.fromARGB(255, 11, 111, 134),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Text(cardTitle),
              Text(
                cardDescription,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
