## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my ($continueInt, $die1, $die2, $totalScore, $roundTotal);
my (@playerScore);

sub main {
	$totalScore = 0;
	$roundTotal = 0; 
	showWelcomeScreen();
	setContinueInt();
	while ($continueInt == 1) {
		#decideToRoll();
		rollDice();
		addDice();
		saveToArray();
		printArray();
		#printRolls();
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
	print ("\nRound Total is: $roundTotal");
	print ("\nTotal score for round: $totalScore");
}

sub addDice {
	use constant "LOSE" => 1;
	if ($die1 == LOSE || $die2 == LOSE) {
		printLostRound();
		$roundTotal = 0;
	} elsif ($die1 == LOSE && $die2 == LOSE ) {
		$totalScore = 0;
	} else {
		$roundTotal = $die1 + $die2 + $roundTotal;
		$totalScore = $roundTotal + $totalScore;
	}
}

sub printLostRound {
	print ("You lost!");
	sleep 2;
	
}

sub decideToRoll {
	my $decision = 0;
	print ("Would you like to roll again or pass? (1 for roll again 0 to pass)");
	chomp ($decision = <STDIN>);
}

sub saveToArray {
	my $size = @playerScore;
	for (my $i = 0; $i <$size; $i++) {
		@playerScore[$i] = $totalScore;
	}
}

sub printArray {
	my $size = @playerScore;
	for (my $i = 0; $size < 5; $i++) {
		print ("\nTotal score for round: $playerScore[$i]");
	}
}