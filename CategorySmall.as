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
		
		//Returns a list of the category depending on its number*
		override public function getListByNum(num:uint):Array
		{
			return everyWord;
		}

		/*Returns a list of the category by its name
		(This is to be overridden by all except CategorySmall)*/
		override public function getListByName(aName:String):Array
		{
			return everyWord;
		}
		
		override public function addWord(word:String, subcategoryNum:uint):void
		{
			// Only add it to everyWord
			everyWord.push(word.toLowerCase())
		}
	}
}