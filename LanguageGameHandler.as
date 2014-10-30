package 
{

	/*This class uses properties and methods to carry out all processes which require
	data from multiple other classes. Therefore, it contains instances of four games
	and nine languages, reflective of the number of game types and languages available
	in the program. On top of this, the Language Game Handler constructor contains all
	3000+ words and phrases to be used within the game.*/
	public class LanguageGameHandler
	{

		//All of the games are instantiated, as well as a 'current game' variable to hold a copy of the game chosen by the user
		public var flashCards:Game = new Game("FlashCards");
		public var choices:Game = new Game("Choices");
		public var countries:Game = new Game("Countries");
		public var sentenceFiller:Game = new Game("SentenceFiller");
		public var currentGame:Game = flashCards;

		//Instantiates all 10 languages
		public var English:Language = new Language("English");
		public var Spanish:Language = new Language("Spanish");
		public var French:Language = new Language("French");
		public var Italian:Language = new Language("Italian");
		public var German:Language = new Language("German");
		public var Japanese:Language = new Language("Japanese");
		public var Finnish:Language = new Language("Finnish");
		public var Turkish:Language = new Language("Turkish");
		public var Dutch:Language = new Language("Dutch");
		public var Portuguese:Language = new Language("Portuguese");
		/*An allLanguages array holds every language, in case they ever need 
		to be cycled through while traversing or searching through them*/
		public var allLanguages:Array = new Array(English,Spanish,French,Italian,German,Japanese,Finnish,Turkish,Dutch,Portuguese);
		
		/*The variables of inputLanguage and outputLanguage change depending
		on what the user chooses. English is always either the input or output
		language, depending on the format chosen by the user during the game.
		These are static in order to be accessed by the Game classes in the
		submitAnswer methods.*/
		public static var inputLanguage:Language;
		public static var outputLanguage:Language;

		//The constructor sets the Word Database
		public function LanguageGameHandler()
		{
			//The word set array temporarily holds all of the words being added to a language category
			var wordSetArray:Array = new Array();
			
			////////////////////////////////////////ENGLISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			//Nouns
			wordSetArray.push(	"easyList", "dog", "cat", "man", "woman", "girl", "boy", "car", "coffee", "beach", "house", 
							  	"food", "drink", "me", "child", "bird", "book", "table", "chair", "phone", "shop", "bed", "day", 
							  	"tea", "tourist", 
								"mediumList", "animal", "person", "waiter", "sir", "money", "madam", "plane", "boat", "train", 
								"bus", "river", "breakfast", "lunch", "dinner", "road", "dessert", "desert", "bathroom", "name", 
								"waiter", "hotel", "english",
								"hardList", "elevator", "apartment", "grocery store", "taxi", "air port", "train station", 
								"restaurant", "building", "traffic", "spanish", "german", "italian", "french", "portuguese", 
								"turkish", "finnish", "dutch", "japanese");
			English.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "help", "go", "talk", "see", "get", "run", "walk", "hear", "read", "buy", "sell", 
							  	"phone",
								"mediumList", "text", "take", "drive", "wait", "speak", "swim", "learn", "sleep", "give", "sit", 
								"stand",
								"hardList", "pronounce", "choose", "know", "build", "work","smell","travel", "wait", "feel");
			English.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "good", "bad", "pretty", "ugly", "big", "small", "happy", "sad", "cold", "hot", 
								"mediumList", "tired", "tall", "short", "smart", "dumb", "angry", "loud", "quiet", "fast", "slow", 
								"hardList", "bright", "dark", "clear", "confused", "annoying", "rude", "polite", "expensive", 
								"cheap");
			English.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten",
								"mediumList", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety", 
								"one hundred", 
								"hardList", "two hundred", "three hundred", "four hundred", "five hundred", "six hundred", 
								"seven hundred", "eight hundred", "nine hundred", "one thousand", "ten thousand", 
								"one hundred thousand", "one million");
			English.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "house", "me", "buy", "go", "phone", "shop", "car", "drive", "walk", "run", "cycle", 
							  	"train", "bus", "speak", "eat", "drink", "hotel",
								"mediumList", "sir", "madam", "breakfast", "lunch", "dinner", "road", "travel", "borrow", "taxi", 
								"money", "hello", "boat", "plane", "beach",
								"hardList", "apartment", "grocery store", "air port", "train station", "restaurant", "building", 
								"traffic", "direction", "address", "coffee", "tourist");
			English.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			English.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hello", "good morning", "good afternoon", "good evening", "good night", "goodbye", 
							  	"I don't understand", "my name is-", 
								"secondList", "how much is-", "do you speak-", "where is-", "how much is-", "excuse me", 
								"thank you", "you're welcome");
			English.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basketball", "hockey", "golf", "cricket", "baseball", "rugby", 
							  	"badminton", "squash", 
								"secondList", "shopping", "walking", "swimming", "reading", "horse riding", "music", "sunbathing", 
								"relaxing", "sight seeing");
			English.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("I", "he", "she", "they", "us", "they", "you", "you", "it");
			English.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown");
			English.colours.setWordsTo(wordSetArray);
			
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "canada", "england", "australia", "france", "spain", "mexico", "brazil", 
							  "germany", "russia",  "sweden", "china", "japan", "india", "holland", "egypt", "italy", "turkey");
			English.countries.setWordsTo(wordSetArray);
			


			////////////////////////////////////////SPANISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "perro", "gato", "hombre", "mujer", "chica", "chico", "coche", "café", "playa", "casa", 
							  	"comida", "bebida", "me", "niño", "ave", "libro", "mesa", "silla", "teléfono", "tienda", "cama", 
								"día", "tazas", "turista",
								"mediumList", "animal", "persona", "camarero", "señor", "dinero", "señora", "plan", "barco", "tren", 
								"autobús", "rio", "desayuno", "almuerzo", "cena", "carretera", "postre", "desierto","cuarto de baño",
								"nombre","camarero","hotel","inglés",
								"hardList", "ascensor", "apartamento", "supermercado", "taxi", "puerto de aire", "estación de tren", 
								"restaurant", "edificio", "tráfico", "españoles", "alemán" , "italian", "francés", "portugués", 
								"turco", "finlandia", "dutch", "japanese");
			Spanish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ayuda", "ir", "hablar", "ver", "get", "correr", "paseo", "escuchar", "leer", "comprar", 
							  	"vender", "teléfono",
								"mediumList", "texto", "llevar", "lector", "esperar", "hablar", "nadar", "aprender", "espera", "dar", 
								"siéntate", "de pie",
								"hardList", "pronunciar", "elegir", "saber", "construir", "trabajo", "olor", "viajar", "esperar", 
								"sentir");
			Spanish.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "bueno", "malo", "bonito", "feo", "grande", "pequeño", "feliz", "triste", "frío", 
							  	"caliente",
								"mediumList", "cansado", "alto", "corto", "elegante", "tonto", "enojado", "fuerte", "tranquilo", 
								"rápido", "lento",
								"hardList", "brillante", "oscuridad", "claro", "confuso", "molesto", "grosero", "educado", "caro", 
								"barato");
			Spanish.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "cero", "uno", "dos", "tres", "cuatro", "cinco", "seis", "siete", "ocho", "nueve", 
							  	"diez", 
							  	"mediumList", "veinte", "treinta", "cuarenta", "cincuenta", "sesenta", "setenta", "ochenta", 
								"noventa", "uno cien", 
							  	"hardList", "doscientos", "trescientos", "cuatrocientos", "quinientos", "seiscientos", "setecientos", 
								"ochocientos", "novecientos", "mil", "diez mil", "ciento mil", "un millón");
			Spanish.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "comprar", "ir", "teléfono", "tienda", "coche", "lector", "paseo", 
							  	"correr", "ciclo", "tren", "autobús", "hablar", "comer", "beber", "hotel",
								"mediumList", "señor", "señora", "desayuno", "almuerzo", "cena", "carretera", "viajar", 
								"pedir prestado", "taxi", "dinero", "hola", "barco", "avión", "playa",
								"hardList", "apartamento", "supermercado", "puerto de aire", "estación de tren", "restaurant", 
								"edificio", "tráfico", "dirección", "dirección", "café", "turista");
			Spanish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "padre", "madre", "hermano", "hermana", "hijo", "hija",
								"secondList", "tío", "tía", "abuelo", "abuela", "primo", "sobrino", "sobrina");
			Spanish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hola", "buenos días", "buenas tardes", "buenas tardes", "buenas noches", "adiós", 
							  	"no entiendo", "mi nombre es-",
								"secondList", "cuánto es-", "hacer hablar-", "¿dónde está-", "cuánto es-", "perdón", "gracias", 
								"de nada");
			Spanish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "deporte", "tenis", "baloncesto", "hockey", "golf", "grillo", "pelota", "rugby", 
							  	"bádminton", "calabaza",
								"secondList", "compras", "paseo", "piscina", "leer", "montar a caballo", "música", "tomar el sol", 
								"relajarse", "turismo");
			Spanish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("yo", "él", "ella", "ellos", "nos", "ellos", "usted", "ustedes", "lo");
			Spanish.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rojo", "naranja", "amarillo", "azul", "púrpura", "negro", "blanco", "verde", "rosa", "gris", 
							  "marron");
			"red", "orange", "yellow", "blue", "purple", "black", "white", "green", "pink", "grey", "brown"
			Spanish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("américa", "canadá", "inglaterra", "australia", "francia", "españa", "méxico", "brasil", "alemania", 
							  "rusia", "suecia", "china", "japon", "indias", "holanda", "egipto", "italia", "pavo");
			Spanish.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////FRENCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "chien", "chat", "homme", "femme", "fille", "enfant", "voiture", "chaud", "plage", 
							  	"maison", "cuisine", "boisson ","moi","enfant","oiseau","livre","table","chaise","téléphone",
							  	"magasin","lit","jour","vert","touriste",
								"mediumList", "animal", "personne", "serveur", "monsieur", "argent", "madame", "avion", "bateau", 
								"train", "bus", "fleuve", "petit-déjeuner","repas","souper","route","dessert","désert",
								"sallede bain","nom","serveur","hôtel","anglais",
								"hardList", "ascenseur", "appartement", "épicerie", "taxi", "port d'air", "gare", "restaurant", 
								"ciel", "trafic", "espagnol", "allemand" , "italie", "français", "portugais", "turque", 
								"finlandais", "hollandais", "japonais");
			French.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "aider", "aller", "parler", "voir", "obtenir", "courir", "marcher", "entendre", "lire", 
							  "acheter", "vendre", "téléphone",
								"mediumList", "texte", "prendre", "disque", "attendre", "parler", "nager", "apprendre", "sommeil", 
								"donner", "assis", "debout",
								"hardList", "prononcer", "choisir", "savoir", "construire", "travail", "odeur", "voyage",
								"attendre", "sentir");
			French.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "bon", "mauvais", "joli", "laid", "grand", "petit", "heureux", "triste", 
							  "froid", "chaud",
								"mediumList", "fatigué", "grandiose", "court", "portrait", "muet", "en colère", "fort", "calme", 
								"rapide", "lent",
								"hardList", "lumineux", "noir", "clair", "confus", "ennuyeux", "rude", "poli", "cher", "pas cher");
			French.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "zéro", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix",
								"mediumList", "vingt", "trente", "quarante", "cinquante", "soixante", "soixante", "quatre-vingts", 
								"quatre-vingt-dix", "cent",
								"hardList", "deux cents", "trois cents", "quatre cent", "cinq cents", "six cents", "sept cents", 
								"huit cents", "neuf cent", "mille", "dix mille","cent mille","un million");
			French.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "maison", "moi", "acheter", "go", "téléphone", "magasin", "voiture", "conduire", 
							  	"marche", "courir", "faire du vélo", "train","bus","parler","manger","boisson","hôtel",
								"mediumList", "monsieur", "madame", "petit", "repas", "souper", "route", "voyage", "emprunter", 
								"taxi", "argent", "bonjour", "bateau "," plan "," plage ",
								"hardList", "appartement", "épicerie", "port d'air", "gare", "restaurant", "ciel", "trafic", 
								"direction", "adresse", "chaud", "touriste");
			French.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "père", "mère", "frère", "sœur", "fils", "fille",
								"secondList", "oncle", "tante", "grand-père", "grand-mère", "cousin", "neveu", "nièce");
			French.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "bonjour", "bonjour", "bon après-midi", "bonsoir", "bonne nuit", "au revoir", 
							  	"je ne comprends pas", "mon nom est-",
								"secondList", "combien est-", "parlez-vous-", "où est-", "combien est-", "excusez-moi", "merci", 
								"vous êtes les bienvenus");
			French.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "football", "tennis", "basket-ball", "hockey", "golf", "cricket", "base-ball", 
							  	"rugby", "badminton", "courge",
								"secondList", "achats", "marche", "baignade", "lecture", "cheval", "musique", "bain de soleil", 
								"relaxant", "voir de vue");
			French.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("je", "il", "elle", "ils", "nous", "ils", "vous", "vous", "it");
			French.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rouge", "orange", "jaune", "bleu", "jaune", "noir", "blanc", "vert", "rose", "gris", "brun");
			French.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amérique"​​, "canada", "angleterre", "australie", "france", "espagne", "mexique", "bresil", 
							  "allemagne", "russie", "suède", "chine", "japon","inde","hollandaise","egypte","italie","turquie");
			French.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////ITALIAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "cane", "gatto", "uomo", "donna", "ragazza", "ragazzo", "auto", "caffè", "spiaggia", 
							  	"casa", "alimento", "bere","me","bambino","bianco","libro","tavolo","sedia","telefono","negozio",
							  	"letto","giornata","tazza","turista",
								"mediumList", "animale", "persona", "cameriere", "signore", "denaro", "signora", "piano", "barca", 
								"treno", "autobus", "fiume", "colazione","pranzo","cena","strada","dessert","desertico","bagno",
								"nome","cameriere","albergo","inglese",
								"hardList", "ascensore", "appartamento", "negozio", "taxi", "aria porto", "stazione ferroviaria", 
								"ristorante", "costruzione", "traffico", "spagnolo", "tedesco" , "italiano", "francese", 
								"portoghese", "turco", "finlandese", "olandese", "giapponese");
			Italian.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "aiuto", "andare", "parlare", "vedere", "ottenere", "correre", "camminare", 
							 	 "ascoltare", "leggere", "acquistare", "vendere", "telefono",
								"mediumList", "testo", "prendere", "guida", "aspettare", "parlare", "nuotare", "imparare", 
								"sonno", "dare", "sedersi", "stare in piedi",
								"hardList", "pronunciare", "scegliere", "conoscere", "costruire", "lavoro", "odore", 
								"viaggio", "aspettare", "sentire");
			Italian.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "buono", "cattivo", "ragazza", "brutto", "grande", "piccolo", "felice", 
							  	"triste", "freddo", "caldo",
								"mediumList", "stanco", "alto", "breve", "intelligente", "stupido", "arrabbiato", "forte", 
								"tranquillo", "veloce", "lento",
								"hardList", "brillante", "scuro", "chiaro", "confuso", "fastidioso", "scortese", "gentile", 
								"costoso", "economico");
			Italian.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "zero", "uno", "due", "tre", "quattro", "cinque", "sei", "sette", "otto", 
							  	"nove", "dieci",
								"mediumList", "venti", "trenta", "quaranta", "cinquanta", "sessanta", "settanta", "ottanta", 
								"novanta", "cento",
								"hardList", "duecento", "trecento", "quattrocento", "cinquecento", "seicento", "settecento", 
								"ottocento", "novecento", "mille", "diecimila", "centomila", "milione");
			Italian.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "compro", "andare", "telefono", "negozio", "auto", "guidare", 
							  	"camminata", "correre", "ciclo", "treno","autobus","parlare","mangiare","bere","albergo",
								"mediumList", "signore", "signora", "colazione", "pranzo", "cena", "strada", "viaggio", 
								"prendere in prestito", "taxi", "denaro", "ciao", "barca","piano","spiaggia",
								"hardList", "appartamento", "negozio", "aria porto", "stazione", "ristorante", "costruzione", 
								"traffico", "direzione", "indirizzo", "caffè", "turista");
			Italian.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "padre", "madre", "fratello", "sorella", "figlio", "figlia",
								"secondList", "zio", "zia", "nonno", "nonna", "cugino", "nipote", "nipotina");
			Italian.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "ciao", "buongiorno", "buon pomeriggio", "buonasera", "buona notte", "arrivederci", 
							  	"non capisco", "il mio nome è-",
								"secondList", "quanto è-", "fai-Speak", "dove è-", "quanto è-", "mi scusi", "grazie", 
								"sei il benvenuto");
			Italian.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "calcio", "tennis", "pallacanestro", "hockey", "golf", "grillo", "baseball", "rugby", 
							  	"volano", "squash",
								"secondList", "acquisti", "camminare", "nuotare", "lettura", "cavallo", "musica", 
								"prendere il sole", "rilassante", "giri turistici");
			Italian.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("io", "lui", "lei", "loro", "noi", "loro", "tu", "voi", "essa");
			Italian.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rosso", "giallo", "verde", "blu", "viola", "nero", "bianco", "verde", "rosa", "grigio", 
							  "marrone");
			Italian.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("america", "Canada", "inghilterra", "australia", "francia", "spagna", "messico", "brasile", 
							  "germania", "russia", "svezia", "cina", "giappone","india","olanda","egitto","italia","tacchino");
			Italian.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////GERMAN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "hund", "katze", "mann", "frau", "frau", "junge", "auto", "kaffee", "strand", 
							  	"haus", "essen", "trinken","mir","kind","vogel","buch","tisch","stuhl","telefon","geschäft",
							  	"bett","tag","tee","tourist",
								"mediumList", "animal", "person", "kellner", "herr", "geld", "frau", "plane", "boot", "trainieren", 
								"bus", "fluss", "frühstück","lunch","essen","straße","essen","wüste","badezimmer","name","kellner",
								"hotel","englisch",
								"hardList", "aufzug", "wohnung", "supermarkt", "taxi", "luft-port", "bahnhof", "restaurant", 
								"entwerfen", "verkehr", "spanisch", "deutsch" , "italienisch", "französisch", "portugiesisch", 
								"türkisch", "finnisch", "holland", "japanisch");
			German.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "hilfe", "gehen", "sprechen", "sehen", "bekommen", "laufen", "laufen", "hören", 
							  	"lesen", "kaufen", "verkaufen", "telefon",
								"mediumList", "text", "nehmen", "fahren", "warten", "sprechen", "schwimmen", "lernen", 
								"schlafen", "geben", "sitzen", "stehen",
								"hardList", "sprechen", "entscheiden", "wissen", "bauen", "arbeit", "geruch", "reisen", 
								"warten", "fühlen");
			German.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "gut", "schlecht", "schön", "hässlich", "groß", "klein", "glücklich", "traurig", 
							  	"kalt", "heiß",
								"mediumList", "müde", "hoch", "kurz", "pfiffig", "dumm", "aufgebracht", "laut", "ruhig", 
								"schnell", "langsam",
								"hardList", "hell", "dunkel", "klar", "verwirrt", "ärgerlich", "unhöflich", "höflich", 
								"teuer", "billig");
			German.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "null", "eins", "zwei", "drei", "vier", "fünf", "sechs", "sieben", "acht", 
							 	 "neun", "zehn",
								"mediumList", "20", "30", "40", "50", "60", "70", "80", "90", "hundert",
								"hardList", "200", "300", "400", "500", "600", "700", "800", "900", "tausend", 
								"zehntausend","hunderttausend","million");
			German.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "haus", "mir", "kaufen", "gehen", "telefon", "geschäft", "auto", "fahren", "gehen", 
							  	"laufen", "radeln", "zug","bus","sprechen","essen","trinken","hotel",
								"mediumList", "herr", "frau", "frühstück", "mittagessen", "abendessen", "reisen", "reisen", 
								"borgen", "taxi", "geld", "hallo", "boot","flugzeug","strand",
								"hardList", "wohnung", "supermarkt", "luft-port", "bahnhof", "restaurant", "entwerfen", 
								"verkehr", "richtung", "adresse", "kaffee", "tourist");
			German.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "vater", "mutter", "bruder", "schwester", "sohn", "tochter",
								"secondList", "onkel", "tante", "großvater", "großmutter", "cousin", "neffe", "nichte");
			German.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hallo", "guten morgen", "guten tag", "guten abend", "gute nacht", 
							 	 "auf wiedersehen", "ich verstehe nicht", "mein name ist-",
								"secondList", "wie viel-", "sprechen sie-", "wo ist-", "wie viel ist-", "excuse me", 
								"danke", "du bist willkommen");
			German.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "ball", "tennis", "korbball", "eishockey", "golf", "kricket", "baseball", "rugby", 
							 	 "federball", "squash",
								"secondList", "einkaufen", "fuß", "schwimmen", "lesen", "reiten", "musik", "sonnen", "entspannt", 
								"besichtigung");
			German.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("ich", "er", "sie", "sie", "uns", "sie", "du", "sie", "es");
			German.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rot", "orange", "gelb", "blau", "lila", "schwarz", "weiß", "grün", "rosafarben", "grau", "braun");
			German.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amerika", "kanada", "england", "australien", "frankreich", "spanien", "mexico", "brasilien", 
							  "deutschland", "russisch", "schweden", "china", "japan","indien","holland","Ägypten",
							  "italien","türkei");
			German.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////JAPANESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "inu", "neko", "dansei", "josei", "on'nanoko", "otokonoko" , "kuruma", "kōhī", "bīchi", 
							 	 "jūtaku", "shokuhin", "inryō", "watashi", "kodomo", "tori" , "hon" , "tēburu" , "isu" , "denwa" , 
							 	 "shoppu", "beddo", "hi" , "cha","kankō" , 
							  	"MediumList" , "dōbutsu" , "hito" , "u~eitā" , "sā" , "okane" , "madamu", "hikōki" , "bōto" , 
								"densha" , "basu" , "kawa", "chōshoku ","chūshoku","yūshoku","dōro","dezāto","sabaku","yokushitsu",
								"namae","ueitā","hoteru" , "eigo" , 
							  	"HardList", "erebētā", "manshon","shokuryōhin-ten","takushī","eāpōto","-eki","resutoran",
								"tatemono","torafikku","supeingo","doitsugo","itaria-go","furansugo","porutogaru-go","nihongo" , 
								"oranda", "finrando", "toruko");
			Japanese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "uru" , "kau" , "geitaidenwa o yomu" , "kiku", "aruku", "jikkō", "shutoku", "miru" , 
							 	 "tōku", "iku" , "herupu",
							  	"MediumList" , "tekisuto" , "tatsu", "suwaru", "ataeru", "manabu", "oyogu", "hanasu", "suimin", 
								"matsu", "doraibu o toru", 
							 	"HardList", "kōchiku" , "shitte iru" , "sentaku" , "shigoto", "kaori" , "ryokō", "taiki", 
								"hatsuon", "kanjiru");
			Japanese.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList" , "yoi" , "warui" , "atsui", "samui", "kanashī", "ureshī", "ko" , "dai" , "minikui" , 
							  	"kirei" , 
							  	"MediumList", "osoi" , "hayai" , "shizuka", "sōzōshī", "ikari" , "damu", "sumāto" , "shōto" , 
								"senotakai", "tsukareta",
							  	"HardList" , "yasui" , "kōka", "reigi tadashī", "shitsurei", "urusai", "konran" , "kuria" , 
								"kurai" , "akarui");
			Japanese.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "zero", "ichi", "ni", "san", "shi", "go", "roku", "nana", "hachi", "kyu", "juu",
								"mediumList", "nijuu", "sanjuu", "yonjuu", "gojuu", "rokujuu", "nanajuu", "hachijuu", 
								"kyujuu", "hyaku", 
								"hardList", "nihyaku", "sanbyaku", "yonhyaku", "gohyaku", "roppyaku", "nanhyaku", "happyaku", 
								"kyuhyaku", "sen", "man", "mansen", "sensen");
			Japanese.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList" , "ie" , "watashi", "kau", "iku" , "denwa" , "shoppu" , "kuruma", "doraibu", "sanpo", 
							  	"jikkō", "saikuru", "ressha" , "basu" , "hanasu" , "taberu" , "nomu" , "hoteru" , 
							  	"MediumList", "sensei", "madamu", "chōshoku" , "chūshoku", "yūshoku", "dōro","ryokō","kariru",
								"takushī","okane","kon'nichiwa","bōto","hikōki","bīchi" , 
								"HardList", "manshon", "shokuryōhin-ten", "eāpōto", "tetsudō no eki", "resutoran", "tatemono",
								"torafikku","hōkō","adoresu","kōhī","kankōkyaku");
			Japanese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"FirstList" , "chichi","haha","otōto","imōto","musuko","musume", 
							  	"SecondList", "oji","oba","sofu","sobo","itoko","oi","mei");
			Japanese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"FirstList", "kon'nichiwa", "ohayō", "kon'nichiwa", "konbanwa", "oyasumi", "sayonara" , 
							  	"watashi wa rikai shite inai", "Watashinonamaeha-" , 
							  	"SecondList", "-wa dono kurai", "hanasu - anata wa nan", "doko ni aru-", "ikuradesu ka-", 
								"dōitashimashite", "arigatō" , "sumimasen");
			Japanese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"FirstList", "sakkā", "tenisu", "basukettobōru", "hokkē", "gorufu", "kuriketto", "yakyū", 
							 	"ragubī", "badominton", "sukasshu" , 
							  	"SecondList", "kaimono", "u~ōkingu", "suiei", "dokusho", "shiryoku ga mite", "rirakkusu", 
								"nikkōyoku", "ongaku", "jōba");
			Japanese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("watashi","kare","kanojo","karera","watashitachi","karera","anata","anatatachi","sore");
			Japanese.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("aka","orenji","ki","buraun","gurē","pinku","midori","shiro","kuro","murasaki","ao");
			Japanese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amerika","kanada","igirisu","ōsutoraria","furansu","supein","mekishiko","burajiru","doitsu",
							  "roshia","suu~ēden","chūgoku","nihon","indo","oranda","ejiputo","itaria","shichimenchō");
			Japanese.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////FINNISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "koira", "kissa", "mies", "nainen", "tyttö", "poika", "auto", "kahvi", "ranta", 
							 	"talo", "ruoka", "juoma","me","lapsi","lintu","kirja","taulukko","tuoli","puhelin","kauppa",
							 	"sänky","päivä","tee","turisti",
								"mediumList", "eläin", "henkilö", "tarjoilija", "herra", "rahaa", "rouva", "taso", "vene", 
								"juna", "bussi", "joki", "breakfast","lounas","illallinen","tie","jälkiruoka","aavikko",
								"kylpyhuone","nimi","tarjoilija","hotelli","englanti",
								"hardList", "hissi", "huoneisto", "ruokakauppaan", "taksi", "lentoliikenteen portti", 
								"juna-asema", "ravintola", "rakennus", "liikenne", "espanja", "saksa", "italialainen", 
								"ranskalainen", "portugali", "turkki", "suomalainen", "dutch", "japanilainen");
			Finnish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "apua", "mennä", "puhua", "nähdä", "saada", "ajaa", "kävellä", "kuulla", 
							  	"lukea", "osta", "myy", "puhelin",
								"mediumList", "tekstin", "ottaa", "ajaa", "odottaa", "puhuvat", "uida", "oppia", "uni", 
								"anna", "istu", "seiso",
								"hardList", "ääntää", "valita", "tietää", "rakentaa", "työ", "haistaa", "matka",
								"odottaa", "tuntuu");
			Finnish.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "hyvä", "huono", "aika", "ruma", "iso", "pieni", "onnellinen", "surullinen", 
							  	"kylmää", "kuuma",
								"mediumList", "väsynyt", "pitkä", "lyhyt", "älykäs", "tyhmä", "vihainen", "voimakas", "hiljaa", 
								"nopea", "hidas",
								"hardList", "kirkas", "pimeä", "kirkas", "sekava", "ärsyttävä", "töykeä", "kohtelias", "kallis", 
								"halpa");
			Finnish.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "nolla", "yksi", "kaksi", "kolme", "neljä", "viisi", "kuusi", "seitsemän", 
							 	"kahdeksan", "yhdeksän", "kymmenen",
								"mediumList", "kaksikymmentäyksi", "kolmekymmentä", "neljäkymmentä", "viisikymmentä", 
								"kuusikymmentä", "seitsemänkymmentä", "kahdeksankymmentä", "yhdeksänkymmentä", "sata",
								"hardList", "kaksi sata", "kolme sata", "neljä sata", "viisi sata", "kuuden sata", 
								"Seitsemän sata", "kahdeksan sata", "yhdeksän sata", "yksi tuhat", "kymmenentuhatta",
								"sata tuhat","miljoona");
			Finnish.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "talo", "minua", "osta", "mennä", "puhelin", "kauppa", "auto", "ajaa", "kävellä",
							 	"ajaa", "kierto", "juna","bussi","puhuvat","syö","juoda","hotelli",
								"mediumList", "herra", "rouva", "aamiainen", "lounas", "illallinen", "tie", "matka", "lainata", 
								"taksi", "rahaa", "hei", "veneen","taso","ranta",
								"hardList", "huoneisto", "ruokakauppaan", "lentoliikenteen portti", "juna-asema", "ravintola", 
								"rakennus", "liikenne", "suunta", "osoite", "kahvi", "turisti");
			Finnish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "isä", "äiti", "veli", "sisko", "poika", "tytär",
								"secondList", "setä", "täti", "isoisä", "isoäiti", "serkku", "veljenpoika", "veljentytär");
			Finnish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hei", "hyvää huomenta", "hyvää iltapäivää", "hyvää iltaa", "hyvää yötä", "näkemiin", 
							  	"en ymmärrä", "nimeni on-",
								"secondList", "kuinka paljon on-", "puhut -", "missä on-", "kuinka paljon on-", "anteeksi", 
								"kiitos", "olet tervetullut");
			Finnish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "jalkapallo", "tennis", "koripallo", "jääkiekko", "golf", "kriketti", "baseball",
							 	"rugby", "sulkapallo", "squashia",
								"secondList", "ostokset", "kävely", "uinti", "lukeminen", "ratsastus", "musiikki", 
								"aurinkoa", "rentoutuminen", "auttava");
			Finnish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("minä", "hän", "hän", "he", "meitä", "he", "sinä", "sinun", "se");
			Finnish.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("punainen", "oranssi", "keltainen", "sininen", "violetti", "musta", "valkoinen", "vihreä", 
							  "vaaleanpunainen", "harmaa", "ruskea");
			Finnish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amerikka", "kanada", "englanti", "australia", "ranska", "espanja", "meksiko", "brasilia", 
							  "saksa", "venäjä", "ruotsi", "kiina", "japani","intia","hollanti","egypti","italia","kalkkuna");
			Finnish.countries.setWordsTo(wordSetArray);
			
			
			////////////////////////////////////////TURKISH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "köpek", "kedi", "adam", "kadın", "kız", "çocuk", "araba", "kahve", "plaj", "ev", 
							  	"yiyecek", "içki","bana","çocuk","kuş","kitap","masa","sandalye","telefon","alışveriş","yatak",
							  	"gün","çay","turist",
								"mediumList", "hayvan", "insan", "garson", "efendim", "para", "hanımefendi", "uçak", "tekne", 
								"tren", "Otobüs", "nehir", "kahvaltı","yemek","yemek","yol","tatlı","çöl","banyo","isim",
								"garson","otel","İngilizce",
								"hardList", "asansör", "daire", "bakkal", "taksi", "hava limanı", "tren istasyonu", "restoran", 
								"bina", "trafik", "ispanyolca", "almanca" , "İtalyan", "fransız", "portekizce", "japon", 
								"hollanda", "fin", "türk");
			Turkish.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "yardım etmek", "gitmek", "konus'mak", "görmek", "almak", "Çalıs'mak", "yürü mak", 
							  	"duymak", "okumak", "satın almak", "satmak", "telefon atmak",
							  	"mediumList", "metinmek", "almak", "sürücü", "bekleyin", "konuşmak", "yüz", "öğrenmek", "uyku", 
								"vermek", "oturmak", "stand",
							  	"hardList", "telaffuz", "seçim", "biliyorum", "build", "iş", "koku", "seyahat", "bekleyin", 
								"hissediyorum");
			Turkish.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "iyi", "kötü", "sıcak", "soğuk", "üzücü", "mutlu", "küçük", "büyük", "çirkin", 
							  	"sevimli",
								"mediumList", "yavaş", "hızlı", "sakin", "yüksek sesle", "öfkeli", "aptal", "akıllı", "kısa", 
								"uzun boylu", "yorgun",
								"hardList", "ucuz", "pahalı", "nazik", "kaba", "can sıkıcı", "karışık", "clear", "koyu", "parlak");
			Turkish.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "sıfır", "bir", "iki", "üç", "dört", "beş", "altı", "yedi", "sekiz", "dokuz", "on",
								"mediumList", "doksan", "yüz", "seksen", "yetmiş", "altmış", "elli", "kırk", "yirmi", "otuz",
								"hardList", "iki yüz", "üç yüz", "dört yüz", "beş yüz", "altı yüz", "yedi yüz", "sekiz yüz", 
								"dokuz yüz", "bin", "on bin","yüz bin","bir milyon");
			Turkish.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "ev", "bana", "gitmek", "telefon", "alıs'veriş", "araba", "sürücü", "yürüyüş", 
							  	"çalıştırmak", "döngü", "tren", "satın","otobüs","konuşma","yemek","içki","otel",
								"mediumList", "efendim", "hanımefendi", "kahvaltı", "yemek", "yemek", "yol", "seyahat etmek", 
								"ödünç", "taksi", "para", "merhaba", "tekne","uçak","plaj",
								"hardList", "daire", "bakkal", "hava limanı", "tren istasyonu", "restoran", "bina", "trafik", 
								"yön", "adres", "kahve", "turist");
			Turkish.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "baba", "anne", "kardeş", "kız kardeş", "oğlum", "kızım",
								"secondList", "amca", "teyze", "dede", "büyükanne", "kuzen", "yeğen", "yeğen");
			Turkish.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "merhaba", "günaydın", "iyi günler", "iyi akşamlar", "iyi geceler", "güle güle", 
							  "benim adım-", "anlamıyorum",
								"secondList", "-ne kadar", "konuşma-sen yaparsın", "nerede-", "ne kadar-", "bir şey değil", 
								"teşekkür ederim", "affedersiniz");
			Turkish.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "futbol", "tenis", "basket", "hokey", "golf", "kriket", "beyzbol", "rugby", 
							  "badminton", "kabak",
								"secondList", "alışveriş", "yürüyüş", "yüzme", "okuma", "görme görme", "rahatlatıcı", 
								"güneşlenmek", "müzik", "binicilik");
			Turkish.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"ben", "o", "o", "onlar", "bize", "onlar", "sen", "siz", "o");
			Turkish.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"kırmızı", "turuncu", "sarı", "kahverengi", "gri", "pembe", "yeşil", "beyaz", "siyah", 
							  	"mor", "mavi");
			Turkish.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"Amerika", "kanada", "İngiltere", "avustralya", "fransa", "İspanya", "meksika", "brezilya", 
							  	"almanya", "rusya", "isveç", "Çin", "japonya","hindistan","hollanda","Mısır","İtalya","türkiye");
			Turkish.countries.setWordsTo(wordSetArray);
			
			
			////////////////////////////////////////DUTCH\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			
			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "hond", "kat", "man", "vrouw", "meisje", "jongen", "auto", "koffie", "strand", 
							  	"huis", "levensmiddelenbedrijf", "drinken","mij","kind","vogel","boek","tafel","stoel","telefoon",
							  	"winkelen","bed","dag","thee","toeristische",
								"mediumList", "dier", "persoon", "ober", "meneer", "geld", "mevrouw", "vliegtuig", "boot", 
								"trein", "bus", "rivier", "ontbijt","lunch","diner","weg","dessert","woestijn","badkamer","naam",
								"ober","hotel","engels",
								"hardList", "lift", "appartement", "supermarkt", "taxi", "lucht haven", "station", "restaurant",
								"gebouw", "verkeer", "spaans", "duits", "italiaans", "frans", "portugees", "turks", "finse", 
								"nederlands", "japanse");
			Dutch.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "helpen", "gaan", "praten", "zien", "krijgen", "lopen", "lopen", "horen", "lezen", 
							  	"kopen", "verkopen", "telefoon",
								"mediumList", "tekst", "nemen", "drijven", "wacht", "spreken", "zwemmen", "leren", "slapen", 
								"geven", "zit", "staan",
								"hardList", "zegt u", "kies", "weten", "bouwen", "werk", "geur", "reizen", "wachten", "voelen");
			Dutch.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "goed", "slecht", "vrij", "lelijk", "grote", "klein", "gelukkig", "verdrietig", 
							  	"koud", "heet",
								"mediumList", "moe", "lang", "kort", "slimme", "dom", "boos", "luid", "rustig", "snel", 
								"langzaam",
								"hardList", "helder", "donker", "duidelijk", "verward", "vervelend", "onbeleefd", "beleefd", 
								"duur", "goedkoop");
			Dutch.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "nul", "een", "twee", "drie", "vier", "vijf", "zes", "zeven", "acht", "negen", 
							  	"tien",
								"mediumList", "twintig", "dertig", "veertig", "vijftig", "zestig", "zeventig", "tachtig", 
								"negentig", "honderd",
								"hardList", "twee honderd", "driehonderd", "vier honderd", "vijf honderd", "zeshonderd", 
								"zeven honderd", "acht honderd", "negen honderd", "duizend", "tienduizend","honderdduizend",
								"een miljoen");
			Dutch.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"easyList", "huis", "mij", "kopen", "gaan", "telefoon", "winkelen", "auto", "drive", "lopen", 
							  	"lopen", "cyclus", "trein","bus","spreken","eten","drinken","hotel",
								"mediumList", "meneer", "mevrouw", "ontbijt", "lunch", "diner", "weg", "reizen", "lenen", "taxi", 
								"geld", "hallo", "boot","vliegtuig","strand",
								"hardList", "appartement", "supermarkt", "lucht haven", "station", "restaurant", "gebouw", 
								"verkeer", "richting", "adres", "koffie", "toeristische");
			Dutch.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "father", "mother", "brother", "sister", "son", "daughter",
								"secondList", "uncle", "aunt", "grandfather", "grandmother", "cousin", "nephew", "niece");
			Dutch.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "hallo", "goede morgen", "goede middag", "goede avond", "goede nacht", "tot ziens", 
							  "Ik begrijp het niet", "mijn naam is-",
								"secondList", "hoeveel is-", "Spreekt u-", "waar is-", "hoeveel is-", "neem me niet kwalijk", 
								"dank u", "je bent welkom");
			Dutch.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "voetbal", "tennis", "basketbal", "hockey", "golf", "krekel", "baseball", 
							  	"rugby", "badminton", "squash",
								"secondList", "winkelen", "lopen", "zwemmen", "lezen", "paardrijden", "muziek", "zonnen", 
								"ontspannen", "sightseeing");
			Dutch.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("ik", "hij", "zij", "zij", "ons", "zij", "u", "u", "het");
			Dutch.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("rood", "oranje", "geel", "blauw", "paars", "zwarte", "wit", "groen", "roze", "grijs", "bruin");
			Dutch.colours.setWordsTo(wordSetArray);
			
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("amerika", "Canada", "england", "australië", "Frankrijk", "spanje", "Mexico", "brazilië", "duitsland", 
							  "rusland", "zweden", "china", "japan","indië","holland","egypte","italië","turkey");
			Dutch.countries.setWordsTo(wordSetArray);
			
			
			
			////////////////////////////////////////PORTUGUESE\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
			
			

			//Nouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "cachorro", "gato", "homem", "mulher", "menina", "menino", "carro", "café", "praia", 
							  	"casa", "alimento", "bebida","me","criança","pássaro","livro","mesa","cadeira","telefone","loja",
							  	"cama","dia","chá","turista",
								"mediumList", "animal", "pessoa", "garçom", "senhor", "dinheiro", "senhora", "plano", "barco", 
								"trem", "ônibus", "rio", "café da manhã","lunch","jantar","estrada","doce","deserto","banheiro",
								"nome","garçom","hotel","inglês",
								"hardList", "elevador", "apartamento", "mercearia", "táxi", "porto de ar", "estação de trem", 
								"restaurante", "casa", "traffic", "espanhol", "alemão" , "italiano", "francês", "português", 
								"turco", "finlandês", "holandês", "japonês");
			Portuguese.commonNouns.setWordsTo(wordSetArray);
			
			//Verbs
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "help", "ir", "falar", "ver", "começar", "correr", "andar", "ouvir", "ler", "comprar", 
							  	"vender", "telefone",
								"mediumList", "text", "tome", "unidade", "esperar", "falar", "nadar", "aprender", "dormir", "dar", 
								"sentar", "ficar",
								"hardList", "pronunciar", "escolha", "conhecer", "construir", "trabalho", "cheiro", "viajar", 
								"esperar", "sentir");
			Portuguese.commonVerbs.setWordsTo(wordSetArray);
			
			//Adjectives
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "bom", "ruim", "bonito", "feio", "grande", "pequeno", "feliz", "triste", "frio", 
							  	"quente",
								"mediumList", "cansado", "alto", "curto", "inteligente", "burro", "irritado", "alto", "calma", 
								"rápido", "lento",
								"hardList", "brilhante", "negro", "claro", "confuso", "chato", "descortês", "educado", "caro", 
								"barato");
			Portuguese.commonAdjectives.setWordsTo(wordSetArray);
			
			//Numbers
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "zero", "um", "dois", "três", "quatro", "cinco", "seis", "sete", "oito", "nove", "dez",
								"mediumList", "vinte", "trinta", "quarenta", "cinqüenta", "sessenta", "setenta", "oitenta", 
								"noventa", "cem",
								"hardList", "duzentos", "trezentos", "quatrocentos", "quinhentos", "seiscentos", "setecentos", 
								"oitocentos", "novecentos", "mil", "dez mil","cem mil","um milhão");
			Portuguese.numbers.setWordsTo(wordSetArray);
			
			//Travel
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"EasyList", "casa", "me", "comprar", "ir", "telefone", "compras", "carro", "unidade", "caminhada", 
							  "executar", "ciclo", "trem","ônibus","falar","comer","beber","hotel",
								"mediumList", "senhor", "senhora", "café da manhã", "almoço", "jantar", "estrada", "viajar", 
								"emprestar", "táxi", "dinheiro", "olá", "barco","plano","praia",
								"hardList", "apartamento", "mercearia", "porto de ar", "estação de trem", "restaurante", "casa", 
								"traffic", "direção", "endereço", "café", "turista");
			Portuguese.travel.setWordsTo(wordSetArray);
			
			
			
			//Family
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "pai", "mãe", "irmão", "irmã", "filho", "filha",
								"secondList", "tio", "tia", "avô", "avó", "primo", "sobrinho", "sobrinha");
			Portuguese.family.setWordsTo(wordSetArray);
			
			//Phrases
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "olá", "bom dia", "boa tarde", "boa tarde", "boa noite", "adeus", "eu não entendo", 
							  "meu nome é",
								"secondList", "quanto é", "você fala", "onde está", "quanto é", "com licença", "obrigado", 
								"você é bem-vindo");
			Portuguese.phrases.setWordsTo(wordSetArray);

			//Activities
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push(	"firstList", "futebol", "tênis", "basquete", "hóquei", "golfe", "grilo", "beisebol", "rúgbi", 
							  "badminton", "squash",
								"secondList", "compras", "caminhando", "natação", "leitura", "cavalo", "música", "bronzear", 
								"relaxamento", "passeios");
			Portuguese.activities.setWordsTo(wordSetArray);
			
			
			
			//Pronouns
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("eu", "ele", "ela", "eles", "nós", "eles", "você", "você", "ele");
			Portuguese.pronouns.setWordsTo(wordSetArray);
			
			//Colours
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("vermelho", "laranja", "amarelo", "azul", "roxo", "negro", "branco", "verde", "cor de rosa", 
							  "cinza", "marrom");
			Portuguese.colours.setWordsTo(wordSetArray);
			
			//Countries
			wordSetArray.splice(0, wordSetArray.length);
			wordSetArray.push("américa", "canadá", "inglaterra", "austrália", "frança", "espanha", "méxico", "brasil", 
							  "alemanha", "rússia", "suécia", "china", "japão","Índia","holanda","egito","itália","peru");
			Portuguese.countries.setWordsTo(wordSetArray);
		}

		/*The MEGAWORDTRACEGO method is used entirely by and for the programmer, 
		as it traces every single word held by the languages (in the constructor)*/
		public function MEGAWORDTRACEGO():void
		{
			//For every language
			for (var i:uint = 0; i < allLanguages.length; i++)
			{
				//For every category
				for (var j:uint = 0; j < allLanguages[i].allCategories.length; j++)
				{
					//For every subcategory
					for (var k:uint = 1; k <= allLanguages[i].allCategories[j].size; k++)
					{
						//The size property of a category signifies how many subcategories are within it
						if (allLanguages[i].allCategories[j].size == 1)
						{
							//If size = 1, the category is Small
							trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
								  ", Word List: MAIN, is:     " + allLanguages[i].allCategories[j].everyWord);
						}
						else if (allLanguages[i].allCategories[j].size == 2)
						{
							//If size = 2, the category is Medium
							if (k == 1)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: FIRST, is:     " + allLanguages[i].allCategories[j].firstList);
							}
							else if (k == 2)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: SECOND, is:     " + allLanguages[i].allCategories[j].secondList);
							}
						}
						else if (allLanguages[i].allCategories[j].size == 3)
						{
							//If size = 3, the category is Large
							if (k == 1)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: EASY, is:     " + allLanguages[i].allCategories[j].easyList);
							}
							else if (k == 2)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: MEDIUM, is:     " + allLanguages[i].allCategories[j].mediumList);
							}
							else if (k == 3)
							{
								trace("Language: " + allLanguages[i].name + ", Category: " + allLanguages[i].allCategories[j].name + 
									  ", Word List: HARD, is:     " + allLanguages[i].allCategories[j].hardList);
							}
						}
					}
				}
			}
		}
		
		/*The englishWordReturn method will return an array holding every english word in the database
		This is used when the list of words is displayed in the main program's translation screen*/
		public function englishWordReturn():Array
		{
			//Instantiates a new array which will hold all of the values being returned by the method
			var returnList:Array = new Array();
			
			//Traverses through every category of the english language
			for (var j:uint = 0; j < English.allCategories.length; j++)
			{
				//In each category, traverses the list of words containing all of the words in the category 
				for (var l:uint = 0; l < English.allCategories[j].everyWord.length; l++)
				{
					//Adds each word to the returnList
					returnList.push(English.allCategories[j].everyWord[l]);						
				}
			}
			
			//Returns the compiled list of words
			return(returnList);
		}
		
		//The setLanguage method sets the input and output languages based on two parameters
		public function setLanguage(inLang:Language, outLang:Language):void
		{
			inputLanguage = inLang;
			outputLanguage = outLang;
		}
		
		//The getLangByName method will return a Language variable based on a String parameter
		public function getLangByName(aName:String):Language
		{
			//The inputText parameter is set to lower case to allow for any format discrepancies 
			aName = aName.toLowerCase();
			
			//By default, the language being returned has a null value, as nothing has yet been found
			var returnLang:Language = null;
			
			//The method searches through every available language serially for the matching one
			for (var i:uint = 0; i < allLanguages.length; i++)
			{
				if (allLanguages[i].name.toLowerCase() == aName)
				{
					returnLang = allLanguages[i];
				}
			}
			
			//Returnsthe compiled list
			return(returnLang);
		}
	}
}