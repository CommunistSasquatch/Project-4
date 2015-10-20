## Assignment: Project 4
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 10.19.15.1
## Purpose: To demonstrate arrays 

use 5.14.1;
use warnings;

my (@score);
my ($continueInt, $die1, $die2, $counter);
use constant "MAX_DIE" => 6;
use constant "YES" => 1;
use constant "LOSE" => 1;
use constant "MAX_ROLLS"


sub main { 
	setContinueInt();
	setCounter();
	while ($continueInt == YES) {
		rollPlayer();
		printResults();
	}
}

main();

sub setCounter {
	if (defined $counter) {
		$counter++;
	} else {
		$counter = 0;
	}
}


sub setContinueInt {
	$continueInt = 0;
	print ("\n\nWould you like to continue?(Yes = 1 and No = 0) ");
	chomp ($continueInt = <STDIN>);
	if ($continueInt != YES) {
		printGoodbye();
	}
	
}

sub rollPlayer {
	my $continue = 0;
	chomp ($continue = <STDIN>);
		for (my $i = 0; $i < 5 ; $i++){
			$die1 = (int rand(MAX_DIE));
			$die2 = (int rand(MAX_DIE));
			sleep 1;
			#if ($die1 == LOSE || $die2 == LOSE){
			#	printEndOfRound();
			#}
			#$score[$i][$i+1] = ($die1 + $die2)
		}
}

sub printResults {
	print ("Player rolled a $die1 and a $die2");
}

sub printGoodbye {
	print ("Goodbye");
	sleep 1;
	die;
}

sub printEndOfRound {
	print ("The round is over");
	sleep 1;
	
}

