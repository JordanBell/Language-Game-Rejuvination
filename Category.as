package 
{
	/*The category class contains the mutual properties and methods
	held within its subclasses, explained below. The one method which
	doesn’t require polymorphism is the getRandomWords method.*/
	public class Category
	{
		public var name:String;
		public var everyWord:Array = new Array();
		
		//size specifies the number of categories
		public var size:uint;

		//Constructor
		public function Category(categoryName:String)
		{
			name = categoryName;
		}

		//Returns a list of the category depending on its number*
		public function getListByNum(num:uint):Array
		{
			throw new Error("Failed to implement getListByNum in a category subclass.");
		}

		/*Returns a list of the category by its name
		(This is to be overridden by all except CategorySmall)*/
		public function getListByName(aName:String):Array
		{
			throw new Error("Failed to implement getListByNum in a category subclass.");
		}		

		//Receives an array, and sets it to the correct lists
		public function addWord(word:String, subcategoryNum:uint):void
		{
			var chosenList:Array = getListByNum(subcategoryNum);
			
			chosenList.push(word.toLowerCase());
			everyWord.push(word.toLowerCase());
		}

		//getRandomWords receives a string value, and randomises then returns that value’s corresponding list of words.
		public function getRandomWords(listName:String):Array
		{
			listName = listName.toLowerCase();

			//The outputList holds the words as they are set, which is eventually returned 
			var outputList:Array = new Array();
			//The copyList variable acts as an editable copy of the array of a given listName
			var copyList:Array = new Array();
			//The searchList holds the list from which random words are being retrieved
			var searchList:Array = new Array();
			var cell:Number = 0;

			//Sets the value of the argument to the searchList array
			searchList = getListByName(listName);

			//Copies the searchList to the copyList
			for (var i:uint = 0; i < searchList.length; i++)
			{
				copyList.push(searchList[i]);
			}

			//Loops, moving a random word from the copyList into the outputList in each repetition.
			//The loop ends when there are no more words to return
			for (var j:uint = 0; copyList.length != 0; i++)
			{
				//Finds a random number, in order to retrieve a random word from the copyList
				cell = Math.random() * copyList.length;
				cell = Math.floor(cell);
				//Adds the random word to the outputList
				outputList.push(copyList[cell]);
				//And removes it from the copyList;
				copyList.splice(cell, 1);
			}

			//Now the outputList is fully compiled, and can be returned
			return (outputList);
		}
	}
}