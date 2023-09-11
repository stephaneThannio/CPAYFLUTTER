class Modeltradenet {
  final DateTime date;
  final double open;
  final double high;
  final double low;
  final double close;

  Modeltradenet({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
  // factory Modeltradenet.fromJson(Map<String, dynamic> json) => Modeltradenet(
  //       date: json.keys.first,
  //       open: json[json.keys.first]['1. open'],
  //       high: json[json.keys.first]['2. high'],
  //       low: json[json.keys.first]['3. low'],
  //       close: json[json.keys.first]['4. close'],
  //     );
  // Map<String, dynamic> toMap() => {
  //       'Time Series (1min)': date,
  //       '1. open': open,
  //       '2. high': high,
  //       '3. low': low,
  //       '4. close': close,
  //     };
}

List<Modeltradenet> listaftertransform(Map<String, dynamic> jsonData) {
  List<Modeltradenet> datalist = [];
  // datalist.add(Modeltradenet(
  //   date: DateTime.now().add(Duration(hours: 1)),
  //   open: double.parse("0.0"),
  //   high: double.parse("0.0"),
  //   low: double.parse("0.0"),
  //   close: double.parse("0.0"),
  //   //1.082
  // ));
  jsonData.forEach((key, value) {
    DateTime date = DateTime.parse(key);
    double open = double.parse(value['1. open']);
    double high = double.parse(value['2. high']);
    double low = double.parse(value['3. low']);
    double close = double.parse(value['4. close']);
    datalist.add(Modeltradenet(
      date: date,
      open: open,
      high: high,
      low: low,
      close: close,
    ));
  });
  return datalist;
}

//List<Modeltradenet> modeltradedatalist = listaftertransform(jsonData);
