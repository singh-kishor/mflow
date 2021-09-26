import 'package:flutter/material.dart';
import 'package:mflow/src/modules/expense/dao/expense_dao.dart';
import 'package:mflow/src/modules/expense/model/expense_model.dart';
import 'package:mflow/src/modules/expense/service/expense_service.dart';
import 'package:mflow/src/storage/db/sqflite/sqlite_db.dart';
import 'package:mflow/src/util/model_registry.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

class ModelProvider{}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SqliteDB.setup();

  // Dependencies
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  // Models
  var expenseDao = ExpenseDao(database: SqliteDB.database);
  var expenseService = ExpenseService(expenseDao: expenseDao);
  var expenseModel = ExpenseModel(expenseService: expenseService);
  ModelRegistry.register(ExpenseModel, expenseModel);


  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
