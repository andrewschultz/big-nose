"Big Nose on the Big Pyramid" by Andrew Schultz

The Pyramid is a room.

Pyramid is southwest of Pyramid.
Pyramid is northwest of Pyramid.

swcount is a number that varies. swcount is usually 0.
secount is a number that varies. secount is usually 0.

disc3u is a truth state that varies. disc3u is usually true.
disc5u is a truth state that varies. disc5u is usually true.
disc7u is a truth state that varies. disc7u is usually true.

SQ is a list of texts that varies. SQ is { "b", "y", "p" }.

L is a list of numbers that varies.

cur-level is a number that varies. cur-level is 1.

[to decide which number is first-color of (l - a number):
	if l is 1 or l is 3 or l is 5, decide on 1;
	decide on 2;]

to reset-level:
	let FC be 3 - remainder after dividing cur-level by 2; [first-color hack]
	repeat with x running from 0 to 48:
		let xx be x / 7;
		let xxx be the remainder after dividing x by 7;
		if xx >= xxx:
			add FC to L;
		otherwise:
			add 0 to L;
	now swcount is 0;
	now secount is 0;
	now the turn count is 0;

when play begins:
	now SQ is { "b", "y", "p" };
	reset-level;
	move player to Pyramid, without printing a room description;

the description of the Pyramid is "[one of]Oh dear. The squares on this 7-high triangle of a pyramid are all yellow. And you need to make them pink. They tend to start blue, then go yellow, then pink, then blue again. So you can't just run out and touch every one twice. You long for that wistful time fifteen minutes ago when they flipped between two colors, or even just stayed one color after a jump or two.[paragraph break]You suspect someone has a reason why the board seems halfway done. If you want to foil them, you can try BLINKing--but only before you move.[or]You decide to quit whining to yourself about how easy things were and consider the board abstractly. Maybe it'll help you clear things up. Oh, man, it could be worse when Coily drops down to chase you, and Sam and Slick mess up your work. You really hope the person who threw you in this puzzle didn't have time to implement them.[paragraph break]On the board below, your square is in CAPS, and the discs are up and right of the right side.[paragraph break][the-board][or][the-board][stopping]"

the board is backdrop. The board is everywhere.

instead of examining the board:
	try looking instead;

instead of examining the scenery:
	try looking instead;

the description of the player is "You're an orange ball with a big nose and two orange legs made for hopping."

going north is baddirring.
going south is baddirring.
going east is baddirring.
going west is baddirring.
going up is baddirring.
going down is baddirring.

going inside is baddiring.
going outside is baddiring.

xyzzying is an action out of world.

carry out xyzzying:
	say "Your head hurts momentarily as you think of your poor cousin who was sent out to rotate cubes into a certain position across three different axes. You don't know how he manages to do it. That three-dimensional stuff is insane. [italic type](Note: if you hated this speed-if, you will certainly be glad to know I'm not writing a sequel based on Q*Bert's Qubes.)[roman type]"

understand the command "xyzzy" as something new. understand "xyzzy" as xyzzying.

hinting is an action out of world.

hintcounter is a number that varies. hintcounter is usually 0.

carry out hinting:
	increment hintcounter;
	say "[one of]Chip away at the corners first so you don't have to worry about them.[or]Try getting close without using any discs. What happens?[or]You can also use the bottom right disc strategically. The corners are hard to fill in.[or]This is actually a parity problem of sorts, like the checkerboard where you pull out opposite corners.[or]If you hop on a disc, the parity changes--there are three configurations. The first doesn't work, and the discs shuffle you to the next one. They wouldn't, if you jumped from even rows.[or]You can ask for a SOLUTION if you want. The easiest way is to use one disc.[or]Just keep chipping at the corners. You can probably get the bottom-left 6-high triangle done, then just bounce around.[or][nohint]Just keep chipping at the corners. You can probably get the bottom-left 6-high triangle done, then just bounce around.[stopping]";

to say nohint:
	decrement hintcounter;
	say "That's all the hints I have. [no line break]";

chapter logic

logicing is an action out of world.

carry out logicing:
	say "If you've ever heard of the mutilated checkerboard problem http://en.wikipedia.org/wiki/Mutilated_chessboard_problem then the same sort of logic applies here. Consider the following board:[paragraph break]
	[fixed letter spacing]
      +
     - -
    + + +
   - - - -
  + + + + +
 - - - - - -
+ + + + + + +[variable letter spacing][paragraph break]If you let blue=1, yellow=2 and pink=3, then an all blue board starts out with a value of 4 (add +'s, subtract -'s.) You'll jump on a square in an even row (minus) to give a value of 3. No matter what, the values will bounce between 0 and -1 (2) mod 3. So you can solve the board without discs, since the board's value when solved is 8.[paragraph break]But if everything is yellow, values will start at 4 and go to 3, or 0 and 1 mod 3--they'll never hit 2. The only way is to jump on a disc from an odd (+) row.[paragraph break]* - note: I had this written up somewhere else so I just cut and pasted. So I didn't count writing this as programming time."

understand the command "logic" as something new. understand "logic" as logicing.

chapter inventory

instead of taking inventory:
	say "You don't have any arms. Ergo, no inventory."

chapter parser error

rule for printing a parser error:
	say "You can go UL, DL, DR, UR -- NW, SW, SE, NE -- or, if you want to use one keystroke, the numpad 7 1 3 9 or the keys r c b y u=will do the trick. This is much less awkward than having to hold your keyboard at an angle to play the graphic version on an emulator. You can also ask for HELP or a HINT.";
	reject the player's command;

understand the command "help" as something new. understand "help" as hinting.
understand the command "hint" as something new. understand "hint" as hinting.

understand the command "ul" as something new. understand "ul" as northwest.
understand the command "ur" as something new. understand "ur" as northeast.
understand the command "dl" as something new. understand "dl" as southwest.
understand the command "dr" as something new. understand "dr" as southeast.

understand the command "7" as something new. understand "7" as northwest.
understand the command "9" as something new. understand "9" as northeast.
understand the command "1" as something new. understand "1" as southwest.
understand the command "3" as something new. understand "3" as southeast.

understand the command "r" as something new. understand "r" as northwest.
understand the command "y" as something new. understand "y" as northeast.
understand the command "c" as something new. understand "c" as southwest.
understand the command "b" as something new. understand "b" as southeast.

to say the-board:
	let Y be (secount * 8) + (swcount * 7) + 1;
	say "[fixed letter spacing]";
	repeat with j running from 1 to 7:
		repeat with x running from j to 7:
			say " ";
		repeat with x running from 1 to 7:
			if x <= j:
				let Z be x + (7 * (j - 1));
				let ZZ be entry Z of L;
				if Z is Y:
					say "[entry ZZ of SQ in upper case] [no line break]";
				otherwise:
					say "[entry ZZ of SQ] [no line break]";
		if j is 2 and disc3u is true:
			say "*";
		if j is 4 and disc5u is true:
			say " *";
		if j is 6 and disc7u is true:
			say " *";
		say "[line break]";
	say "[variable letter spacing]"

to say swears:
	say "You offer an emphatic '!@#$%^&*' just before landing.[line break]";

check going northwest:
	if secount is 0:
		say "You'd jump off the pyramid if you went further that way. Still want to?";
		if the player consents:
			say "[swears]";
			end the story instead;
		otherwise:
			the rule succeeds;
	if turn count < 5:
		say "You land with a splatch.";
	if turn count is 5:
		say "All this splatching, and none of your enemies have appeared yet. This could be your lucky day!";
	if turn count is 10:
		say "Looks like you can concentrate on clearing this pyramid up all by yourself.";
	decrement secount;

to board-count:
	let temp be 0;
	repeat with LL running from 1 to 49:
		if (LL - 1) / 7 is even:
			increase temp by 2 *(entry LL in L);
			[if entry LL in L > 0:
				say "!Square [LL] is [2 * (entry LL in L)].";]
		otherwise:
			increase temp by (entry LL in L);
			[if entry LL in L > 0:
				say "Square [LL] is [(entry LL in L)].";]
	[say "[temp]";]
	if the remainder after dividing temp by 3 is 1:
		if disc3u is false and disc5u is false and disc7u is false:
			say "You might want to undo after this. Just sayin['].";
		otherwise:
			say "You feel slightly uneasy. Like you want to, or may have to, jump off again.";

to relocate-qbert:
	say "Lights start swirling as the disc takes you to the top of the pyramid and deposits you at the top.";
	now secount is 0;
	now swcount is 0;
	hop-on 1;
	try looking;
	board-count;
	the rule succeeds;

check going northeast:
	if swcount is 0:
		if secount is 2 and disc3u is true:
			now disc3u is false;
			relocate-qbert instead;
		if secount is 4 and disc5u is true:
			now disc5u is false;
			relocate-qbert instead;
		if secount is 6 and disc7u is true:
			now disc7u is false;
			relocate-qbert instead;
		say "You'd jump off the pyramid if you went further that way. Still want to?";
		if the player consents:
			say "[swears]";
			end the story instead;
		otherwise:
			the rule succeeds;
	say "You land with a splatch.";
	decrement swcount;

check going southeast:
	if swcount + secount is 6:
		say "You'd jump off the pyramid if you went further that way. Still want to?";
		if the player consents:
			say "[swears]";
			end the story instead;
		otherwise:
			the rule succeeds;
	say "You land with a splatch.";
	increment secount;

check going southwest:
	if swcount + secount is 6:
		say "You'd jump off the pyramid if you went further that way. Still want to?";
		if the player consents:
			say "[swears]";
			end the story instead;
		otherwise:
			the rule succeeds;
	say "You land with a splatch.";
	increment swcount;

carry out requesting the score:
	let temp be 0;
	repeat with q running through L:
		if q is 3, increment temp;
	say "You have turned [temp] tile[s] the right color in [turn count] turns.[one of][line break]Maybe if predators were chasing you around the pyramid, you'd deserve a score in the thousands. But they aren't.[or][stopping]";
	the rule succeeds;

min-moves is a list of numbers variable. min-moves is { 31, 62, 0, 0, 43, 74 }.

rule for printing the player's obituary:
	if 2 is listed in L or 1 is listed in L:
		say "Ah, well. It's only a stupid bunch of squares, anyway. You'd probably just have to clean it again if you got it all monochrome.";
		the rule succeeds;
	let auth-num be entry cur-level in min-moves;
	if turn count is auth-num:
		say "Good job! You did as well as the author.";
	else if turn count < auth-num:
		say "You beat the author! Wow!";
	else:
		say "The author got [auth-num] turns. Can you match/beat that?";

to hop-on (n - a number):
	increment entry n in L;
	if entry n in L is 4:
		if cur-level > 4:
			now entry n of L is 1;
		else if cur-level > 2:
			now entry n of L is 2;
		else:
			now entry n of L is 3;

carry out going:
	let temp be (secount * 8) + (swcount * 7) + 1;
	[say "Flipped [temp].";]
	hop-on temp;
	repeat with L1 running through L:
		if L1 is 1 or L1 is 2, the rule succeeds;
	if cur-level < 6:
		increment cur-level;
		reset-level instead;
	say "A cacophony of music and flashing lights greets your accomplishment! Your reward is to do it all over again with slightly different colored squared. Geez, why can't you at least get a skit like the idiot who just chews dots and doesn't have to worry about where he's been?";
	end the story;

[report going:
	repeat with i running from 1 to 7:
		repeat with j running from 1 to 7:
			let temp be (7 * i) + j - 7;
			say "[entry temp of L] [no line break]";
		say "[line break]";]

instead of baddirring:
	say "You've never been one for the traditional directions. You'd rather hop off at an angle."

volume testing - not for release

Include (- Switches z; -) after "ICL Commands" in "Output.i6t".

chapter lving

lving is an action applying to one number.

understand the command "lv" as something new.

understand "lv [number]" as lving.

carry out lving:
	if the number understood > 6 or the number understood < 1, say "Need 1-6." instead;
	now cur-level is the number understood;
	reset-level;
	the rule succeeds.

