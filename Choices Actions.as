import flash.text.FontStyle;
import flash.events.Event;
import fl.controls.RadioButton;
import fl.controls.RadioButtonGroup;

addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
answerButton.addEventListener(MouseEvent.CLICK, giveChAnswer);
btnSkip.addEventListener(MouseEvent.CLICK, finishRound);

//Add radioButtonGroup and its radioButtons
var possibleAnswers:RadioButtonGroup = new RadioButtonGroup("Possible Answers");
answer1.group = possibleAnswers;
answer2.group = possibleAnswers;
answer3.group = possibleAnswers;
answer4.group = possibleAnswers;
answerDefaultSelection.group = possibleAnswers;
var allAnswerButtons:Array = new Array(answer1, answer2, answer3, answer4);

////////////////////////////;

startChoices();
function startChoices(e:Event = null)
{
	gamePlaying = true;
	
	//All of the initial processes for starting the game

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

	updateChUI();
}

function giveChAnswer(e:Event = null)
{
	//Submits the answer if an answer has been selected
	if (possibleAnswers.selection != null)
	{
		correctAnswer = myGame.currentGame.submitAnswer(possibleAnswers.selection.label);
	}
	respondUI();

	finishRound();
}

function updateChUI()
{
	//The displayed round is 1 more than the actual value, as the actual value is used as an array index.
	lblCounter.text = (myGame.currentGame.round + 1).toString();
	//Displays the score
	lblScore.text = (myGame.currentGame.score.numCorrect * 100).toString();
	//Displays the next word
	outputBox.text = myGame.currentGame.currentWord;
	//Gives values to the Radio Buttons
	setRadioButtonWords();
}

//setRadioButtons gives new labels to the four radioButtons - one correct, and three incorrect
function setRadioButtonWords()
{
	//Deselect the selected radio button, if one has been selected
	if (possibleAnswers.selection != null)
	{
		/*This hidden radioButton becomes selected at the beginning of 
		the round, making none of the in-game radioButtons selected. This 
		is apparently the only way to do this, as simply saying that a 
		radioButton's selected property = false doesn't seem to make a 
		difference once a radioButton in a group is first selected.*/
		answerDefaultSelection.selected = true;
	}
	
	var dummyAnswers:Array = myGame.currentGame.randomWordsFromList(3, myGame.currentGame.getExpectedAnswer());
	
	/*correctAnswerLocation will receive a value between 
	0 and 3, which will decide which button holds the 
	correct answer (0 is far left, 3 is far right)*/
	var correctAnswerLocation:uint = Math.random() * 4;
	//daIndex holds the index of the dummyAnswers array
	var daIndex:uint = 0;
	
	//cycle through the radio buttons, and assign them words
	for (var i:uint = 0; i < 4; i++)
	{
		if (i == correctAnswerLocation)
		{
			//This radio button is labeled the correct answer
			allAnswerButtons[i].label = myGame.currentGame.getExpectedAnswer();
		}
		else
		{
			//This radio button is label as a random, dummy answer
			allAnswerButtons[i].label = dummyAnswers[daIndex];
			//the dummyAnswers index is incremented, as to not repeat the same dummy answer
			daIndex++;
		}
	}
}
	
	