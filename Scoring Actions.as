import flash.events.Event;

stop();

updateScores();
function updateScores()
{
	//Finds the total score
	var endScore:Number = myGame.currentGame.score.calcScore();

	//Updates the experience
	savedData.data.expTotal +=  endScore;
	savedData.flush();

	//Updates all of the labels to show the scores from the game;
	lblCompletitionScore.text = myGame.currentGame.score.baseCompletionScore.toString();
	lblPerformanceBonus.text = myGame.currentGame.score.performanceBonus.toString();
	lblTimeBonus.text = myGame.currentGame.score.timeBonus.toString();
	lblDifficultyMultiplier.text = myGame.currentGame.score.difficultyMultiplier.toString();
	lblScore.text = endScore.toString();
	lblLifetimeScore.text = savedData.data.expTotal.toString();
}