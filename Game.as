﻿package 
{
	import flash.utils.*
	
	/*This class contains everything pertaining to the specific game being played.
	It also uses information from the Language and Category classes to perform translations.*/
	public class Game extends Object
	{
		//Each game will have a name
		public var name:String;
		//User Interface frame name, used by the main timeline to jump to the correct game frame
		public var gameFrameName:String;
		//Settings screen frame name, used by the main timeline to jump to the correct settings frame
		public var settingsFrameName:String;

		//User selected variables set in the settings screen:
		//Game difficulty affects time limit and scoring
		public var chosenGameDifficulty:String;
		//A chosen category contains a varety of words for each language
		public var chosenCategory:String;
		//The subcategory provides a finer list of words
		public var chosenSubcategory:String;
		/*Depending on the chosenFormat, the game will respond differently 
		(ie english words will be output, rather than foreign ones)*/
		public var chosenFormat:String;

		//These lingual variables hold the words used by the game
		public var currentWordlist:Array = new Array();
		public var currentWord:String;

		//The following gameplay variables are used for the mechancis of the game
		//The useTimer boolean will determine whether or not the player is restricted by a time limit and/or recieve a time bonus
		public var useTimer:Boolean;
		/*The round number starts at -1, because it is initially increased before
		being used in an array, allowing for it to access the first index (0) or the array*/
		public var round:int = -1;
		/*The totalRounds variable limits how many rounds take place in the game. 
		This changes based on the length of words held in the currentWordList*/
		public var totalRounds:uint;

		//A score handler is instantiated, as every game will have a score (see the Score class for a description of how it works)
		public var score:Score = new Score;
		
		//gameTimer is used for the time limit of the games, and will be assigned an interval later
		public var gameTimer;
		//timerOn will tell the game whether or not to display a timer and affects all timer-based functions
		public var timerOn:Boolean = false;
		//The timerPaused boolean determines whether or not to add a new timer once the game is resumed
		public var timerPaused:Boolean = false;

		//Constructor
		public function Game(gameTypeName:String):void
		{
			//Sets the properties which are based on the type of game.
			name = gameTypeName;
			
			//The frame names follow an established format
			gameFrameName = "Game_" + gameTypeName;
			settingsFrameName = "Settings_" + gameTypeName;
		}
		
		// Convenience method for initialising a new game
		public function initNewGame():void
		{
			resetGameStats();
			nextRound();
			startTimer();
		}

		//Allows all settings to be specified at once
		public function settingsTo(lang:Language, _category:String, _gameDifficulty:String, _subcategory:String, _format:String):void
		{
			//Set corresponding properties
			gameDifficulty = _gameDifficulty;
			subcategory = _subcategory;
			category = _category;
			format = _format;

			//The word list is then set, based this information
			wordList = lang.getCategoryByName(_category).getRandomWords(_subcategory);
		}

		public function set category(categoryStr:String)
		{
			chosenCategory = categoryStr;
		}

		public function set format(formatStr:String):void
		{
			chosenFormat = formatStr;
		}

		//Sets the game difficulty, along with all of the properties it affects
		public function set gameDifficulty(diff:String):void
		{
			chosenGameDifficulty = diff.toLowerCase();

			//Hence sets the difficulty-based properties
			switch (chosenGameDifficulty)
			{
				case "easy" :
					//Remove the timer on easy
					useTimer = false;					
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 1;
					break;
				case "medium" :
					useTimer = true;
					score.penaltyOnWrong = false;
					score.difficultyMultiplier = 2;
					break;
				case "hard" :
					//Only hard difficulty adds a penalty for incorrect answers
					useTimer = true;
					score.penaltyOnWrong = true;
					score.difficultyMultiplier = 3;
					break;
				default :
					trace("Error: The difficulty was not recognised in the setGameDifficulty method, under the Game class.");
			}
		}

		//Sets the subcategory
		public function set subcategory(subcat:String):void
		{
			//The chosenSubcategory parameter is set to lower case to allow for any format discrepancies
			chosenSubcategory = subcat.toLowerCase();
		}

		//Sets the words lists, and all the properties affected by it
		public function set wordList(_wordList:Array):void
		{
			//Sets the word list based on the parameter
			currentWordlist = _wordList;

			//Finally, sets the total Rounds and game duration, based on the number of words in the list
			totalRounds = currentWordlist.length;
			/*The length of the duration is less, as the difficulty increases, 
			giving 3 seconds per round on Hard, and 5 seconds per round on Medium*/
			score.duration = totalRounds * (9 - (2 * score.difficultyMultiplier));

			//Resets the currentWord value to that of the first word in the given list
			currentWord = currentWordlist[0];
		}
		
		//nextRound changes the properties when a new round starts
		public function nextRound():void
		{
			//Increase the round
			round++;
			
			//And set the current word based on that round number
			currentWord = currentWordlist[round];
		}
		
		//Resets the game stats and score
		public function resetGameStats():void
		{
			round = -1;
			score.resetScore();
		}

		/*Deals with all of the processes in response to a submitted 
		answer, returning a boolean indicating if it was correct.*/
		public function submitAnswer(inputText:String):Boolean
		{
			//The inputText parameter is set to lower case to allow for any format discrepancies
			inputText = inputText.toLowerCase();
			
			var correctAnswer:String = getExpectedAnswer();
			
			//Calculate the answer's correctness
			if (inputText == correctAnswer)
				score.incCorrect();
			else
				score.incIncorrect();
			
			return (inputText == correctAnswer);
		}
		
		//getExpectedAnswer returns the expected answer based on a translation of the currentWord
		public function getExpectedAnswer():String
		{			
			//The expected answer is the translation of the current word
			return translateWord(currentWord);
		}
		
		/* Get an array of random words. */
		public function randomWordsFromList(numberOfWords:uint = 1, unwantedWord:String = ""):Array
		{
			var returnArray:Array = new Array();
			var randomWordIndex:uint;
			var randomWord:String;
			
			var isUnwanted:Boolean;
			var alreadyAdded:Boolean;
			
			// Add words
			for (var i:uint = 0; i < numberOfWords; i++)
			{
				isUnwanted = alreadyAdded = false; // Defaults
					
				/*A do while loop exists in order to prevent the random word being
				picked as an unwanted word, or as a previously chosen word*/
				do
				{
					//assign it a random index of the currentWordlist array
					randomWordIndex = Math.random() * currentWordlist.length;
					//Hence randomWord is a random english word from the current word list. 
					randomWord = translateWord(currentWordlist[randomWordIndex]);
					
					isUnwanted = (randomWord == unwantedWord)
					alreadyAdded = (returnArray.indexOf(randomWord) != -1);
					
				} while (isUnwanted || alreadyAdded)
				
				returnArray.push(randomWord);
			}
			
			//Hence return random words from the currentWordList
			return(returnArray);
		}

		/*The translateWord method receives the parameters for the word,
		the language translating from, the langage translating to,
		and optionally accepts the category and subcategory it can
		be found in in order to be more efficient*/
		public function translateWord(word:String, 
									  fromLang:Language = null, 
									  toLang:Language = null, 
									  category:String = null, 
									  subcategory:String = null):String
		{
			// Unspecified parameters are given default values.
			if (fromLang == null) 
				fromLang = LanguageGameHandler.outputLanguage;
			if (toLang == null)
				toLang = LanguageGameHandler.inputLanguage;
			if (category == null)
				category = chosenCategory;
			if (subcategory == null)
				subcategory = chosenSubcategory;
			
			word = word.toLowerCase(); // Normalise input

			var translatedWord:String = "Word not found. Sorry!"; // Return value

			/*The following is a more efficient search algorithm, used when 
			the category and subcategory parameters both contain a value*/
			if ((category != null) && (subcategory != null))
			{
				/*The fromList contains the list of words in the fromLang language 
				parameter, in which the search word parameter is found*/
				var fromList:Array = fromLang.getCategoryByName(category).getListByName(subcategory);
				//The toList contains the list of words in the toLang language parameter, in which the translation should be found
				var toList:Array = toLang.getCategoryByName(category).getListByName(subcategory);

				//Runs through all of the words in the fromList
				for (var h:uint = 0; h < fromList.length; h++)
				{
					//Goes through each word
					if (fromList[h].toLowerCase() == word)
					{
						/*When the word has been found in the fromList, its corresponding index 
						is used in the toList, giving the corresponding translated word in that language.*/
						return toList[h];
					}
				}
			}
			else
			{
				/*If the category and subcategory of the search word have not 
				been included as a parameter, then we will need to find it ourselves.*/
				
				/*The indexes of the two arrays in which the word is found will 
				be saved. They have default values that will be overridden*/
				var index1:int = -1;
				var index2:int = -1;

				//Runs through all of the arrays looking for the matching category, difficulty and word.
				for (var i:uint = 0; i < fromLang.allCategories.length; i++)
				{
					//Goes through every category
					for (var j:uint = 0; j < fromLang.allCategories[i].everyWord.length; j++)
					{
						//And goes through every word in those categories
						if (fromLang.allCategories[i].everyWord[j].toLowerCase() == word)
						{
							//When the word has been found, a word of the same location in the toLang is returned
							return toLang.allCategories[i].everyWord[j];
						}
					}
				}
			}

			//If no match has been found, say so
			throw new Error("Failed to find a translation for " + word);
		}
		
		
		/////////////////////Timer functions\\\\\\\\\\\\\\\\\\\\\\
		
		/*If a timer is not currently set up, one is started. Otherwise, a 
		duplicate is trying to be made and an error is sent to the programmer*/
		public function startTimer():void
		{
			if (timerOn == false)
			{
				gameTimer = setInterval(incTime,1000);
				timerOn = true;
				score.playTime = 0;
			}
			else
			{
				trace("Duplicate timer trying to be made");
			}
			
		}
		
		//Functions the same as startTimer, but doesn't reset the playTime variable, allow the timer to resume
		public function restartTimer():void
		{
			//If there is currently no timer
			if (timerOn == false)
			{
				//Starts a timer without resetting the amount of time passed
				gameTimer = setInterval(incTime,1000);
				timerOn = true;
			}
			else
			{
				//Notify the programmer of the error
				trace("Duplicate timer trying to be made");
			}
			
		}
		
		//Ends the timer
		public function endTimer():void
		{
			//If a timer is on
			if (timerOn == true)
			{
				//Remove the timer
				clearInterval(gameTimer);
				timerOn = false;
			}
			else
			{
				//Notify the programmer of the error
				trace("Trying to end a timer, when one isn't running.");
			}
		}
		
		//Updates the time variables, as per the set interval
		public function incTime():void
		{
			//Play time increments
			score.playTime = score.playTime + 1;
		}
		
		public function pauseGameTimer():void
		{
			//If there is a timer, it is removed, with a boolean to signify that it mustbe resumed.
			if (timerOn)
			{
				timerPaused = true;
				endTimer();
			}
		}
		
		public function resumeIfPaused():void
		{
			//If the timer was paused, resume it
			if (timerPaused)
			{
				restartTimer();
			}
		}
		
		public function restartGameTimer():void
		{
			if (timerPaused)
			{
				//The game is resumed...
				restartTimer();
				timerPaused = false;
				
				//...and ended.
				endTimer();
			}
		}
	}
}