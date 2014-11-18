SwiftAnimate
============

Swift library for simple animations - inspired by my sons code.org lessons

My son (who is 12) is learning to code with lessons from code.org. After seeing code.org for the very first time, I was thoroughly impressed with their visual approach. Each challenge/lesson utilizes a UI that assembles graphical representations of basic code blocks that the student can organize(drag & drop) to execute animations. The code blocks represent abstractions of different animations.

I wanted to create a similar approach so that my son can begin developing for iOS in Swift. My first step in doing that was writing the abstractions and using simple references(similar to code.org), like moveUp(...), or fadeIn(...).

###Basic Usage
Just a few examples:

	// create reference to delay because NSTimeInterval() cannot be initiated at time of method call
	var delay:NSTimeInterval = NSTimeInterval(0.25)

	//fades _myView to 0
	_myView.fadeIn(delay, reference: view)

	//moves the y origin of _myView to 100 points from top
	_myView.moveY(100, delay: delay, reference: view)

	//adds 100 points to the y origin of _myView then moves to sum
	_myView.moveDown(100, delay: delay, reference: view)


Please feel free to contribute.