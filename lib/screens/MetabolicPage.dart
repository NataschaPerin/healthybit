// pagina dove verrano indicate le calore consumate (ricavate dai dati Fitbit)
// e quelle necessarie (formula da trovare), rimanda poi alla pagina dove si
//inseriscono le calore assunte tramite cibo

import 'package:flutter/material.dart';
import 'package:healthybit/screens/Calories.dart';
import 'package:healthybit/screens/Informations.dart';
import 'package:healthybit/screens/Login.dart';
import 'package:healthybit/screens/editProfile.dart';
import 'package:healthybit/screens/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:healthybit/utils/strings.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:healthybit/database/entities/food.dart';
import 'package:healthybit/repositories/databaseRepository.dart';
import 'package:healthybit/widgets/formTiles.dart';
import 'package:healthybit/widgets/formSeparator.dart';
import 'package:healthybit/utils/formats.dart';
import 'package:provider/provider.dart';

//This is the class that implement the page to be used to edit existing meals and add new meals.
//This is a StatefulWidget since it needs to rebuild when the form fields change.
class MetabolicPage extends StatefulWidget {
  //We are passing the Meal to be edited. If it is null, the business logic will know that we are adding a new
  //Meal instead.
  final Food? food;

  //MealPage constructor
  MetabolicPage({Key? key, required this.food}) : super(key: key);

  static const route = '/MetabolicPage';
  static const routeDisplayName = 'Metabolic page';

  @override
  State<MetabolicPage> createState() => _MetabolicPageState();
} //MealPage

//Class that manages the state of MealPage
class _MetabolicPageState extends State<MetabolicPage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain the current form fields values in memory.
  TextEditingController _nameController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _carbohydratesController = TextEditingController();
  TextEditingController _proteinsController = TextEditingController();
  TextEditingController _lipidsController = TextEditingController();
  TextEditingController _caloriesController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  //Here, we are using initState() to initialize the form fields values.
  //Rationale: Meal content and time are not known is the meal is new (meal == null).
  // In this case, initilize them to empty and now(), respectively, otherwise set them to the respective values.
  @override
  void initState() {
    _nameController.text = widget.food == null ? '' : widget.food!.name;
    _weightController.text =
        widget.food == null ? '' : widget.food!.weight.toString();
    _carbohydratesController.text =
        widget.food == null ? '' : widget.food!.carbohydrates.toString();
    _proteinsController.text =
        widget.food == null ? '' : widget.food!.proteins.toString();
    _lipidsController.text =
        widget.food == null ? '' : widget.food!.lipids.toString();
    _caloriesController.text =
        widget.food == null ? '' : widget.food!.calories.toString();
    _selectedDate =
        widget.food == null ? DateTime.now() : widget.food!.dateTime;
    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _carbohydratesController.dispose();
    _proteinsController.dispose();
    _lipidsController.dispose();
    _caloriesController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {
    //Print the route display name for debugging
    print('${MetabolicPage.routeDisplayName} built');

    //The page is composed of a form. An action in the AppBar is used to validate and save the information provided by the user.
    //A FAB is showed to provide the "delete" functinality. It is showed only if the meal already exists.
    return Scaffold(
      appBar: AppBar(
        title: Text(MetabolicPage.routeDisplayName),
        actions: [
          IconButton(
            onPressed: () => _validateAndSave(context),
            icon: Icon(Icons.done),
          )
        ],
      ),
      body: Center(
        child: _buildForm(context),
      ),
      floatingActionButton: widget.food == null
          ? null
          : FloatingActionButton(
              onPressed: () => _deleteAndPop(context),
              child: Icon(Icons.delete),
            ),
    );
  } //build

  //Utility method used to build the form.
  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: 'Food name'),
            FormTextTile(
                labelText: 'Name',
                controller: _nameController,
                icon: MdiIcons.silverwareFork),
            FormSeparator(label: 'Raw Weight'),
            FormNumberTile(
              labelText: 'Weight',
              controller: _weightController,
              icon: MdiIcons.scaleUnbalanced,
            ),
            FormSeparator(label: 'Carbohydrates'),
            FormNumberTile(
              labelText: 'Carbohydrates',
              controller: _carbohydratesController,
              icon: MdiIcons.noodles,
            ),
            FormSeparator(label: 'Proteins'),
            FormNumberTile(
              labelText: 'Proteins',
              controller: _proteinsController,
              icon: MdiIcons.foodDrumstickOffOutline,
            ),
            FormSeparator(label: 'Lipids'),
            FormNumberTile(
              labelText: 'Lipids',
              controller: _lipidsController,
              icon: MdiIcons.peanutOutline,
            ),
            FormSeparator(label: 'Calories'),
            FormNumberTile(
              labelText: 'Calories',
              controller: _caloriesController,
              icon: MdiIcons.fire,
            ),
            FormSeparator(label: 'Meal time'),
            FormDateTile(
              labelText: 'Meal Time',
              date: _selectedDate,
              icon: MdiIcons.clockTimeFourOutline,
              onPressed: () {
                _selectDate(context);
              },
              dateFormat: Formats.fullDateFormatNoSeconds,
            ),
          ],
        ),
      ),
    );
  } // _buildForm

  //Utility method that implements a Date+Time picker.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2010),
            lastDate: DateTime(2101))
        .then((value) async {
      if (value != null) {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime:
              TimeOfDay(hour: _selectedDate.hour, minute: _selectedDate.minute),
        );
        return pickedTime != null
            ? value.add(
                Duration(hours: pickedTime.hour, minutes: pickedTime.minute))
            : null;
      }
      return null;
    });
    if (picked != null && picked != _selectedDate)
      //Here, I'm using setState to update the _selectedDate field and rebuild the UI.
      setState(() {
        _selectedDate = picked;
      });
  } //_selectDate

  //Utility method that validate the form and, if it is valid, save the new meal information.
  void _validateAndSave(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //If the original Meal passed to the MealPage was null, then add a new Meal...
      if (widget.food == null) {
        Food newFood = Food(
            null,
            _nameController.text,
            double.parse(_weightController.text),
            double.parse(_carbohydratesController.text),
            double.parse(_proteinsController.text),
            double.parse(_lipidsController.text),
            double.parse(_caloriesController.text),
            _selectedDate);
        await Provider.of<DatabaseRepository>(context, listen: false)
            .insertFood(newFood);
      } //if
      //...otherwise, edit it.
      else {
        Food updatedFood = Food(
            widget.food!.id,
            _nameController.text,
            double.parse(_weightController.text),
            double.parse(_carbohydratesController.text),
            double.parse(_proteinsController.text),
            double.parse(_lipidsController.text),
            double.parse(_caloriesController.text),
            _selectedDate);
        await Provider.of<DatabaseRepository>(context, listen: false)
            .updateFood(updatedFood);
      } //else
      Navigator.pop(context);
    } //if
  } // _validateAndSave

  //Utility method that deletes a meal entry.
  void _deleteAndPop(BuildContext context) async {
    await Provider.of<DatabaseRepository>(context, listen: false)
        .removeFood(widget.food!);
    Navigator.pop(context);
  } //_deleteAndPop
} //MetabolicPage
