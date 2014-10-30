package  {
	
	public class SubGuy extends SuperGuy{

		public function SubGuy(aName:String) {
			super(aName);
		}
		
		override public function testing(){
			trace(allLists);
		}
		
		public function setWordsTo(aArray:Array)
		{
			trace("hsdfkajbf");
			allLists = aArray;
		}

	}
	
}
