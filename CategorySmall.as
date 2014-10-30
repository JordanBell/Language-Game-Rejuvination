package 
{
	/*The small category contains a single, short list of words, 
	already instantiated as the everyWord array*/
	public class CategorySmall extends Category
	{

		public function CategorySmall(categoryName:String):void
		{
			super(categoryName);
			size = 1;
		}

		//Receives an array, and sets it to the correct lists
		override public function setWordsTo(allWords:Array):void
		{
			//Resets all of the arrays, in order for them to be written to
			everyWord.splice(0, everyWord.length);
			for (var i:uint; i < allWords.length; i++)
			{
				everyWord.push(allWords[i].toLowerCase());
			}
		}
	}
}