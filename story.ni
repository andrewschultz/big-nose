"Big Nose on the Big Pyramid" by Andrew Schultz

the story headline is "A diagonal affair"

the story description is "Okay, it's really just Q*Bert: the Text Adventure"

include Old School Verb Total Carnage by Andrew Schultz.

include Trivial Niceties by Andrew Schultz.

the release number is 1.

release along with cover art.

release along with the "Parchment" interpreter.

volume the whole game

To process (RL - a rule): (- ProcessRulebook({RL}, 0, true); -)

chapter verbs I'll ignore

understand "jump" as jumping.

instead of jumping: say "But which way? You can choose any of the diagonal directions."

chapter variables

swcount is a number that varies. swcount is usually 0.
secount is a number that varies. secount is usually 0.

disc3u is a truth state that varies. disc3u is usually true.
disc5u is a truth state that varies. disc5u is usually true.
disc7u is a truth state that varies. disc7u is usually true.

SQ is a list of texts that varies. SQ is { "b", "y", "g" }.

L is a list of numbers that varies.

cur-level is a number that varies. cur-level is 1.

move-list is a list of numbers variable.

move-count is a number that varies.

a direction has a number called key-stroke.

key-stroke of northwest is 7.
key-stroke of northeast is 9.
key-stroke of southwest is 1.
key-stroke of southeast is 3.

chapter the room

The Pyramid is a room.

Pyramid is southwest of Pyramid.
Pyramid is northwest of Pyramid.

[to decide which number is first-color of (l - a number):
	if l is 1 or l is 3 or l is 5, decide on 1;
	decide on 2;]

to decide which number is start-color of (n - a number):
	if n is 2 or n is 4, decide on 1;
	decide on 2;

to reset-level:
	now move-list is {};
	now disc3u is whether or not cur-level < 6;
	now disc5u is whether or not cur-level < 6;
	now disc7u is whether or not cur-level < 6;
	now level-6-death is false;
	let FC be start-color of cur-level; [first-color hack]
	now L is {};
	repeat with x running from 0 to 48:
		let xx be x / 7;
		let xxx be the remainder after dividing x by 7;
		if xx >= xxx:
			add FC to L;
		otherwise:
			add 0 to L;
	now swcount is 0;
	now secount is 0;
	now move-count is 0;
	choose row cur-level in table of level critical moments;
	if started-yet entry is false:
		say "[start-text entry]";
	else:
		say "[restart-text entry]";
	now started-yet entry is true;
	say "[line break]";
	wfak;

to decide which number is xc of (j - a number):
	let count be 0;
	repeat with x running from 1 to 49:
		if entry x in L is j, increment count;
	decide on count;

level-order is a list of text variable. level-order is { "A->B", "A->B->C", "A<->B", "A->B<->C", "A->B->C->A", "A->B->C->A" }.

to say randswear: say "[grawlyx-random of 6]";

to say grawlyx-random of (n - a number):
	repeat with n2 running from 1 to n:
		let nr be a random number between 1 and the number of entries in grawlyxes;
		say "[entry nr of grawlyxes]";

grawlyxes is a list of text variable. grawlyxes is { "![no line break]", "@", "#", "$", "%", "^", "&", "*", "?[no line break]" }

when play begins:
	now left hand status line is "[cur-level] [entry cur-level in level-order]";
	now right hand status line is "[if cur-level is not 1 and cur-level is not 3][xc of 1]/[end if][xc of 2]/[xc of 3] [move-count]";
	reset-level;
	move player to Pyramid, without printing a room description;

the description of the Pyramid is "[one of]Oh dear. The squares on this 7-high triangle of a pyramid all need to go green. They've all started yellow, so it won't be too hard to step on them all. It probably gets harder later, though.[paragraph break][the-board][or]You decide to quit whining to yourself about how easy things were and consider the board abstractly. Maybe it'll help you clear things up. Oh, man, it could be worse when Coily drops down to chase you, and Sam and Slick mess up your work. You really hope the person who threw you in this puzzle didn't have time to implement them.[paragraph break]On the board below, your square is in CAPS, and the discs are up and right of the right side.[paragraph break][the-board][or][the-board][stopping]"

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

carry out hinting:
	if cur-level < 3:
		say "[lh]There's no real way to mess things up here without falling off the pyramid. Chipping away at the corners first may make things go faster. This is general advice.";
		the rule succeeds;
	if cur-level is 3:
		say "[one of]You may wish to step on the corners first. There will be something you have to come back to get later.[or][lh]If you have two yellow squares on opposite ends of the board, you can walk to one then the other--you don't have to fill in squares as you go. That's a bit inefficient.[stopping]";
		the rule succeeds;
	if cur-level is 4:
		say "[one of]If you step on all the squares once, you are back where you were at level 3.[or][lh]Once you've stepped on all the squares, you may wish to chip away at the corners, then maybe the corner 3-size triangles (e.g. NE of the one corner then SE) and so forth.[stopping]";
	if cur-level is 5:
		say "[one of]The discs may be useful here to clear out not only a corner square but the top square.[or]You can use the same strategy as before, but you will eventually have to go back and fill in a stray pyramid square you didn't step on.[or]Don't try to fill in squares in the center first. A good policy is to dance from one square trapped sort of in the corner to another one and maybe even fill in the northwest and northeast edges before working inwards. Spoiler ahead.[or][lh]If you hop on a disc, the board's parity changes between three configurations--the one you are on to start is unsolvable without a disc. Also, if you jump on all three discs, it's unsolvable again. But in this case you can fall to your doom and retry.[stopping]";
	say "[one of]The same strategies apply here as in previous levels, except not having disks causes trouble. There is something you have to do to win that you couldn't on previous levels.[or]You may wonder if you can win without using discs. Well, yes and no. Check the walkthrough for details.[or]You can try falling off the edge--in some cases, that helps.[or]Off some squares, falling doesn't help. Think about it, if you want, before a spoiler ahead.[or]You need to jump off the pyramid when on row 2, 4 or 6. That is because you jump from an odd row to an even row and back and forth. But if you die after touching an even row, you touch row 2 next: two even rows in a row. That greases the wheels to solve things as you might have done in level 5, after using a disc. If you already fell off the pyramid, the game will let you do so again and retry from scratch.[stopping]";

to say lh: say "(last hint for this level) ";

chapter notify if so close yet so far

to decide whether so-close-yet-so-far:
	if cur-level < 5, decide no;
	let unfinished-found be false;
	let count be -1;
	let times-to-change be 0;
	let row-to-tweak be 0;
	let square-to-tweak be 0;
	let unchanged-square be 0;
	repeat with myen running through L:
		increment count;
		if myen is 0, next;
		if myen is 3, next;
		if unfinished-found is true, decide no;
		now unchanged-square is myen;
		now square-to-tweak is count;
		now unfinished-found is true;
	let row-to-tweak be square-to-tweak / 7;
	let row-delta be (swcount + secount) - row-to-tweak;
	if row-delta < 0, now row-delta is 0 - row-delta;
	let parity be the remainder after dividing row-delta by 2;
	if (the remainder after dividing row-delta by 2) + unchanged-square is 2, yes;
	no;

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

understand the command "lu" as something new. understand "lu" as northwest.
understand the command "ru" as something new. understand "ru" as northeast.
understand the command "ld" as something new. understand "ld" as southwest.
understand the command "rd" as something new. understand "rd" as southeast.

understand the command "wn" as something new. understand "wn" as northwest.
understand the command "en" as something new. understand "en" as northeast.
understand the command "ws" as something new. understand "ws" as southwest.
understand the command "es" as something new. understand "es" as southeast.

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
			say "*";
		if j is 6 and disc7u is true:
			say "*";
		if j < 7, say "[line break]";
	say "[variable letter spacing]"

to say swears:
	say "You offer an emphatic [randswear] just before landing.[line break]";

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
	if cur-level > 5:
		if the remainder after dividing temp by 3 is 1:
			if disc3u is false and disc5u is false and disc7u is false:
				say "You might want to undo after this. Just sayin['].";
			otherwise:
				say "You feel slightly uneasy. Like you want to, or may have to, jump off again.";

to relocate-qbert:
	increment move-count;
	say "Lights start swirling as the disc takes you to the top of the pyramid and deposits you at the top.";
	now secount is 0;
	now swcount is 0;
	hop-on 1;
	try looking;
	board-count;
	the rule succeeds;

chapter basic jump rules

check going northwest:
	abide by the edge-jump-check rule;
	process the splatchy rule;
	decrement secount;

check going northeast:
	abide by the to-top rule;
	abide by the edge-jump-check rule;
	process the splatchy rule;
	decrement swcount;

check going southeast:
	abide by the edge-jump-check rule;
	process the splatchy rule;
	increment secount;

check going southwest:
	abide by the edge-jump-check rule;
	process the splatchy rule;
	increment swcount;

this is the to-top rule:
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

this is the splatchy rule:
	if move-count < 5, say "You land with a splatch.";
	if move-count is 5, say "All this noisy splatching, and none of your enemies have appeared yet. This could be your lucky day!";
	if move-count is 10, say "Looks like you can concentrate on clearing this pyramid up all by yourself.";

section off the edge checks

this is the edge-jump-check rule:
	let warn-player be false;
	if noun is northwest:
		now warn-player is whether or not secount is 0;
	else if noun is northeast:
		now warn-player is whether or not swcount is 0;
	else:
		now warn-player is whether or not swcount + secount is 6;
	if warn-player is true:
		say "[randswear], there's no square to the [noun], and it's a long way down. Still want to?";
		if the player dir-consents:
			say "[randswear]";
			if level-6-death is false:
				if cur-level is 6:
					say "[paragraph break]But wait! You don't get off so easily. Someone's there to ... help you get better. Give you one more chance. In fact, it's an offer you can't refuse!";
					now swcount is 0;
					now secount is 0;
					now level-6-death is true;
					try looking;
					the rule succeeds;
			if cur-level is 5 and disc3u is false and disc5u is false and disc7u is false:
				say "'Kid, you tried your best, and you worked real hard, but things didn't quite click. But for your effort, we'll give you another shot. What do you say?' They don't actually wait for what you say. You're pushed back out on the pyramid.";
				reset-level;
				the rule succeeds;
			end the story instead;
		otherwise:
			the rule succeeds;
	increment move-count;

chapter waiting

check waiting: say "You have all the time in the world and nothing else to do. Why not wait a bit and plan ahead?" instead;

chapter score

carry out requesting the score:
	say "You have turned [xc of 3] tile[unless xc of 3 is 1]s[end if] the right color [if cur-level is not 1 and cur-level is not 3]and [xc of 2] half-right [end if]in [move-count] jumps.[one of][line break]Maybe if predators were chasing you around the pyramid, you'd deserve a score in the thousands. But they aren't.[or][stopping]";
	the rule succeeds;

min-moves is a list of numbers variable. min-moves is { 32, 60, 36, 62, 42, 64 }.

level-6-death is a truth state that varies.

rule for printing the player's obituary:
	if 2 is listed in L or 1 is listed in L:
		if cur-level is 6:
			say "'So close, kid! And we even gave you a second chance! You just didn't make the most of it.'[paragraph break]There actually is a way to get through, though.";
		else:
			block-retry;
			say "Ah, well. It's only a stupid bunch of squares, anyway. You'd probably just have to clean it again if you got it all monochrome. Thank goodness for the benefits from the Arcade Game Protagonists['] Union. The medical plan is pretty good, and really, you could use a break from the drudgery. It's just too bad that, without any hands, you can't play foozball with the others who are recuperating.";
		the rule succeeds;

to evaluate-player:
	let auth-num be entry cur-level in min-moves;
	if move-count is auth-num:
		say "Good job! You did as well as the author.";
	else if move-count < auth-num:
		say "You beat the author! Wow! I'd like to know this. Please email me at blurglecruncheon@gmail.com with this sequence: [move-list] for level [cur-level].";
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

my-moves is a number that varies.

carry out going:
	let temp be (secount * 8) + (swcount * 7) + 1;
	[say "Flipped [temp].";]
	hop-on temp;
	increment my-moves;
	add key-stroke of noun to move-list;
	if debug-state is true, say "[my-moves] moves, [move-list].";
	if so-close-yet-so-far:
		say "So frustrating! You know you're as close as can be, and yet ... you can't see how to finish the deal, just hopping around the pyramid.";
	repeat with L1 running through L:
		if L1 is 1 or L1 is 2, the rule succeeds;
	say "Lights swirl! You hear a little tune! There's flashing, then ... [if cur-level is 6]no new board this time[else]a new board[end if].";
	if cur-level < 6:
		evaluate-player;
		increment cur-level;
		reset-level instead;
	say "A cacophony of music and flashing lights greets your accomplishment! Your reward is to do it all over again with slightly different colored squared. Oh, and a sense of accomplishment for solving an interesting abstract puzzle, for what that's worth.[paragraph break]Geez! Why can't you even get a part in a cute skit, like the idiot who just chews dots and doesn't have to worry about where he's been, or whether those dots will pop back up?";
	block-retry;
	end the story;

to block-retry:
	choose row with final response rule of epilogue rule in table of final question options;
	blank out the whole row;

table of level critical moments
started-yet	start-text	restart-text
false	"'Okay, turn those yellow squares green already! There's really no excuse! There's no Sam, Slick or Coily to distract you!' There's no why. Just, you have to do it. It could be worse. You could be assigned to shoot stuff. You hate shooting stuff. But still, you mouth a quick [randswear] under your breath."	"'Really! If you mess this up, they'll only get tougher. We might've given you a break if you hadn't messed up so early, but really, this is a bit clumsy.' [randswear]. "
false	"'This one's gonna be a bit trickier. You'll have to jump on each square twice to turn it from blue to green. It seemed like you were about to start cussing when you had to backtrack over squares you already changed, kid, but I tell you what. There's a lot more backtracking to do. And I don't like your attitude, kid, or that mouth of yours, but you're the only whatever-it-is to complete the job here.'"	"'Boy oh boy. If you butchered THIS... well, I'm too classy to say what I really think. We just can't rely on you for the tough stuff, though, that's obvious.'"
false	"'Hooray for perseverance! Though, no offense, you didn't have to do anything too brilliant, especially since nobody was chasing you. Now this one is a bit tricky. Yellow to green, but if you step on green, it won't STAY green. Are you up to it?' It doesn't matter if you are. You're pushed out there on the pyramid, again."	"'Kid, we're sorry. We thought you had IT. We believed in you. You had the potential. But you couldn't just brute-force things, and that made you give up, and that makes us sad. It's an early retirement for you.'"
false	"'Not bad. Some people, or whatever you are, just give up when tiles start changing back from the color they're supposed to be. But not you! You got potential, kid. Hey, next up: blue to yellow to green to yellow to green. But it's not super-tough. Yet. You'll see what we mean.'"	"'The combo of three colors and switching back was a bit too much for you, eh?"
false	"'Impressive indeed. Now for the big one, sort of: Tiles change back from green all the way to blue if you step on them. Not easy, but we believe in you.'"	"Well, you did enough, we guess. Enjoy your retirement, kid, but spare a thought for what might have been. You could've been one of the great ones.'"
false	"'Last one, okay? It can't be that much harder than what you've done, unless we're missing something. Oh, hey, we had some budget cuts, so we can't afford those discs where you jump back to the top again. But you won't need them. Oh, also, everything's going to start on blue, so that make it easier to get through. Right? Right? Oh, also, you'll have to stay until you complete the job. No sneaking out.'[paragraph break]You long for that wistful time fifteen minutes ago when they flipped between two colors, or even just stayed one color after a jump or two."	"'Ah. Back for more. Here's hoping this time you get it straight.'"


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
	if the number understood > 6 or the number understood < 0, say "Need 1-6, or 0 to reset current level." instead;
	if the number understood is cur-level, say "You're already on level [number understood]. Type lv 0 to reset." instead;
	if number understood is not 0:
		say "Moving to level [number understood].";
		now cur-level is the number understood;
	else:
		say "Resetting current level.";
	reset-level;
	the rule succeeds.

volume extra option

Table of Final Question Options (continued)
final question wording	only if victorious	topic		final response rule		final response activity
"[b]RETRY[r] the final level"	false	"retry"	epilogue rule	--

escape mode is a truth state that varies.

This is the epilogue rule:
	resume the story;
	now escape mode is true;
	now swcount is 0;
	now secount is 0;
	say "Well, why not try again?";
	reset-level;

Include (-

[ ASK_FINAL_QUESTION_R;
	print "^";
	(+ escape mode +) = false;
	while ((+ escape mode +) == false) {
		CarryOutActivity(DEALING_WITH_FINAL_QUESTION_ACT);
		DivideParagraphPoint();
	}
];

-) instead of "Ask The Final Question Rule" in "OrderOfPlay.i6t".

volume tests - not for release

test l1 with "lc 1/3/3/3/3/3/3/9/1/3/3/3/3/3/7/1/7/7/7/7/1/3/3/3/7/1/7/7/1/3/7/1".

test l2 with "lc 2/3/3/9/3/3/3/3/9/1/3/3/3/3/3/9/3/7/3/7/1/7/9/7/1/7/7/7/1/1/9/1/1/1/1/9/1/9/3/9/1/9/3/9/1/9/3/9/1/9/3/7/3/7/7/7/3/7/1/7/3/7/1".

test l3 with "lc 3/3/3/3/3/3/3/9/1/3/3/3/3/3/7/1/7/9/3/7/1/1/9/7/7/7/1/3/3/1/7/7/1/3/7/1/9".

test l4 with "lc 4/3/3/3/3/3/3/7/3/9/3/3/3/3/9/1/3/7/3/3/3/7/3/3/3/7/3/7/1/9/1/7/1/7/9/3/1/7/9/7/7/1/3/9/7/1/3/1/1/7/1/9/1/9/9/1/9/3/3/7/1/9/3".

test l5 with "lc 5/3/1/3/9/3/1/3/9/3/3/9/1/1/3/3/3/3/9/3/7/1/9/1/7/3/7/7/3/7/1/3/7/9/1/1/9/7/7/1/3/1/7/1".

test l5x with "lc 5/1/1/1/1/1/1/9/3/7/3/7/3/9/9/9/9/9/7/3/3/3/3/3/3/7/1/7/7/7/7/9/1/9/1/1/1/1/1/9/9/9/1/1/3/9/3/9/3/9/9/3/7/3/7/1/7/3/7/7/3/7/1/9".

test l6 with "lc 6/au 2/1/1/1/1/1/1/9/3/7/3/7/7/3/7/3/3/3/3/3/3/7/1/9/1/9/1/7/3/7/7/7/7/9/1/9/1/3/3/3/1/9/7/7/3/7/1/3/1/7/1/7/1/9/9/9/9/1/1/1/1/9/9/9/1/9".

chapter lcing

lcing is an action applying to one number.

understand the command "lc" as something new.

understand "lc [number]" as lcing.

carry out lcing:
	if number understood is cur-level, say "We're already at level [number understood]." instead;
	if number understood < 1 or number understood > 6, say "Only 1-6 please." instead;
	now cur-level is number understood;
	reset-level;
	the rule succeeds;
