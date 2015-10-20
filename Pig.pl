## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my ($continueInt, $die1, $die2, $totalScore);

sub main {
	showWelcomeScreen();
	setContinueInt();
	while ($continueInt == 1){
		rollDice();
		printRolls();
		addDice();
		setContinueInt();
	}
}

main();

sub setContinueInt{
	if (!(defined $continueInt)){
		$continueInt = 1;
	} else {
		print ("\n\nWould you like to play again? (1 for yes 0 for no) ");
		chomp ($continueInt = <STDIN>);
	} 
}

sub rollDice {
	use constant "DICE_SIDES" => 6;
	$die1 = (int rand (DICE_SIDES)+1);
	$die2 = (int rand (DICE_SIDES)+1);
}

sub showWelcomeScreen {
	print ("\n\n\t\t\tWelcome To Pig:The game!");
	print ("\n\t\t\tRules:");
	print ("");
}

sub printRolls {
	print ("\nDie one rolled a: $die1");
	print ("\nDie two rolled a: $die2");
	print ("\n$totalScore");
}

sub addDice {
	$totalScore = 0;
	$totalScore = $die1 +$die2;
}