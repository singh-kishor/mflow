import 'package:mflow/src/modules/expense/dao/expense_dao.dart';
import 'package:mflow/src/modules/expense/data_class/expense.dart';

class ExpenseService{

  ExpenseDao expenseDao;

  ExpenseService({required this.expenseDao});

  saveExpense(Expense expense) async {
    expenseDao.insert(expense);
  }

  Future<List<Expense>> getAllExpenses() {
    return expenseDao.selectAll();
  }
}