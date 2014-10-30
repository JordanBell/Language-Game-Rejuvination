stop();

import flash.events.*;
import flash.display.*;
import flash.net.SharedObject;
import flash.utils.*;
import flash.ui.Keyboard;

//The translation popup menu is added, invisible by default
var transScreen:TranslationMenu = new TranslationMenu();
transScreen.x = 0;
transScreen.y = 0;

var pauseScreen:PauseMenu = new PauseMenu();
pauseScreen.x = 0;
pauseScreen.y = 0;

//A LanguageGameHandler is instantiated
var myGame:LanguageGameHandler = new LanguageGameHandler();

//A variable holds the language chosen by the user
var chosenLanguage:Language;

//Used for the settings menu & combo boxes
var largeCat:Boolean = false;
var mediumCat:Boolean = false;
var smallCat:Boolean = false;

var correctAnswer:Boolean;
var gamePlaying:Boolean = false;

//Initializing the saved data
var savedData:SharedObject = SharedObject.getLocal("languageGameData");
savedData.data.expTotal;
if (savedData.data.expTotal == null)
{
	savedData.data.expTotal = 0;
}

addEventListener(Event.ENTER_FRAME, setListeners);
addEventListener(Event.ENTER_FRAME, checkCategory);
btnHelp.addEventListener(MouseEvent.CLICK, openOnlineHelp);

/*The setListeners function dynamically adds event listeners depending on whether or not the 
button's presense on the stage is non-null*/
function setListeners(e:Event)
{
	switch (currentFrame)
	{
		case 1:
			//Language Selection frame
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
				
			btnSpanish.addEventListener(MouseEvent.CLICK, setSpanish);
			btnItalian.addEventListener(MouseEvent.CLICK, setItalian);
			btnGerman.addEventListener(MouseEvent.CLICK, setGerman);
			btnJapanese.addEventListener(MouseEvent.CLICK, setJapanese);
			btnPortuguese.addEventListener(MouseEvent.CLICK, setPortuguese);
			btnTurkish.addEventListener(MouseEvent.CLICK, setTurkish);
			btnFrench.addEventListener(MouseEvent.CLICK, setFrench);
			btnFinnish.addEventListener(MouseEvent.CLICK, setFinnish);
			btnDutch.addEventListener(MouseEvent.CLICK, setDutch);
			
			break;
		case 2:
			//Game Selection Frame
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
			btnPrev.addEventListener(MouseEvent.CLICK, previousMenu1);
			btnFlashCards.addEventListener(MouseEvent.CLICK, setFlashCards);
			btnChoices.addEventListener(MouseEvent.CLICK, setChoices);
			
			//The following eventListeners have been commented out until the gametypes have been developed
			//btnCountries.addEventListener(MouseEvent.CLICK, setCountries);
			//btnSentenceFiller.addEventListener(MouseEvent.CLICK, setSentenceFiller);
			
			break;
		case 3:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 4:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 5:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 6:
			//Settings Screen
			settingsScreenListeners();
			
			break;
		case 7:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			stage.addEventListener(Event.ENTER_FRAME, updateTimer);
			break;
		case 8:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			stage.addEventListener(Event.ENTER_FRAME, updateTimer);
			break;
		case 9:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			stage.addEventListener(Event.ENTER_FRAME, updateTimer);
			break;
		case 10:
			//Game Screen
			btnPause.addEventListener(MouseEvent.CLICK, pauseGame);
			stage.addEventListener(Event.ENTER_FRAME, updateTimer);
			break;
		case 11:
			//Score Screen
			btnTrans.addEventListener(MouseEvent.CLICK, translation);
			btnReplay.addEventListener(MouseEvent.CLICK, replayGame);
			btnNewGame.addEventListener(MouseEvent.CLICK, newGame);
			
			break;
		default:
			trace("WHAT FRAME ARE YOU EVEN ON?");
	}
	
	//Sets the event listeners for the settings screen
	function settingsScreenListeners():void
	{
		btnTrans.addEventListener(MouseEvent.CLICK, translation);
		btnPrev.addEventListener(MouseEvent.CLICK, previousMenu2);
		btnPlay.addEventListener(MouseEvent.CLICK, playGame);
	}
}

//////////////Menu Navigation\\\\\\\\\\\\\\\\\\\

//The frameTransition function adds the frameTrans movieClip, which blots out the screen and changes the frame 
function frameTransition(frameLocation):void
{
	//Starts the frame transition
	var frameTrans:FrameTransition = new FrameTransition();
	frameTrans.x = -30;
	frameTrans.y = -20;
	addChild(frameTrans);
	
	//Goes to second frame (as the first frame will stop the animation with the stop() code in the frame) and plays it
	frameTrans.gotoAndPlay(2);

	//Adds an event listener to allow for frame specific code.
	stage.addEventListener(Event.ENTER_FRAME, checkForFrames);
	function checkForFrames(e:Event)
	{
		/*Once the transition has reached the point where it has blotted out the screen, 
		the frame changes to the frameLocation argument*/
		if (frameTrans.currentFrame == 12)
		{
			gotoAndStop(frameLocation);
		}
		if (frameTrans.currentFrame == 24)
		{
			if (frameTrans != null)
			{
				//The transition has ended, so it is removed from view
				removeChild(frameTrans);
			}
			stage.removeEventListener(Event.ENTER_FRAME, checkForFrames);
		}
	}
}

//This previous menu brings up the previous frame
function previousMenu1(e:Event):void
{
	frameTransition(currentFrame - 1);
}

//PreviousMenu2 brings up the game selection menu, and is used in the settings menus.
function previousMenu2(e:Event):void
{
	frameTransition("Selection_Games");
	stage.removeEventListener(Event.ENTER_FRAME, checkCategory);
}

/////////TRANSLATION///////////

//The translation function adds the translation screen and all of its functionality
function translation(e:Event = null):void
{
	//The menu is added to the screen
	addChild(transScreen);
	transScreen.x = 0;
	transScreen.y = 0;

	//Adds a list of every single english word in the database to the allWordDisplay text box
	transScreen.allWordDisplay.text = myGame.englishWordReturn().toString();
	
	//Button event listeners are added for the translation screen
	transScreen.btnReturn.addEventListener(MouseEvent.CLICK, closeTrans);
	transScreen.btnTranslate.addEventListener(MouseEvent.CLICK, startTrans);
	
	function startTrans(e:Event):void
	{
		//Error checking for empty boxes
		if ((transScreen.comboFrom.text != "") && (transScreen.comboTo.text != ""))
		{
			var from:String = transScreen.comboFrom.text.toLowerCase();
			var to:String = transScreen.comboTo.text.toLowerCase();
			var input:String = transScreen.translationInput.text.toLowerCase();
			
			//Use the chosen settings to return the translated word to the output text box
			transScreen.translationOutput.text = translate(from, to, input);
		}
		
		//Returns a translation for the translationOutput
		function translate(from:String, to:String, input:String):String
		{
			return(myGame.currentGame.translateWord(input, myGame.getLangByName(from), myGame.getLangByName(to)));
		}
	}
	
	//Closes the translation screen
	function closeTrans(e:Event):void
	{
		removeChild(transScreen);
		transScreen.btnReturn.removeEventListener(MouseEvent.CLICK, closeTrans);
		transScreen.btnTranslate.removeEventListener(MouseEvent.CLICK, startTrans);
	}
}

////////GAME SELECTION MENU\\\\\\\\\\

function setFlashCards(e:Event){
	myGame.currentGame = myGame.flashCards;
	frameTransition(myGame.currentGame.settingsFrameName);
}

function setChoices(e:Event){
	myGame.currentGame = myGame.choices;
	frameTransition(myGame.currentGame.settingsFrameName);
}

//The following functions have been commented out until the gametypes have been developed
/*function setCountries(e:Event){
	myGame.currentGame = myGame.countries;
	frameTransition(myGame.currentGame.settingsFrameName);
}

function setSentenceFiller(e:Event){
	myGame.currentGame = myGame.sentenceFiller;
	frameTransition(myGame.currentGame.settingsFrameName);
}*/

//The checkingCategory function dynamically enables the correct kind of subcategory combobox
function checkCategory(e:Event)
{
	if (comboCategory != null)
	{
		//This function sets the subCategory UI based on the value of the category combobox
		if (comboCategory.text != "")
		{
			//The type of subcategory revealed is dependant on which category has been chosen
			largeCat = ((comboCategory.text == "Common Nouns") || (comboCategory.text == "Common Verbs") 
						|| (comboCategory.text == "Common Adjectives") || (comboCategory.text == "Numbers") 
						|| (comboCategory.text == "Travel"));
			mediumCat = ((comboCategory.text == "Family") || (comboCategory.text == "Phrases") 
						 || (comboCategory.text == "Activities"));
			smallCat = ((comboCategory.text == "Pronouns") || (comboCategory.text == "Colours") 
						|| (comboCategory.text == "Countries"));
			
			comboSubcategoryLarge.enabled = largeCat;
			comboSubcategoryLarge.visible = largeCat;
			
			comboSubcategoryMedium.enabled = mediumCat;
			comboSubcategoryMedium.visible = mediumCat;
			
			comboSubcategorySmall.enabled = smallCat;
			comboSubcategorySmall.visible = smallCat;
		}
		else
		{
			//All subcategories are disabled if no category has been enabled
			largeCat = false;
			mediumCat = false;
			smallCat = false;
			comboSubcategoryLarge.enabled = false;
			comboSubcategoryMedium.enabled = false;
			comboSubcategorySmall.enabled = false;
			
			//Only the default, large subcategory combobox is visible
			comboSubcategoryLarge.visible = true;
			comboSubcategoryMedium.visible = false;
			comboSubcategorySmall.visible = false;
		}
	}
}

/////////EVENT FUNCTIONS//////////

function setSpanish(event:MouseEvent):void
{
	chosenLanguage = myGame.Spanish;
	endLanguageSelection();
	
}
function setItalian(event:MouseEvent):void
{
	chosenLanguage = myGame.Italian;
	endLanguageSelection();
}
function setFrench(event:MouseEvent):void
{
	chosenLanguage = myGame.French;
	endLanguageSelection();
}
function setGerman(event:MouseEvent):void
{
	chosenLanguage = myGame.German;
	endLanguageSelection();
}
function setJapanese(event:MouseEvent):void
{
	chosenLanguage = myGame.Japanese;
	endLanguageSelection();
}
function setPortuguese(event:MouseEvent):void
{
	chosenLanguage = myGame.Portuguese;
	endLanguageSelection();
}
function setFinnish(event:MouseEvent):void
{
	chosenLanguage = myGame.Finnish;
	endLanguageSelection();
}
function setTurkish(event:MouseEvent):void
{
	chosenLanguage = myGame.Turkish;
	endLanguageSelection();
}
function setDutch(event:MouseEvent):void
{
	chosenLanguage = myGame.Dutch;
	endLanguageSelection();
}

function endLanguageSelection():void{
	myGame.setLanguage(myGame.English, chosenLanguage);
	frameTransition(2);
}

//The function which is executed when the play button is clicked 
function playGame(e:Event)
{
	//If all of the settings have been set:
	if ((comboCategory.text != "") && (comboGameDifficulty.text != "") && (comboFormat.text != "") 
		&& ((comboSubcategoryLarge.text != "") || (comboSubcategoryMedium.text != "") || (comboSubcategorySmall.text != ""))){
		
		//These statements set the input and output language, based on the chosen format. EtoF means English to Foreign.
		if (comboFormat.selectedItem.data == "EtoF")
		{
			LanguageGameHandler.inputLanguage = chosenLanguage;
			LanguageGameHandler.outputLanguage = myGame.English
		}
		else
		{
			LanguageGameHandler.inputLanguage = myGame.English;
			LanguageGameHandler.outputLanguage = chosenLanguage
		}
		
		//Set all the properties for the game and handler, depending on which subcategory box is enabled
		if (largeCat){ myGame.currentGame.settingsTo(LanguageGameHandler.outputLanguage, 
													 comboCategory.selectedItem.data, 
													 comboGameDifficulty.selectedItem.data, 
													 comboSubcategoryLarge.selectedItem.data, 
													 comboFormat.selectedItem.data) }
		if (mediumCat){ myGame.currentGame.settingsTo(LanguageGameHandler.outputLanguage, 
													  comboCategory.selectedItem.data, 
													  comboGameDifficulty.selectedItem.data, 
													  comboSubcategoryMedium.selectedItem.data, 
													  comboFormat.selectedItem.data) }
		if (smallCat){ myGame.currentGame.settingsTo(LanguageGameHandler.outputLanguage, 
													 comboCategory.selectedItem.data, 
													 comboGameDifficulty.selectedItem.data, 
													 comboSubcategorySmall.selectedItem.data, 
													 comboFormat.selectedItem.data) };
		
		frameTransition(myGame.currentGame.gameFrameName);
	}
}

function pauseGame(e:Event):void
{
	myGame.currentGame.pauseGameTimer();
	
	//Add the pause menu
	addChild(pauseScreen);

	//Add listeners for the buttons in the pause menu
	pauseScreen.btnReturn.addEventListener(MouseEvent.CLICK, returnToGame);
	pauseScreen.btnMenu.addEventListener(MouseEvent.CLICK, returnToMenu);
	pauseScreen.btnRestart.addEventListener(MouseEvent.CLICK, restartGame);
}

function returnToGame(e:Event):void
{
	unpause();
	myGame.currentGame.resumeIfPaused();
}

function returnToMenu(e:Event):void
{
	unpause();
	//The timer does not need to be restarted, so the variable signifying this is set to false
	myGame.currentGame.timerPaused = false;
	frameTransition("Selection_Games");
}

//When the game is restarted, it is unpaused, 
function restartGame(e:Event):void
{
	unpause();
	myGame.currentGame.restartGameTimer();
	
	//A new game is started
	switch (myGame.currentGame.name)
	{
		case "FlashCards":
			startFlashCards();
			break;
		case "Choices":
			startChoices();
			break;
		default:
			trace("The game name was not recognized while trying to remove the giveAnswer listener.");
	}
	
}

function unpause():void
{
	//Remove the pause screen
	removeChild(pauseScreen);
	//Remove pause screen button listeners
	pauseScreen.btnReturn.removeEventListener(MouseEvent.CLICK, returnToGame);
	pauseScreen.btnMenu.removeEventListener(MouseEvent.CLICK, returnToMenu);
	pauseScreen.btnRestart.removeEventListener(MouseEvent.CLICK, restartGame);
}

//Final score screen button events
function replayGame(e:Event){
	//Go to settings screen
	frameTransition(myGame.currentGame.gameFrameName);
}

function newGame(e:Event){
	frameTransition("Selection_Games");
}

function openOnlineHelp(e:Event):void
{
	var onlineHelpURL:URLRequest = new URLRequest("Home.htm");
 	navigateToURL(onlineHelpURL);

}