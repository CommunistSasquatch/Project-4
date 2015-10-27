## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my ($continueInt, $die1, $die2, $humanTotalScore, $roundTotal, $player, $aiTotalScore);
my (@roundScore);

use constant "HUMAN" => 0;
use constant "AI" => 1;

sub main {
	@roundScore = ([0],[0]);
	$humanTotalScore = 0;
	$aiTotalScore = 0;
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
	use constant "RULES" => 2;
	if (!(defined $continueInt)){
		$continueInt = 0;
	} while ($continueInt != 1){
		print ("\n\t\tWould You like to play a game, see rules, or quit? \n\t\t\t(0 to quit, 1 to play, 2 to see rules) ");
		chomp ($continueInt = <STDIN>);
		if ($continueInt == RULES) {
			printRules();
		} elsif ($continueInt == 0){
			die;
		}
	}
}


sub printRules {
	system("cls");
	print ("\n\n\t\t\t---------------RULES---------------");
	print ("\nRule 1: You roll two dice. If nither of the dice roll a one, you can keep playing or give up the turn");
	print ("\n\nRule 2: If one of your dice does roll a one, then your round score is set to zero and it automatically turns to the other player.");
	print ("\n\nRule 3: If BOTH of your dice roll a one then your total score is set to zero and it becomes the other players turn.");
	print ("\n\n\t\t\t-----------------------------------\n");
}

sub rollDice {
	use constant "DICE_SIDES" => 6;
	if ($player == HUMAN) {
		$die1 = (int (rand (DICE_SIDES)+1));
		$die2 = (int (rand (DICE_SIDES)+1));
	} elsif ($player == AI) {
<<<<<<< HEAD
			$die1 = (int (rand (DICE_SIDES)+1));
			$die2 = (int (rand (DICE_SIDES)+1));
=======
			$die1 = (int rand (DICE_SIDES)+1);
			$die2 = (int rand (DICE_SIDES)+1);
>>>>>>> f3df2e00297d1eccd144e340452ce2154af43d81
	}
}

sub showWelcomeScreen {
	print ("\n\n\t\t\tWelcome To Pig:The game!");
}

sub printRolls {
	system ("cls");
	print ("\nDie one rolled a: $die1");
	print ("\nDie two rolled a: $die2");
	my $size = @roundScore;
	if ($player == HUMAN) {
		for (my $i = 0; $i < $size - 1; $i++){
			print "\nHuman Round Score: $roundScore[$i][HUMAN]";
			print ("");
		}		
	} else {
		for (my $i = 0; $i < $size - 1; $i++){
		print "\nAI Round Score: $roundScore[$i][AI]";
		print ("");
		}	
	}
	
}

sub addDice {
	use constant "LOSE" => 1;
	my $size = @roundScore;
	if ($die1 == LOSE || $die2 == LOSE) {
		printLostRound();
		$roundTotal = 0;
	} elsif ($die1 == LOSE && $die2 == LOSE ) {
		$totalScore = 0;
		printLostRound();
	} else {
		$roundTotal = $die1 + $die2 + $roundTotal;
		$totalScore = $roundTotal + $totalScore;
	}
}

sub printLostRound {
	print ("You lost!");
	sleep 1;
	switchPlayer();
	
}

sub switchPlayer {
	if ($player == HUMAN){
		$player = AI;
	} elsif ($player == AI){
		$player = HUMAN;
	}
}

sub decideToRoll {
	my $decision = 0;
<<<<<<< HEAD
	print ("\n\nWould you like to roll again or pass? (1 for roll again 0 to pass) ");
=======
	print ("\n\nWould you like to roll, or pass? (1 for roll again 0 to pass) ");
>>>>>>> f3df2e00297d1eccd144e340452ce2154af43d81
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