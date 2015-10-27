## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my ($continueInt, $die1, $die2, $totalScore, $roundTotal, $player);
my (@roundScore);

use constant "HUMAN" => 0;
use constant "AI" => 1;
use constant "COLUMNS" => 1;

sub main {
	@roundScore = ([0],[0]);
	$totalScore = 0;
	$player = HUMAN;
	$roundTotal = 0; 
	showWelcomeScreen();
	setContinueInt();
	while ($continueInt == 1) {
		decideToRoll();
		rollDice();
		addDice();
		saveToArray();
		printRolls();
		setContinueInt();
	}
}

main();

sub setContinueInt{
	if (!(defined $continueInt)){
		$continueInt = 1;
	} while ($continueInt != 1){
		print ("\n\nWould you like to play again? (1 for yes 0 for no) ");
		chomp ($continueInt = <STDIN>); 
	}
		
}

sub rollDice {
	use constant "DICE_SIDES" => 6;
	if ($player == HUMAN) {
		$die1 = (int (rand (DICE_SIDES)+1));
		$die2 = (int (rand (DICE_SIDES)+1));
	} elsif ($player == AI) {
			$die1 = (int (rand (DICE_SIDES)+1));
			$die2 = (int (rand (DICE_SIDES)+1));
	}
}

sub showWelcomeScreen {
	print ("\n\n\t\t\tWelcome To Pig:The game!");
	print ("\n\t\t\tRules:");
	print ("");
}

sub printRolls {
	print ("\nDie one rolled a: $die1");
	print ("\nDie two rolled a: $die2");
	my $size = @roundScore;
	if ($player == HUMAN) {
		for (my $i = 0; $i < $size - 1; $i++){
			print "\nHuman Round Score: $roundScore[$i][HUMAN]";
		}		
	} else {
		for (my $i = 0; $i < $size - 1; $i++){
		print "\nAI Round Score: $roundScore[$i][AI]";
	}	
	}
}

sub addDice {
	use constant "LOSE" => 1;
	my $size = @roundScore;
	if ($die1 == LOSE || $die2 == LOSE) {
		printLostRound();
		$player = AI;
		$roundTotal = 0;
	} elsif ($die1 == LOSE && $die2 == LOSE ) {
		$totalScore = 0;
		$player = AI;
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
	print ("\n\nWould you like to roll again or pass? (1 for roll again 0 to pass) ");
	chomp ($decision = <STDIN>);
	if ($decision == 0) {
		$player = 1;
	}
}

sub saveToArray {
	my $size = @roundScore;
	if ($player == HUMAN) {
		for (my $i = 0; $i < $size; $i++ ){
		$roundScore [$i][HUMAN] = $roundTotal;
		}
	} if ($player == AI) {
		for (my $i = 0; $i < $size; $i++) {
		$roundScore [$i][AI] = $roundTotal;
		}
	}
} 