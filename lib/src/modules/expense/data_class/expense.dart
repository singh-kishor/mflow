class Expense{
  final int? id;
  final double amount;

  Expense({required this.amount, this.id});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'amount': amount
    };
  }

  Map<String, dynamic> toMapWithoutId(){
    return {
      'amount': amount
    };
  }

  static Expense fromMap(Map<String, dynamic> expenseMap){
    return Expense(id: expenseMap['id'], amount: expenseMap['amount']);
  }

  @override
  String toString() {
    return 'Dog{id: $id, amount: $amount}';
  }
}