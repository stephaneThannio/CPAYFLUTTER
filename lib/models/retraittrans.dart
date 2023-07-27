class Retrait {
  String date;
  String montant;
  String status;
  String type;
  Retrait(
      {required this.date,
      required this.montant,
      required this.status,
      required this.type});
}

List<Retrait> retraittransac = [
  Retrait(
      date: '28-02-2022',
      montant: '10 000 MGA',
      status: 'Valide',
      type: "cpay demande retrait"),
  Retrait(
      date: '19-02-2022',
      montant: '50 000 MGA',
      status: 'Rejete',
      type: "cpay demande retrait"),
  Retrait(
      date: '20-02-2022',
      montant: '30 000 MGA',
      status: 'Rejete',
      type: "cpay demande retrait")
];
