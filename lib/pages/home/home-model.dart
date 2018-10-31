import 'package:scoped_model/scoped_model.dart';

/// The model provides all information and actions for the flutter-view to use.
class HomePageModel extends Model {

	/// Keeps track of how many times the button has been clicked
	int counter = 0;

	incrementCounter() {
		counter++;
		notifyListeners(); // this makes the flutter-view update
	}

}
