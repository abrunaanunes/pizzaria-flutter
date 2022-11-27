import 'package:hive/hive.dart';
part 'price.g.dart';

@HiveType(typeId: 1)
class Price {
  @HiveField(0)
  double small;

  @HiveField(1)
  double large;

  @HiveField(2)
  double extraLarge;

  Price({
    required this.small,
    required this.large,
    required this.extraLarge,
  });
}
