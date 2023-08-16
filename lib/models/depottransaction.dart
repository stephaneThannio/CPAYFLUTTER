class Depotransaction {
  String date;
  String montant;
  String status;
  String payment;
  Depotransaction(
      {required this.date,
      required this.montant,
      required this.status,
      required this.payment});
}

List<Depotransaction> depotTransaction = [
  Depotransaction(
      date: '28-02-2022',
      montant: '10 000 MGA',
      status: 'En Attente',
      payment: "virement bancaire"),
  Depotransaction(
      date: '19-02-2022',
      montant: '50 000 MGA',
      status: 'En Attente',
      payment: "virement bancaire"),
  Depotransaction(
      date: '20-02-2022',
      montant: '30 000 MGA',
      status: 'En Attente',
      payment: "virement bancaire"),
  Depotransaction(
      date: '20-02-2022',
      montant: '30 000 MGA',
      status: 'En Attente',
      payment: "virement bancaire"),
  Depotransaction(
      date: '20-02-2022',
      montant: '30 000 MGA',
      status: 'En Attente',
      payment: "virement bancaire")
];
