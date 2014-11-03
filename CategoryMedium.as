package 
{

	/*The medium category contains two lists of words, organised
	as firstList and secondList (regardless of difficulty)*/
	public class CategoryMedium extends Category
	{
		public var firstList:Array = new Array();
		public var secondList:Array = new Array();

		public function CategoryMedium(categoryName:String):void
		{
			super(categoryName);
			size = 2;
		}

		/*getListByName returns a list of the category depending on a string parameter 
		(This is to be overridden by all except CategorySmall)*/
		override public function getListByName(aName:String):Array
		{
			aName = aName.toLowerCase();
			switch (aName)
			{
				case "firstList" :
					return (firstList);
					break;
				case "secondList" :
					return (secondList);
					break;
				case "allwords" :
					return (everyWord);
					break;
				default :
					return (firstList);
			}
		}
		
		override public function getListByNum(num:uint):Array
		{
			switch (num)
			{
				case 0 :
					return (firstList);
					break;
				case 1 :
					return (secondList);
					break;
				case 2 :
					return (everyWord);
					break;
				default :
					throw new Error("Unrecognised list number " + num);
			}
		}
	}
}