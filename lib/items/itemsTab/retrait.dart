import 'package:flutter/material.dart';

import '../../models/retraittrans.dart';

class Retrait extends StatelessWidget {
  const Retrait({super.key});

  @override
  Widget build(BuildContext context) {
    final listretraittitre = <DataColumn>[
      const DataColumn(label: Text('Date')),
      const DataColumn(label: Text('Montant')),
      const DataColumn(label: Text('Statut')),
      const DataColumn(label: Text('Type')),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minWidth: constraints.maxWidth),
                        child: DataTable(
                          columns: listretraittitre,
                          rows: List<DataRow>.generate(
                              retraittransac.length,
                              (index) => DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(retraittransac[index].date),
                                    ),
                                    DataCell(
                                      Text(retraittransac[index].montant),
                                    ),
                                    DataCell(
                                      Text(retraittransac[index].status),
                                    ),
                                    DataCell(
                                      Text(retraittransac[index].type),
                                    )
                                  ])),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
