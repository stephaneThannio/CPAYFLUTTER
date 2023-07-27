import 'package:flutter/material.dart';

import '../../models/depottransaction.dart';

class Depot extends StatelessWidget {
  const Depot({super.key});

  @override
  Widget build(BuildContext context) {
    final listTitleDeposit = <DataColumn>[
      const DataColumn(label: Text('Date')),
      const DataColumn(label: Text('Montant')),
      const DataColumn(label: Text('Statut')),
      const DataColumn(label: Text('Payement')),
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
                          columns: listTitleDeposit,
                          rows: List<DataRow>.generate(
                              depotTransaction.length,
                              (index) => DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(depotTransaction[index].date),
                                    ),
                                    DataCell(
                                      Text(depotTransaction[index].montant),
                                    ),
                                    DataCell(
                                      Text(depotTransaction[index].status),
                                    ),
                                    DataCell(
                                      Text(depotTransaction[index].payment),
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
