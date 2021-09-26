import 'package:mflow/src/modules/expense/data_class/expense.dart';
import 'package:mflow/src/modules/expense/service/expense_service.dart';

class ExpenseModel{
  ExpenseService expenseService;

  ExpenseModel({required this.expenseService});

  createExpense(double amount){
    var newExpense = Expense(amount: amount);
    expenseService.saveExpense(newExpense);
  }

  getAllExpenses() {
    return expenseService.getAllExpenses();
  }
}