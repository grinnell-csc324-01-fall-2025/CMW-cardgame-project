function MyTestClass () {
	function cardInterectionsSuiteTest() {	
		Expect.Equals("attack test1", 20, attack(new player("Player 1"), new player("Player 2"), 0, rock));
		Expect.Equals("attack test2", 15, attack(new player("Player 1"), new player("Player 2"), 5, rock));
		Expect.Equals("attack test3", 0, attack(new player("Player 1"), new player("Player 2"), 30, rock));
		Expect.Equals("defend empty test", 0, defend(new player("Player 1"), 0));
		Expect.Equals("defend test", 5, defend(new player("Player 1"), 5));
		Expect.Equals("heal empty test", 20, heal(new player("Player 1"), 0));
		Expect.Equals("heal test", 25, heal(new player("Player 1"), 5));
		Expect.Equals("give immunity test", true, giveImmunity(new player("Player 1")));
		Expect.Equals("cheat val empty test", 0, cheatValChange(new player("Player 1"), 0, rock));
		Expect.Equals("cheat val empty test", 3, cheatValChange(new player("Player 1"), 3, rock));
	}
}

RunAllTests(MyTestClass());
PrintAllTestResults();