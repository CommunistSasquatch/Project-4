## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my ($continueInt, $die1, $die2, $humanTotalScore, $roundTotal, $player, $aiTotalScore, $scoreToBeAdded);
my (@roundScore, @totalScore);

use constant "HUMAN" => 0;
use constant "AI" => 1;
use constant "DICE_SIDES" => 6;

sub main {
	initilizeVars();
	showWelcomeScreen();
	setContinueInt();
	while ($continueInt == 1) {
		if ($player == HUMAN) {
			decideToRoll();
			rollDice();
			addDice();
			saveRoundScoreToArray();
			saveTotalScoreToArray();
		} elsif ($player == AI) {
			decideToRollAI();
			rollAI();
			addDice();
			saveRoundScoreToArray();
			saveTotalScoreToArray();
		}
		decideWin();
		printRolls();
		setContinueInt();
	}
}

main();

sub decideWin {
	use constant "WIN" => 100;
	if ($totalScore[HUMAN] == WIN) {
		printWin();
	} elsif ($totalScore[AI] == WIN) {
		printWin();
	}
}

sub printWin {
	print ("\n\nYOU WIN!!!!");
	sleep 1;
	die;
}

sub decideToRollAI {
	my $random = 0;
	use constant "ROLL" => 1;
	use constant "MAX_ROLL" => 2;
	$random = (int (rand (MAX_ROLL)+1));
	if ($random == ROLL) {
		rollAI();
	} else {
		$player = HUMAN;
	}	
}

sub rollAI {
	sleep 1;
	$die1 = (int (rand (DICE_SIDES)+1));
	$die2 = (int (rand (DICE_SIDES)+1));
}


sub initilizeVars {
	@totalScore = ([0]);
	@roundScore = ([0],[0]);
	$player = HUMAN;
	$roundTotal = 0;
	$totalScore [1] = 0;
}

sub setContinueInt{
	use constant "RULES" => 2;
	if (!(defined $continueInt)) {
		$continueInt = 0;
	} while ($continueInt != 1) {
		print ("\n\t\tWould You like to play a game, see rules, or quit? \n\t\t\t(0 to quit, 1 to play, 2 to see rules) ");
		chomp ($continueInt = <STDIN>);
		if ($continueInt == RULES) {
			printRules();
		} elsif ($continueInt == 0) {
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
	$die1 = (int (rand (DICE_SIDES)+1));
	$die2 = (int (rand (DICE_SIDES)+1));	
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
			print ("\nHuman Round Score: $roundScore[$i][HUMAN]");
		}		
	} else {
		for (my $i = 0; $i < $size - 1; $i++){
		print ("\nAI Round Score: $roundScore[$i][AI]");
		}	
	}
	print ("\nAI Total Score: $totalScore[AI]");
	print ("\nHuman Total Score: $totalScore[HUMAN]");
}

sub addDice {
	if (! (defined $aiTotalScore) || !(defined $humanTotalScore)){
		$humanTotalScore = 0;
		$aiTotalScore = 0;
	}
	use constant "LOSE" => 1;
	my $size = @roundScore;
	if ($die1 == LOSE || $die2 == LOSE) {
		printLostRound();
		$roundTotal = 0;
	} elsif ($die1 == LOSE && $die2 == LOSE ) {
		if ($player == HUMAN) {
			$totalScore[HUMAN] = 0;
		} if ($player == AI) {
			$totalScore[AI] = 0;
		}
		printLostRound();
	} else {
		$roundTotal = $die1 + $die2 + $roundTotal;
		if ($player == HUMAN) {
			$humanTotalScore = $humanTotalScore + $roundTotal;
		} elsif ($player == AI) {
			$aiTotalScore = $aiTotalScore + $roundTotal;
		}
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
	my $random = 0;
	use constant "MAX_ROLL" => 2;
	print ("\n\nWould you like to roll, or pass? (1 for roll again 0 to pass) ");
	chomp ($decision = <STDIN>);
	if ($decision == 0 && $player == HUMAN) {
		$player = AI;
		$roundTotal = 0;
	}
}

sub saveRoundScoreToArray {
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

sub saveTotalScoreToArray {
	my $size = @roundScore;
	if ($player == HUMAN) {
		$totalScore[HUMAN] = $humanTotalScore;
	} elsif ($player == AI){
	$totalScore [AI] = $aiTotalScore;
	}
}