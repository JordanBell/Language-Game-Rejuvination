package 
{

	public class Game extends Object
	{

		//Reference
		public var name:String;
		public var gameFrameName:String;
		public var settingsFrameName:String;

		//User selected
		//WARNING: the difficulty value must be set through the method, or else the corresponding effects won't take place.
		public var chosenGameDifficulty:String;
		public var chosenWordDifficulty:String;
		public var chosenCategory:String;
		public var chosenFormat:String;

		//Lingual
		public var currentWordlist:Array = new Array();
		public var currentWord:String;

		//Gameplay
		public var useTimer:Boolean;
		public var duration:uint;
		public var round:int = -1;
		public var totalRounds:uint;

		//Score
		public var score:Score = new Score();

		public function Game(gameType:String):void
		{
			//Sets the properties which are based on the type of game.
			name = gameType;
			gameFrameName = "Game_" + gameType;
			settingsFrameName = "Settings_" + gameType;
		}

		public function settingsTo(lang:Language, cate:String, diff:String):void
		{
			//With a single line of arguments, sets the user-set settings
			setLanguage(lang);
			setDifficulty(diff);
			setCategory(cate);

			//And hence sets the current list of words
			setWordlist(lang.getCategoryByName(cate).getWordsPerDifficulty(diff));
		}

		public function setCategory(aCategory:String)
		{
			chosenCategory = aCategory;
		}

		public function setGameDifficulty(diff:String):void
		{
			//Literally, sets the difficulty.
			chosenGameDifficulty = diff;

			//Hence sets the difficulty-based properties
			switch (chosenDifficulty.toLowerCase())
			{
				case "easy" :
					//Only on easy difficulty will there we no timer
					useTimer = false;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 0.8;
					break;
				case "medium" :
					useTimer = true;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 1.0;
					duration = 150;
					break;
				case "hard" :
					//Only hard difficulty adds a penalty for incorrect answers
					totalRounds = 20;
					useTimer = true;
					score.penaltyOnWrong = true;
					score.difficultyMultiplier = 1.2;
					duration = 200;
					break;
				default :
					trace("Error: The difficulty was not recognised in the setDifficulty method, under the Game class.");
					chosenDifficulty = "ERROR_DifficultyName";
			}
		}

		public function setWordlist(wordlist:Array):void
		{
			//Sets the word list based on the argument
			currentWordlist = wordlist;

			//Resets the currentWord value to that of the first word in the given list
			currentWord = currentWordlist[0];
		}

		public function nextRound():void
		{
			//The condition checks to see if the language, category and difficulty has been set before starting the game.
			if ((chosenCategory != null) && (chosenDifficulty != null))
			{
				//Increased the round
				round++;
				//And sets the current word based on that round number
				currentWord = currentWordlist[round];
			}
			else
			{
				//An error message is sent if any of the settings are null.
				trace("ERROR: Required settings, (Language, Category and Difficulty) have not all been set!");
			}
		}

		public function translateWord(fromLang:Language, toLang:Language, word:String):String
		{
			//Resets the word parameter to its lowercase version, allowing a degree of freedom with the input
			word = word.toLowerCase();

			//Saves the indexes of the three arrays in which the larget word is found.
			var index1:uint = 0;
			var index2:uint = 0;
			var index3:uint = 0;

			//Runs through all of the arrays looking for the matching category, difficulty and word.
			for (var i:uint = 0; i < fromLang.allCategories.length; i++)
			{
				//Goes through every category
				for (var j:uint = 0; j < fromLang.allCategories[i].allDifficulties.length; j++)
				{
					//And goes through each difficulty
					for (var k:uint = 0; k < fromLang.allCategories[i].allDifficulties[j].length; k++)
					{
						//And goes through each word
						if (fromLang.allCategories[i].allDifficulties[j][k] == word)
						{
							//When the word has been found, its address is saved in the three previously defined variables
							index1 = i;
							index2 = j;
							index3 = k;
						}
					}
				}
			}

			//Returns the corresponding word from the list of words in the TO language
			return (toLang.allCategories[index1].allDifficulties[index2][index3]);
		}
	}
}