# Copyright (C) 2013 Igor Afanasyev, https://github.com/iafan/Hacksby

package Furby::Command;

use Furby::Command::Dictionary;

# Commands marked with "!" are available in the official iOS Furby app (i.e. they are supposed to work one way or another)
# First part of description is enum name found in C# code within official Android Furby Boom app
# The potential range for commands is [0..1023]. Some of the command codes missing from this list are just used as
# Furby responses (see Furby::Command::Dictionary)

# When the command is understood (e.g. the food was accepted), Furby will respond with his current personality type [900..905].

my $description = {
    #...
    '350' => 'Like_Crunch:', #! food, tasty ("mmm, yum")
    '351' => 'Egg_Transfer:',
    '352' => 'Like_Chomp: Any small eatable tasty stuff (like peanut)', #!
    '353' => 'Like_Nibbles: Any bigger soft eatable tasty stuff (like banana)', #!
    '354' => 'Like_Slurp: Any suckable tasty stuff (like oysters, sphagetti)', #!
    '355' => 'Like_Glug: Any drinkable(?) tasty stuff', #!
    '356' => 'Dislike_Crunch: Dislike_Crunch: Any hard eatable but not tasty stuff (like chicken bone)', #! 
    #...
    '358' => 'Dislike_Chomp: Any small not tasty stuff (like pepperoni)', #!
    '359' => 'Dislike_Nibbles: Any bigger soft not tasty stuff (like asparagus)', #!
    '360' => 'Dislike_Slurp: Any suckable not tasty stuff ', #!
    '361' => 'Dislike_Glug:', #!
    #...
    '364' => 'Furball_Celebrate:',
    '365' => 'Egg_Sitting:',
    '366' => 'Egg_Helped:',
    #...
    '368' => 'Sweet_Crunch:', #!
    #...
    '370' => 'Sweet_Chomp:', #!
    '371' => 'Sweet_Nibbles:', #!
    '372' => 'Sweet_Slurp: Any suckable tasty stuff (like beans)', #! "ooh!"
    '373' => 'Sweet_Glug:', #!
    '374' => 'Sour_Crunch:', #!
    #...
    '376' => 'Sour_Chomp:', #!
    '377' => 'Sour_Nibbles:', #!
    '378' => 'Sour_Slurp:', #!
    '379' => 'Sour_Glug:', #!
    '380' => 'Hot_Crunch:', #!
    #...
    '382' => 'Hot_Chomp:', #!
    '383' => 'Hot_Nibbles:', #!
    '384' => 'Hot_Slurp:', #!
    '385' => 'Hot_Glug:', #!
    '386' => 'Cold_Crunch:', #!
    #...
    '388' => 'Cold_Chomp:', #!
    '389' => 'Cold_Nibbles:', #!
    '390' => 'Cold_Slurp:', #!
    '391' => 'Cold_Glug:', #!
    '392' => 'Spicy_Crunch:', #!
    #...
    '394' => 'Spicy_Chomp:', #!
    '395' => 'Spicy_Nibbles:', #!
    '396' => 'Spicy_Slurp:', #!
    '397' => 'Spicy_Glug:', #!
    '398' => 'Refreshing_Crunch:', #!
    #...
    '400' => 'Refreshing_Chomp:', #!
    '401' => 'Refreshing_Nibbles:', #!
    '402' => 'Refreshing_Slurp:', #!
    '403' => 'Refreshing_Glug:', #!
    #...
    '410' => 'Caffeinated_Crunch:', #! something hot?
    #...
    '412' => 'Caffeinated_Chomp:', #! something hot?
    '413' => 'Caffeinated_Nibbles:', #! something hot?
    '414' => 'Caffeinated_Slurp:', #!
    '415' => 'Caffeinated_Glug:', #!
    '416' => 'SpittingOut_Crunch:', #!
    '417' => 'SpittingOut_Chomp: Any non-eatable stuff (toilet paper, pillow, etc)', #!
    '418' => 'SpittingOut_Nibbles:', #!
    '419' => 'SpittingOut_Slurp:', #!
    '420' => 'SpittingOut_Glug:', #!
    '421' => 'ThrowingUp_Crunch:', #!
    '422' => 'ThrowingUp_Chomp:', #!
    '423' => 'ThrowingUp_Nibbles:', #!
    '424' => 'ThrowingUp_Slurp:', #!
    '425' => 'ThrowingUp_Glug:', #!
    #...
    '478' => 'Slang_Oh_snap:',
    '479' => 'Slang_Ridonculous:',
    '481' => 'Slang_Serio:',
    '482' => 'Slang_Sick:',
    '483' => 'Slang_So_money:',
    '484' => 'Slang_Totes:',
    '485' => 'Slang_Fail:',
    '486' => 'Slang_Sweet:',
    '487' => 'Slang_Thats_my_jam:',
    '488' => 'Slang_Da_bomb:',
    '489' => 'Slang_Off_da_heezy:',
    '490' => 'Slang_Argh:',
    '491' => 'Slang_Furb:',
    '492' => 'Slang_Epic:',
    '493' => 'Slang_Awesome_sauce:',
    '494' => 'Slang_Cray_cray:',
    '495' => 'Slang_Partay:',
    '496' => 'Slang_LOL:',
    '497' => 'Slang_Cool:',
    '498' => 'Slang_Amaze:',
    '499' => 'Slang_Rad:',
    '500' => 'Slang_Tight:',
    '501' => 'Slang_My_bad:',
    '502' => 'Slang_Holla:',
    '503' => 'Slang_Bro:',
    '504' => 'Slang_Wicked:',
    '505' => 'Slang_Truu_dat:',
    '506' => 'Slang_Intense:',
    '508' => 'Slang_Smooch:',
    '509' => 'Slang_Thats_hot:',
    '510' => 'Slang_Awesome:',
    '511' => 'Slang_Fabulous:',
    '512' => 'Slang_Bling_bling:',
    '513' => 'Slang_No_worries:',
    '514' => 'Slang_Yo:',
    '515' => 'Slang_Buddy:',
    '516' => 'Slang_Get_my_grub_on:',
    '517' => 'Slang_Chillax:',
    '518' => 'Slang_Super:',
    '520' => 'Slang_Noob:',
    '521' => 'Slang_Foreals:',
    '522' => 'Slang_Bring_it:',
    '523' => 'Slang_Bananas:',
    '524' => 'Slang_Gosh:',
    '525' => 'Slang_Jelly:',
    '527' => 'Slang_Oh_dip:',
    '528' => 'Laughter_Low:',
    '529' => 'Laughter_Mid:',
    '530' => 'Laughter_High:',
    '531' => 'Laughter_VeryHigh:',
    '532' => 'Angry_Low:',
    '533' => 'Angry_Mid:',
    '534' => 'Angry_High:',
    '535' => 'Angry_VeryHigh:',
    '590' => 'Scared_Low:',
    '591' => 'Scared_Mid:',
    '592' => 'Scared_High:',
    '593' => 'Scared_VeryHigh:',
    '594' => 'Sad_Low:',
    '595' => 'Sad_Mid:',
    '596' => 'Sad_High:',
    '597' => 'Sad_VeryHigh:',
    '598' => 'Excited_Low:',
    '599' => 'Excited_Mid:',
    '600' => 'Excited_High:',
    '601' => 'Excited_VeryHigh:',
    '602' => 'Love_Low:',
    '603' => 'Love_Mid:',
    '604' => 'Love_High:',
    '605' => 'Love_VeryHigh:',
    '606' => 'Hungry_Low:',
    '607' => 'Hungry_Mid:',
    '608' => 'Hungry_High:',
    '609' => 'Hungry_VeryHigh:',
    #...
    '700' => 'F2F_Boredom: I\'m bored / sleepy', # does various silly things depending on personality
    '701' => 'F2F_Burp: Burp',
    '702' => 'F2F_Cough: Chew-chew',
    '703' => 'F2F_Excitement: You touched my head or side, you turned me on a side',
    '704' => 'F2F_Fart: Fart',
    '705' => 'F2F_Greeting: I woke up!', # sent on Furby wakeup, even before it pronounces the 'Good morning' phrase
    '706' => 'F2F_InitGroupsong1: (?)', # sent at random when Furby is idle (like ping, or searching for other Furbys?). Responds with '721'
    '707' => 'F2F_InitGroupsong2: (?)', # sent at random when Furby is idle (like ping, or searching for other Furbys?). Responds with '722'
    '708' => 'F2F_InitGroupsong3: (?)', #  speech: dang-dang-dang-da..... Responds with '723'
    '709' => 'F2F_InitGroupsong4: (?)', #  speech: bo-ga-di-di-do ... dang-dang-dang-da..... Responds with '724'
    '710' => 'F2F_Happiness: Me happy (also when head or back is touched)',
    '711' => 'F2F_Hiccup: cough-cough-cough',
    '712' => 'F2F_Hunger: Me hungry! / Kah Ay-tay!',
    '713' => 'F2F_Laughing: You touched my tummy; also sent on its own like <touch my tummy, please?> / As command: imitate tummy touch(?)', #<
    '714' => 'F2F_Sick:', #  something that he dislikes (vomit like sound, changes eyes)
    '715' => 'F2F_Silliness:', #  something he dislikes? speaks rapidly
    '716' => 'F2F_Singing: Me happy (you touched my side or back, or head)',
    '717' => 'F2F_Sneeze: Achoo!',
    '718' => 'F2F_Snore: Yawn (I\'m going to sleep) / As command: Yawn!', # when sent as a command, will yawn / sent automatically twice when Furby is going into deep sleep mode
    '719' => 'F2F_Whispering: Whisper, whisper, he-he-he',
    '720' => 'F2F_Wonder:', #  something he dislikes, "uh oh kaa tee, do?"
    '721' => 'F2F_Groupsong1: got a command 706 (plus sings a song); as command: sing that song', #! handshake?
    '722' => 'F2F_Groupsong2: got a command 707 (plus sings a song); as command: sing that song', #! handshake?
    '723' => 'F2F_Groupsong3: got a command 708 (plus sings a song); as command: sing that song', #! handshake?
    '724' => 'F2F_Groupsong4: got a command 709 (plus sings a song); as command: sing that song', #! handshake?
    #...
    '727' => 'Utility_TooHot:',
    '728' => 'Utility_TooCold:',
    '729' => 'Utility_JustRight:',
    '731' => 'Utility_ShowerSong:',
    '733' => 'Utility_NoWater:',
    '735' => 'Poop:',
    '745' => 'CopyCat_Correct:',
    '746' => 'CopyCat_Incorrect:',
    '747' => 'CopyCat_Impatient:',
    '748' => 'CopyCat_Disappointed:',
    '749' => 'CopyCat_Celebration:',
    #...
    '760' => 'Friends_LoveFriend:', #  "love friend, nay nay noo la"
    '761' => 'Friends_Baby:', #  "day-dee"
    '762' => 'Friends_Princess:', #  "meila koo mei ta, meila koo mei ta, like mua, mua, mua" (kiss)
    '763' => 'Friends_Warrior:', #  "ka tulu ata, ata, ata, ata" (song)
    '764' => 'Friends_GossipQueen:', #  "witi wati to to, blah blah blah blah blah, blah" (song)
    '765' => 'Friends_Joker:', #  "(fart) oh-ho-ho, tu lu li ku!"
    '766' => 'Friends_Diva:', #  "boda tei ta eу ku, shaa!"
    #...
    '774' => 'Baby_Angry:',
    '775' => 'Baby_Suprised:',
    '776' => 'Baby_Sympathetic:',
    '777' => 'Baby_Song1:',
    '778' => 'Baby_Song2:',
    '779' => 'Baby_Song3:',
    #...
    '780' => 'Event: I\'ve got command 790',
    '781' => 'Event: I\'ve got command 791',
    '782' => 'Generic_Congrats:',
    '783' => 'Diner_TooSlow:',
    '784' => 'Diner_Correct:',
    '785' => 'Generic_Gloating:',
    #...
    '787' => 'Sing_A_Long_Song0:',
    '788' => 'HideSeek_Start',
    '789' => 'HideSeek_Ready',
    '790' => 'Generic_GoodGame :', #  "ee day do lay lo la!". Responds with '780'
    '791' => 'Generic_YouNoGood:', #  "u nai bo li day". Responds with '781'
    '792' => 'HideSeek_Freezing:',
    '793' => 'HideSeek_Cold:',
    #...
    '795' => 'HideSeek_Warm:',
    '796' => 'HideSeek_Hot :',
    '797' => 'HideSeek_Boiling:',
    '798' => 'HideSeek_Warmer1:',
    '799' => 'HideSeek_Warmer2:',
    '800' => 'Diner_Okay:',
    '801' => 'HideSeek_Colder1:',
    '802' => 'HideSeek_Colder2:',
    '803' => 'Diner_Incorrect:',
    '804' => 'HideSeek_Thinking:',
    '805' => 'HideSeek_Found:',
    '806' => 'HideSeek_Concerned:',
    '807' => 'HideSeek_Excited:',
    '808' => 'HideSeek_Happy:',
    '809' => 'HideSeek_Sad:',
    #...
    '813' => 'Request: What\'s your personality?', #! used to initate handshake step 1 and get the current personality type
    '814' => 'Egg_Attention:',
    #...
    '819' => 'Baby_Born:',
    '820' => 'Hypnotize for 1 minute', #! this command is sent by iOS app immediately on application start and every 40 seconds. Responds with current character type (90x).
    '821' => 'Baby_Happy:',
    '822' => 'Baby_Excited:',
    '823' => 'Baby_Sad:',
    '824' => 'Game_Amazed:',
    '825' => 'Game_Annoyed:',
    '826' => 'Game_Excited:',
    '827' => 'Game_Bored:',
    '828' => 'Game_Concerned:',
    '829' => 'Game_ConfusedAnger:',
    #...
    '830' => '', #!
    '831' => '', #
    '832' => '', #!
    '833' => 'Game_Dissapointed:',
    '834' => 'Game_Disgusted:',
    '835' => 'Game_Dizzy:',
    '836' => 'Game_Embarrassed:',
    '837' => 'Game_Ill:',
    '838' => 'Game_Happy:',
    '839' => 'Game_Laughter:',
    '840' => 'Game_Overjoyed:',
    '841' => 'Game_Proud:',
    '842' => 'Game_Relieved:',
    '843' => 'Game_Sad:',
    '844' => 'Game_Suprised:',
    '845' => 'Game_Whistle:',
    '848' => 'Furball_Score:',
    '849' => 'Furball_Sad:',
    '850' => 'Excited:', #  "yeah mi mi be day mu ha ha", "yeah, yeah, yeah! oh yeah yeah!"
    '851' => 'Tender:', #  "mmm, ka tulu, me like", "haa"
    '852' => 'Scared:', #  "oh-oh-oh-oh!", "dude, no!"
    '853' => 'Angry:', #  "grrrh ko ko" something he dislikes
    '854' => 'Sad:', #  "grrrh ko ko", "ka bu ku do"
    '855' => 'Happy:', #  "ka happy dude", "a ha pee pee day", "yeah nice good boo tai naba"
    '856' => 'Bored:', #  "u-ho-ho, a-ho-ho", "blah blah blah blah"
    '857' => 'Surprised:', #  "a ha! bu da to to", "u ha, he-he-he"
    '858' => 'Confused:', #  "ha? du?"
    '859' => 'Understanding:', #  "a ha", "oh, kah hey hey, I see"
    '860' => 'Thinking:', #  "ahaa.. be day loo ney", "haa", "um, mmm, hm"
    '861' => 'Tired:', #  "huh" (bored?)
    '862' => 'Snore: Sleep!', #! sleep (for several seconds)
    '863' => 'Laugh: Laugh!', #! laugh
    '864' => 'Burp: Burp!', #! burp
    '865' => 'Fart: Fart!', #! fart/poo
    '866' => 'Purr: Purr!', #! purr
    '867' => 'Sneeze: Sneeze!', #! long sneeze
    '868' => 'Song: Sing!', #! sing
    '869' => 'Silly: Talk!', #! talk
    '870' => 'Love_User:', #  "me tay, yes, yes!" (hearts in his eyes), "di do dude, good friend"
    '871' => 'Dislike:', #  "ah bu to lu, no like"
    '872' => 'Whispering:', #  says some rap
    '873' => 'OriginalSong:', #  sings: "di-di-di-di, tam-da-di dam"
    '874' => 'Crunch:', #  eating motion
    '875' => 'Chomp:', #  angry bite, "he-he-he"
    '876' => 'Nibbles:', #  chewing/sucking sound (like when someone puts a finger in his mouth)
    '877' => 'Slurp:', #  suck in
    '878' => 'Glug:', #  ingest
    '879' => 'SpittingOut:', #  short sneeze, "like pea" (or something else, depending on personality)
    '880' => 'ThrowUp:', #! motion (dislike)
    '881' => 'HotReaction:', # "oh-hoo ha-ha" (or "ha-haa" like something scary or hot)
    '882' => 'ColdReaction:', #! "ah ha me bee dey, nice good!", purr
    '883' => 'LikeFood:', #  tasty: "mmm, yum", "ha haa!"
    '884' => 'DislikeFood:', #  not tasty (vomit-like)
    '885' => 'SweetReaction:', #  "oooh"
    '886' => 'SourReaction:', #  "chew chew ooh"
    '887' => 'SpicyReaction:', #! "aaah" (exclamation) (changes eyes to 'burning' in warrior mode)
    '888' => 'RefreshingReaction:', #  "aaah"
    '889' => 'Caffeinated:', #! motion (sings "ahh-tahoo")
    '890' => 'Baby:', #  "baby"
    '891' => 'Hungry:', #  "ka ay tay oooh", "purr grrr uh oh"
    '892' => 'GoodFood:', #  "mmm, good food"
    '893' => 'Whistling:', #
    '894' => 'Furball_Miss:',
    #....
    '897' => 'Sing_A_Long_Song1:',
    '898' => 'Sing_A_Long_Song2:',
    '899' => 'Sing_A_Long_PowerUp:',
    #...
    '900' => 'I have no personality developed yet...',
    '901' => 'I\'m a princess!',
    '902' => 'I\'m a diva!',
    '903' => 'I\'m a warrior!',
    '904' => 'I\'m a joker!',
    '905' => 'I\'m a gossip queen!',
    '906' => 'My personality is #906 [SNUGGLEBY]',
    '907' => 'My personality is #907 [SASSBY]',
    '908' => 'My personality is #908 [SCOFFBY]',
    '909' => 'My personality is #909 [CHUCKLEBY]',
    '910' => 'My personality is #910 [GASSBY]',
    '911' => 'My personality is #911 [LATEBY]',
};

sub description {
    my $command = shift;
    return $description->{$command} || Furby::Command::Dictionary::description($command);
}

1;