class Virement {
  String date;
  String montant;
  String status;
  String transfert;
  Virement(
      {required this.date,
      required this.montant,
      required this.status,
      required this.transfert});
}

List<Virement> virtransac = [
  Virement(
      date: '28-02-2022',
      montant: '10 000 MGA',
      status: 'Valide',
      transfert: "cpay virement vers CPAY123456789"),
  Virement(
      date: '19-02-2022',
      montant: '50 000 MGA',
      status: 'Valide',
      transfert: "cpay virement vers CPAY123456789"),
  Virement(
      date: '20-02-2022',
      montant: '30 000 MGA',
      status: 'Valide',
      transfert: "cpay virement vers CPAY123456789")
];
