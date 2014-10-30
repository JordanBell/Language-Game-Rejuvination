import flash.events.*;
import flash.display.*;
import flash.net.SharedObject;
import flash.utils.*;
import flash.ui.Keyboard;

/////////////////////////////Functions called during gameplay\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

function updateTimer(e:Event = null)
{
	//If a timer is being used
	if (myGame.currentGame.useTimer == true)
	{
		//The time label is dynamically updated, if non-null
		if (lblTime != null)
		{
			lblTime.text = (myGame.currentGame.score.duration - myGame.currentGame.score.playTime).toString();
		}
		
		//If the the elapsed time equals the maximum game duration...
		if ((myGame.currentGame.score.playTime == myGame.currentGame.score.duration) && (gamePlaying))
		{
			//The game is ended, and a message notifying the player of such is displayed
			var timeoutMessage:Timeout = new Timeout();
			timeoutMessage.x = 400;
			timeoutMessage.y = 300;
			addChild(timeoutMessage);
			
			endGame();
		}
	}
}

function keyHandler(e:KeyboardEvent)
{
	//If the enter key is pressed, the answer is submitted
	if (e.keyCode == Keyboard.ENTER)
	{
		//A different giveAnswer function is called, depending on the selected game type.
		switch (myGame.currentGame.name)
		{
			case "FlashCards":
				giveFCAnswer();
				break;
			case "Choices":
				giveChAnswer();
				break;
			default:
				trace("The game name was not recognized while trying to give an answer");
		}
	}
}

function finishRound(e:Event = null):void
{
	//If the game is over:
	if (myGame.currentGame.round >= (myGame.currentGame.totalRounds - 1))
	{
		endGame();
	}
	else
	{
		//If the game hasn't ended, go to the next round.
		myGame.currentGame.nextRound();
		
		//A different updateUI function is called, depending on the selected game type.
		switch (myGame.currentGame.name)
		{
			case "FlashCards":
				updateFCUI();
				break;
			case "Choices":
				updateChUI();
				break;
			default:
				trace("The game name was not recognized while trying to update the UI.");
		}
		
	}
}

function endGame()
{
	//Game over!
	gamePlaying = false;
	//Freeze the gameplay my removing the input listeners
	removeEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
	
	//A different updateUI function is called, depending on the selected game type.
	switch (myGame.currentGame.name)
	{
		case "FlashCards":
			answerButton.removeEventListener(MouseEvent.CLICK, giveFCAnswer);
			break;
		case "Choices":
			answerButton.removeEventListener(MouseEvent.CLICK, giveChAnswer);
			break;
		default:
			trace("The game name was not recognized while trying to remove the giveAnswer listener.");
	}
	
	myGame.currentGame.endTimer();
	
	outputBox.text = "Game over!";
	
	//If they have done well...
	if (myGame.currentGame.score.numCorrect > myGame.currentGame.score.numIncorrect)
	{
		//Congratulate them!
		var congratulations:Congratulations = new Congratulations();
		congratulations.x = 400;
		congratulations.y = 200;
		addChild(congratulations);
	}
	else
	{
		//Console them
		var tooBad:TooBad = new TooBad();
		tooBad.x = 400;
		tooBad.y = 200;
		addChild(tooBad);
	}
	
	//Delay for a second to allow for the response UI to take effect, then go to the score screen
	setTimeout(transitionToEnd, 1000);
	
	function transitionToEnd():void
	{
		frameTransition("GameOver");
	}
}

function respondUI()
{
	if (correctAnswer)
	{
		//The player is CORRECT
		//Symbols
		yes.visible = true;
		yes.gotoAndPlay(1);
		no.visible = false;

		//Verbal messages
		yesMessage.visible = true;
		yesMessage.gotoAndPlay(1);
		noMessage.visible = false;
		lblAnswer.visible = false;
	}
	else
	{
		//The player is WRONG
		//Symbols
		no.visible = true;
		no.gotoAndPlay(1);
		yes.visible = false;

		//Verbal messages
		lblAnswer.visible = true;
		lblAnswer.gotoAndPlay(1);
		lblAnswer.lblAnswerTween.outputWordDisplay.text = myGame.currentGame.currentWord;
		lblAnswer.lblAnswerTween.expectedAnswerDisplay.text = myGame.currentGame.getExpectedAnswer();
		noMessage.visible = true;
		noMessage.gotoAndPlay(1);
		yesMessage.visible = false;
	}
}