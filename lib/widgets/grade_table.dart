import 'package:flutter/material.dart';

class GradeTable extends StatelessWidget {
  const GradeTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[  
            const Center(  
                child: Text(  
                  'People-Chart',  
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                )),  
            Center(
              child: DataTable(  
                columns: const [  
                  DataColumn(label: Text(  
                      'NL',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),  
                  DataColumn(label: Text(  
                      'Nombre',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                  )),  
                  DataColumn(label: Text(  
                      'Calificación',  
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                  )),  
                ],  
                rows: const [  
                  DataRow(cells: [  
                    DataCell(Text('1')),  
                    DataCell(Text('Stephen')),  
                    DataCell(Text('8')),  
                  ]),  
                  DataRow(cells: [  
                    DataCell(Text('2')),  
                    DataCell(Text('John')),  
                    DataCell(Text('9')),  
                  ]),  
                  DataRow(cells: [  
                    DataCell(Text('3')),  
                    DataCell(Text('Harry')),  
                    DataCell(Text('10')),  
                  ]),  
                  DataRow(cells: [  
                    DataCell(Text('4')),  
                    DataCell(Text('Peter')),  
                    DataCell(Text('3')),  
                  ]),  
                ],  
              ),
            ),  
          ]);
  }
}