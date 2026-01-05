class DailyBill {
  final DateTime date;

  final bool breakfastTaken;
  final bool lunchTaken;
  final bool dinnerTaken;
  final bool snacksTaken;

  final int totalAmount;

  DailyBill({
    required this.date,
    required this.breakfastTaken,
    required this.lunchTaken,
    required this.dinnerTaken,
    required this.snacksTaken,
    required this.totalAmount,
  });
}
