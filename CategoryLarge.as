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

		//getListByName returns a list of the category depending on a string parameter
		override public function getListByNum(num:uint):Array
		{
			switch (num)
			{
				case 0 :
					return (easyList);
					break;
				case 1 :
					return (mediumList);
					break;
				case 2 :
					return (hardList);
					break;
				case 3 :
					return (everyWord);
					break;
				default :
					throw new Error("Unrecognised list number " + num);
			}
		}
	}
}