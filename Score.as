package 
{
	import flash.utils.Timer;

	/*This class handles the scoring, including bonus values, 
	multipliers, penalties and calculations.*/
	public class Score
	{
		//Common score-based properties
		public var numCorrect:uint = 0;
		public var numIncorrect:uint = 0;
		public var playTime:uint = 0;

		public var duration:uint;
		public var penaltyOnWrong:Boolean;
		public var difficultyMultiplier:uint;

		//Score value components
		public const baseCompletionScore:uint = 100;
		public var timeBonus:Number = 0;
		public var performanceBonus:Number = 0;
		public var totalScore:int = 0;


		//Constructor
		public function Score()
		{
			//No constructor
		}

		//calcScore calculates the score, based on the variables passed on to this class during gameplay
		public function calcScore():Number
		{
			//Sets the performance bonus, which is higher based on the number of correct answers
			performanceBonus = numCorrect * 100;

			//If penalties have been enabled, the performance bonus is decreased based on the number of incorrect answers
			if (penaltyOnWrong)
			{
				performanceBonus -=  numIncorrect * 50;
			}

			/*Sets the time bonus, which is higher depending on how long
			it took the player to complete the round. This is only done if
			the playTime is greater than the duration, as only then will 
			it be positive, and therefore act as a bonus*/
			if (playTime < duration)
			{
				timeBonus = (duration - playTime) * 50;
				timeBonus *=  (numCorrect / 10);
				//The value is rounded up, so that no long decimals are shown after calculation
				timeBonus = Math.ceil(timeBonus);
			}
			else
			{
				timeBonus = 0;
			}

			//The totalScore holds the value of all of these values put together, and multiplied by the difficulty multiplier
			totalScore = (baseCompletionScore + performanceBonus + timeBonus) * difficultyMultiplier;
			//The value is rounded up, so that no long decimals are shown after calculation
			totalScore = Math.ceil(totalScore);
			return (totalScore);
		}
		
		//ResetScore resets all of the scores to allow for a new game to be started
		public function resetScore()
		{
			numCorrect = 0;
			numIncorrect = 0;
			playTime = 0;
		}

	}
}