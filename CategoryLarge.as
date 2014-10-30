package 
{
	//The large category contains three lists of words, organised as Easy, Medium and Hard
	public class CategoryLarge extends Category
	{
		//There are three subcategories in total
		public var easyList:Array = new Array();
		public var mediumList:Array = new Array();
		public var hardList:Array = new Array();

		public function CategoryLarge(categoryName:String):void
		{
			super(categoryName);
			size = 3;
		}

		//getListByName returns a list of the category depending on a string parameter
		override public function getListByName(aName:String):Array
		{
			aName = aName.toLowerCase();
			switch (aName)
			{
				case "easylist" :
					return (easyList);
					break;
				case "mediumlist" :
					return (mediumList);
					break;
				case "hardlist" :
					return (hardList);
					break;
				case "allwords" :
					return (everyWord);
					break;
				default :
					return (easyList);
			}
		}

		//Receives an array, and sets it to the correct lists
		override public function setWordsTo(allWords:Array):void
		{
			//Resets all of the arrays, in order for them to be written to
			easyList.splice(0, easyList.length);
			mediumList.splice(0, mediumList.length);
			hardList.splice(0, hardList.length);
			everyWord.splice(0, everyWord.length);

			//The chosenList is the array which holds the value of the returned array
			var chosenList:Array = easyList;

			//The following For statement is necessary, as there is more than one word list in a large category.
			for (var i:uint = 0; i < allWords.length; i++)
			{
				//If the word is the name of one of the lists:
				var forEasyList:Boolean = (allWords[i].toLowerCase() == "easylist");
				var forMediumList:Boolean = (allWords[i].toLowerCase() == "mediumlist");
				var forHardList:Boolean = (allWords[i].toLowerCase() == "hardlist");
				if (forEasyList || forMediumList || forHardList)
				{
					//Set the chosen list to the list specified in that cell
					chosenList = getListByName(allWords[i]);
				}
				else
				{
					//Add the word to the last specified list
					chosenList.push(allWords[i].toLowerCase());
					everyWord.push(allWords[i].toLowerCase());
				}
			}
		}
	}
}