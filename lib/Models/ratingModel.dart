class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.count, required this.rate});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
      count: jsonData['count'] as int,
      rate: (jsonData['rate'] as num).toDouble(),
    );
  }
}
