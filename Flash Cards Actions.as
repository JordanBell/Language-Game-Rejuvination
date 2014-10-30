import flash.text.FontStyle;
import flash.events.Event;

addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
answerButton.addEventListener(MouseEvent.CLICK, giveFCAnswer);
btnSkip.addEventListener(MouseEvent.CLICK, finishRound);

////////////////////////////;

startFlashCards();
function startFlashCards(e:Event = null)
{
	gamePlaying = true;
	//All of the initial processes for starting the game:

	//Resets all round stats from previous game.
	myGame.currentGame.resetGameStats();
	//Fires off the first round automatically. The next rounds are handled by the Answer Submission event listener;
	myGame.currentGame.nextRound();
	myGame.currentGame.startTimer();
	
	lblLanguage.text = LanguageGameHandler.outputLanguage.name;
	lblTotalRounds.text = myGame.currentGame.totalRounds.toString();
	
	//Sets the dynamic messages to not be visible
	yes.visible = false;
	yesMessage.visible = false;
	no.visible = false;
	noMessage.visible = false;
	lblAnswer.visible = false;
	//If there is a timer restriction...
	if (myGame.currentGame.useTimer == true)
	{
		lblTime.text = (myGame.currentGame.score.duration - myGame.currentGame.score.playTime).toString();
	}
	else
	{
		lblTime.visible = false;
	}

	updateFCUI();
}

//////////////////Input functions\\\\\\\\\\\\\\\\\\\\\\


function giveFCAnswer(e:Event = null)
{
	//Submits the answer
	correctAnswer = myGame.currentGame.submitAnswer(inputBox.text);
	respondUI();

	finishRound();
}

function updateFCUI()
{
	//The displayed round is 1 more than the actual value, as the actual value is used as an array index.
	lblCounter.text = (myGame.currentGame.round + 1).toString();
	//Displays the score
	lblScore.text = (myGame.currentGame.score.numCorrect * 100).toString();
	//Displays the next word
	outputBox.text = myGame.currentGame.currentWord;
	//Resets the inputbox
	inputBox.text = "";
}
