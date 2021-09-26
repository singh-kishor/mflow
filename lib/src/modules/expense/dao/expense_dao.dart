import 'package:mflow/src/modules/expense/data_class/expense.dart';
import 'package:sqflite/sqflite.dart';

class ExpenseDao{

  Database database;

  ExpenseDao({required this.database});

  Future<void> insert(Expense expense) async {
    await database.insert('Expense', expense.toMapWithoutId());
  }

  Future<List<Expense>> selectAll() async {
    List<Map<String, dynamic>> dogsAsMaps = await database.query('Expense');
    List<Expense> allExpenses = List.generate(dogsAsMaps.length, (index) => Expense.fromMap(dogsAsMaps[index]));
    return allExpenses;
  }

  Future<void> update(Expense updatedExpense) async {
    await database.update('Expense', updatedExpense.toMapWithoutId(), where: 'id = ?', whereArgs: [updatedExpense.id]);
  }

  delete(Expense expense) async {
    await database.delete('Expense', where: 'id = ?', whereArgs: [expense.id]);
  }
}