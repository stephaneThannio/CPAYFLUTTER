import 'package:cpay/models/virementtransact.dart';
import 'package:flutter/material.dart';

class Virement extends StatelessWidget {
  const Virement({super.key});

  @override
  Widget build(BuildContext context) {
    final listtitrevirment = <DataColumn>[
      const DataColumn(label: Text('Date')),
      const DataColumn(label: Text('Montant')),
      const DataColumn(label: Text('Statut')),
      const DataColumn(label: Text('Transfert')),
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
                          columns: listtitrevirment,
                          rows: List<DataRow>.generate(
                              virtransac.length,
                              (index) => DataRow(cells: <DataCell>[
                                    DataCell(
                                      Text(virtransac[index].date),
                                    ),
                                    DataCell(
                                      Text(virtransac[index].montant),
                                    ),
                                    DataCell(
                                      Text(virtransac[index].status),
                                    ),
                                    DataCell(
                                      Text(virtransac[index].transfert),
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
