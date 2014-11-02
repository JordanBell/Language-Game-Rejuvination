package 
{
	/* This class handles the scoring, including bonus values, 
	multipliers, penalties and calculations. */
	
	public class Score
	{
		public static const baseCompletionScore:uint = 100;
		
		private var numCorrect:uint = 0;
		private var numIncorrect:uint = 0;
		private var m_playTime:uint = 0;

		private var m_duration:uint;
		private var m_penalty:Boolean;
		private var m_diffMult:uint;
		
		public function get performanceBonus():uint
		{
			return numCorrect * 100 -
				   (m_penalty ? 
				   (numIncorrect * 50) 
				   : 0);
		}
		
		public function get timeBonus():uint
		{
			var r_bonus:uint;
			
			if (m_playTime < m_duration)
			{
				r_bonus = (m_duration - m_playTime) * 50;
				r_bonus *=  (numCorrect / 10);
			}
			else
				r_bonus = 0;
				
			return r_bonus;
		}
		
		public function get totalScore():uint
		{
			return (baseCompletionScore + performanceBonus + timeBonus) * m_diffMult;
		}
		
		public function get timePassed():String
		{
			return (m_duration - m_playTime).toString();
		}
		
		public function get isGood():Boolean
		{
			return numCorrect > numIncorrect;
		}
		
		public function get timeLimitReached():Boolean
		{
			return m_playTime == m_duration;
		}
		
		public function set playTime(val:uint):void
		{
			m_playTime = val;
		}
		
		public function get playTime():uint
		{
			return m_playTime;
		}
		
		public function incCorrect():void
		{
			numCorrect++;
		}
		
		public function incIncorrect():void
		{
			numIncorrect++;
		}
		
		public function get correct():uint
		{
			return numCorrect;
		}
		
		public function get incorrect():uint
		{
			return numIncorrect;
		}
		
		public function set difficultyMultiplier(val:uint):void
		{
			m_diffMult = val;
		}
		
		public function get difficultyMultiplier():uint
		{
			return m_diffMult;
		}
		
		public function set duration(val:uint):void
		{
			m_duration = val;
		}
		
		public function set penaltyOnWrong(b:Boolean):void
		{
			m_penalty = b;
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