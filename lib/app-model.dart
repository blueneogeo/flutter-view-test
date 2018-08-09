import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

class AppModel extends Model {

	AnimationController counterAnim;
	int counter = 0;
	int previous = 0;

	incrementCounter() {
		previous = counter;
		counter++;
		notifyListeners();
		this.counterAnim?.reset();
		this.counterAnim?.forward();
	}

	onAnimCreated(AnimationController controller) {
		this.counterAnim = controller;
	}

	CrossFadeState getFadeState() {
		if(counter.isEven) return CrossFadeState.showFirst;
		return CrossFadeState.showSecond;
	}

}
