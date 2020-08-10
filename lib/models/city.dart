part of 'models.dart';

class City extends Equatable {
  final int id;
  final String code;
  final String name;

  City({
    this.id,
    this.code,
    this.name,
  });

  @override
  List<Object> get props => [id, code, name];
}

List<City> cities = [
  City(id: 1, code: "JKT", name: "Jakarta"),
  City(id: 2, code: "BDG", name: "Bandung"),
  City(id: 3, code: "BKS", name: "Bekasi"),
  City(id: 4, code: "TGR", name: "Tangerang"),
  City(id: 5, code: "BGR", name: "Bogor"),
  City(id: 6, code: "DPK", name: "Depok"),
  City(id: 7, code: "SRB", name: "Surabaya"),
  City(id: 8, code: "YGY", name: "Yogyakarta"),
  City(id: 9, code: "SMR", name: "Semarang"),
  City(id: 10, code: "PKR", name: "Pekanbaru"),
  City(id: 11, code: "MKS", name: "Makassar"),
];
