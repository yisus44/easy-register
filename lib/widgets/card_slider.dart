import 'package:flutter/material.dart';

class CardSlider extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 260,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 20),
            child: Text('Clases', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold)
            ),
          ),

          const SizedBox( height: 5 ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, int index)=> _CardPoster()
            ),
          ),

        ],
      ),
    );
  }
}

class _CardPoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //envolver en un GestureDetector, para usar el onTab y moverse a otra ventana
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 130,
        height: 190,
        color: Color.fromARGB(255, 11, 111, 134),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15 ),
        child: Column(
          children: const [
    
            SizedBox( height: 5 ),
    
            Text('Nombre de la clase'),
            Text(
              'Descripcion',
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}