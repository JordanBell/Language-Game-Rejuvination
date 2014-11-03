package 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/*This class uses properties and methods to carry out all processes which require
	data from multiple other classes. Therefore, it contains instances of four games
	and nine languages, reflective of the number of game types and languages available
	in the program. On top of this, the Language Game Handler constructor contains all
	3000+ words and phrases to be used within the game.*/
	public class LanguageGameHandler
	{

		//All of the games are instantiated, as well as a 'current game' variable to hold a copy of the game chosen by the user
		public var flashCards:Game = new Game("FlashCards");
		public var choices:Game = new Game("Choices");
		public var currentGame:Game = flashCards;

		//Instantiates all 10 languages
		public var English:Language = new Language("English");
		public var Spanish:Language = new Language("Spanish");
		public var French:Language = new Language("French");
		public var Italian:Language = new Language("Italian");
		public var German:Language = new Language("German");
		public var Japanese:Language = new Language("Japanese");
		public var Finnish:Language = new Language("Finnish");
		public var Turkish:Language = new Language("Turkish");
		public var Dutch:Language = new Language("Dutch");
		public var Portuguese:Language = new Language("Portuguese");
		/*An allLanguages array holds every language, in case they ever need 
		to be cycled through while traversing or searching through them*/
		public var allLanguages:Array = new Array(English, Spanish, French, 
												   Italian, German, Japanese, 
												   Finnish, Turkish, Dutch, Portuguese);												   
		private var wordLoader:URLLoader = new URLLoader();
		
		/*The variables of inputLanguage and outputLanguage change depending
		on what the user chooses. English is always either the input or output
		language, depending on the format chosen by the user during the game.
		These are static in order to be accessed by the Game classes in the
		submitAnswer methods.*/
		public static var inputLanguage:Language;
		public static var outputLanguage:Language;
		
		function onWordLoad(e:Event):void 
		{
			var lines:Array = e.target.data.split(/\r/);
			var line:String;
			var accessLanguage:Language = null;
			var accessCategory:Category = null;
			var prevCategory:Category = null;
			var subcategoryNum:uint = 0;
			var isType1:Boolean = false;
			var isType2:Boolean = false;
			
			for (var i:uint = 0; i < lines.length; i++)
			{
				line = lines[i];
				if (line != "")
				{
					isType1 = true;
					// Point to the appropriate language
						 if (line == "ENGLISH")	  accessLanguage = English;
					else if (line == "SPANISH")	  accessLanguage = Spanish;
					else if (line == "FRENCH")	  accessLanguage = French;
					else if (line == "ITALIAN")   accessLanguage = Italian;
					else if (line == "GERMAN") 	  accessLanguage = German;
					else if (line == "JAPANESE")  accessLanguage = Japanese;
					else if (line == "FINNISH")	  accessLanguage = Finnish;
					else if (line == "TURKISH")	  accessLanguage = Turkish;
					else if (line == "DUTCH") 	  accessLanguage = Dutch;
					else if (line == "PORTUGESE") accessLanguage = Portuguese;
					
					// Point to the appropriate category in that language
					else if (line == "NOUNS") 	   accessCategory = accessLanguage.commonNouns;
					else if (line == "VERBS") 	   accessCategory = accessLanguage.commonVerbs;
					else if (line == "ADJECTIVES") accessCategory = accessLanguage.commonAdjectives;
					else if (line == "NUMBERS")    accessCategory = accessLanguage.numbers;
					else if (line == "TRAVEL") 	   accessCategory = accessLanguage.travel;
					else if (line == "FAMILY") 	   accessCategory = accessLanguage.family;
					else if (line == "PHRASES")    accessCategory = accessLanguage.phrases;
					else if (line == "ACTIVITIES") accessCategory = accessLanguage.activities;
					else if (line == "PRONOUNS")   accessCategory = accessLanguage.pronouns;
					else if (line == "COLOURS")    accessCategory = accessLanguage.colours;
					else if (line == "COUNTRIES")  accessCategory = accessLanguage.countries;
					else isType1 = false;
					
					// Change the subcategory to default of 0 when new category is found
					if (accessCategory != prevCategory) 
						subcategoryNum = 0;
					prevCategory = accessCategory; // Now point to the current selected category
					
					isType2 = true;
					if ((line.toLowerCase() == "firstlist") || 
						(line.toLowerCase() == "easylist")) subcategoryNum = 0;
					else if ((line.toLowerCase() == "secondlist") || 
							 (line.toLowerCase() == "mediumlist")) subcategoryNum = 1;
					else if (line.toLowerCase() == "hardlist") subcategoryNum = 2;
					else isType2 = false;
					
					if (!isType1 && !isType2) 
					{
						accessCategory.addWord(line, subcategoryNum);
					}
					
				}
			}
			MEGAWORDTRACEGO();
		}

		//The constructor sets the Word Database
		public function LanguageGameHandler()
		{
			//The word set array temporarily holds all of the words being added to a language category
			var wordSetArray:Array = new Array();
			
			wordLoader = new URLLoader();
			wordLoader.addEventListener(Event.COMPLETE, onWordLoad);
			wordLoader.load(new URLRequest("words.txt"));
		}

		/*The MEGAWORDTRACEGO method is used entirely by and for the programmer, 
		as it traces every single word held by the languages (in the constructor)*/
		public function MEGAWORDTRACEGO():void
		{
			//For every language
			for (var i:uint = 0; i < allLanguages.length; i++)
			{
				//For every category
				for (var j:uint = 0; j < allLanguages[i].allCategories.length; j++)
				{
					//For every subcategory
					for (var k:uint = 1; k <= allLanguages[i].allCategories[j].size; k++)
					{
						//The size property of a category signifies how many subcategories are within it
						if (allLanguages[i].allCategories[j].size == 1)
						{
							//If size = 1, the category is Small
							trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
								  ", Word List: MAIN, is:     " + allLanguages[i].allCategories[j].everyWord);
						}
						else if (allLanguages[i].allCategories[j].size == 2)
						{
							//If size = 2, the category is Medium
							if (k == 1)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: FIRST, is:     " + allLanguages[i].allCategories[j].firstList);
							}
							else if (k == 2)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: SECOND, is:     " + allLanguages[i].allCategories[j].secondList);
							}
						}
						else if (allLanguages[i].allCategories[j].size == 3)
						{
							//If size = 3, the category is Large
							if (k == 1)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: EASY, is:     " + allLanguages[i].allCategories[j].easyList);
							}
							else if (k == 2)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: MEDIUM, is:     " + allLanguages[i].allCategories[j].mediumList);
							}
							else if (k == 3)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: HARD, is:     " + allLanguages[i].allCategories[j].hardList);
							}
						}
					}
				}
			}
		}
		
		/*Return an array holding every english word in the database.
		Used when the list of words is displayed in the main program's translation screen*/
		public function englishWordReturn():Array
		{
			//Instantiates a new array which will hold all of the values being returned by the method
			var returnList:Array = new Array();
			
			//Traverses through every category of the english language
			for (var j:uint = 0; j < English.allCategories.length; j++)
			{
				//In each category, traverses the list of words containing all of the words in the category 
				for (var l:uint = 0; l < English.allCategories[j].everyWord.length; l++)
				{
					//Adds each word to the returnList
					returnList.push(English.allCategories[j].everyWord[l]);						
				}
			}
			
			//Returns the compiled list of words
			return(returnList);
		}
		
		//Sets the input and output languages
		public function setLanguage(inLang:Language, outLang:Language):void
		{
			inputLanguage = inLang;
			outputLanguage = outLang;
		}
		
		//Return a Language by name
		public function getLangByName(aName:String):Language
		{
			//The inputText parameter is set to lower case to allow for any format discrepancies 
			aName = aName.toLowerCase();
			
			//By default, the language being returned has a null value, as nothing has yet been found
			var returnLang:Language = null;
			
			//The method searches through every available language serially for the matching one
			for (var i:uint = 0; i < allLanguages.length; i++)
			{
				if (allLanguages[i].name.toLowerCase() == aName)
				{
					returnLang = allLanguages[i];
				}
			}
			
			//Returnsthe compiled list
			return(returnLang);
		}
	}
}