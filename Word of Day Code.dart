
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const WordOfTheDayApp());
}

class WordOfTheDayApp extends StatelessWidget {
  const WordOfTheDayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word of the Day!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Note: DartPad only ships the default Flutter fonts (e.g. Roboto).
        // To use a playful font like 'Comic Neue' or 'Fredoka', add it to
        // pubspec.yaml and load it via google_fonts or a local asset when
        // running this outside DartPad.
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B6B),
          primary: const Color(0xFFFF6B6B),
          secondary: const Color(0xFF4ECDC4),
          tertiary: const Color(0xFFFFD166),
          surface: const Color(0xFFFFF9EC),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// Data Model for Daily Content
class DailyWord {
  final String word;
  final String phonetic;
  final String definition;
  final String emoji;
  final Color themeColor;
  final String parentActivity;
  final String classmateActivity;
  final String worldActivity;

  const DailyWord({
    required this.word,
    required this.phonetic,
    required this.definition,
    required this.emoji,
    required this.themeColor,
    required this.parentActivity,
    required this.classmateActivity,
    required this.worldActivity,
  });
}

// A bank of words, each with its own matching set of activities. Growing
// this list automatically grows both the daily rotation and the shuffle
// button's pool — nothing else needs to change.
const List<DailyWord> wordBank = [
  // --- Original Words ---
  DailyWord(
    word: 'GIGGLE',
    phonetic: 'GIG - ul',
    definition: 'A silly, happy little laugh!',
    emoji: '😄',
    themeColor: Color(0xFFFF6B6B),
    parentActivity: 'Tell each other 3 silly knock-knock jokes during dinner and see who giggles first!',
    classmateActivity: 'Play the "Freeze & Giggle" game during recess—gasp when someone freezes, giggle when they move!',
    worldActivity: 'Go on a "Gasp & Giggle" walk outside. Look for animals doing something silly!',
  ),
  DailyWord(
    word: 'EXPLORE',
    phonetic: 'ex - PLOR',
    definition: 'To travel around and discover new things!',
    emoji: '🔍',
    themeColor: Color(0xFF4ECDC4),
    parentActivity: 'Build a blanket fort in the living room and use a flashlight to explore inside.',
    classmateActivity: 'Partner up with a friend to find 3 green objects in the classroom.',
    worldActivity: 'Step outside and find 2 different types of leaves or rocks in the yard.',
  ),
  DailyWord(
    word: 'BRAVE',
    phonetic: 'BRAYV',
    definition: 'Being strong and trying something even if it feels scary!',
    emoji: '🦁',
    themeColor: Color(0xFFEF476F),
    parentActivity: 'Try one new food together at dinner tonight, even if it looks a little strange!',
    classmateActivity: 'Be the first to raise your hand and answer a question in class today.',
    worldActivity: 'Climb to the top of the tallest thing at the playground, one step at a time.',
  ),
  DailyWord(
    word: 'WIGGLE',
    phonetic: 'WIG - ul',
    definition: 'To move your body side to side in a funny way!',
    emoji: '🐛',
    themeColor: Color(0xFFFFD166),
    parentActivity: 'Have a 2-minute wiggle dance party in the kitchen before bedtime.',
    classmateActivity: 'Play "Wiggle Freeze Dance" together at recess—wiggle until the music stops!',
    worldActivity: 'Watch how worms, caterpillars, or leaves wiggle outside and copy their moves.',
  ),
  DailyWord(
    word: 'SHARE',
    phonetic: 'SHAIR',
    definition: 'To let someone else use or enjoy something of yours!',
    emoji: '🤝',
    themeColor: Color(0xFF06D6A0),
    parentActivity: 'Pick one toy to share with a sibling or parent for 10 minutes tonight.',
    classmateActivity: 'Offer to share your crayons or snack with a classmate today.',
    worldActivity: 'Bring an extra snack to the park and share it with a friend.',
  ),
  DailyWord(
    word: 'CURIOUS',
    phonetic: 'KYUR - ee - us',
    definition: 'Wanting to learn and ask questions about everything!',
    emoji: '🧐',
    themeColor: Color(0xFF118AB2),
    parentActivity: 'Ask 3 "why" questions about something at home and look up the answers together.',
    classmateActivity: 'Ask a classmate a question about their favorite animal or game.',
    worldActivity: 'Pick up a rock or a stick outside and wonder out loud where it came from.',
  ),
  DailyWord(
    word: 'GENTLE',
    phonetic: 'JEN - tul',
    definition: 'Being soft, kind, and careful with people and things!',
    emoji: '🐣',
    themeColor: Color(0xFF9B5DE5),
    parentActivity: 'Practice gentle pets on a stuffed animal or family pet before bed.',
    classmateActivity: 'Use a gentle voice and gentle hands when playing a group game today.',
    worldActivity: 'Find a flower or bug outside and look at it without touching, being extra gentle.',
  ),
  DailyWord(
    word: 'PATIENT',
    phonetic: 'PAY - shent',
    definition: 'Being able to wait calmly without getting upset!',
    emoji: '⏳',
    themeColor: Color(0xFFFF9F1C),
    parentActivity: 'Take turns waiting for the microwave timer to ding without peeking!',
    classmateActivity: 'Wait quietly in line today and give a friend a thumbs up for waiting too.',
    worldActivity: 'Sit still outside for one minute and count how many birds or bugs you see.',
  ),

  // --- 50 New Words ---
  DailyWord(
    word: 'KIND',
    phonetic: 'KYND',
    definition: 'Being nice, caring, and helpful to others!',
    emoji: '💖',
    themeColor: Color(0xFFFF70A6),
    parentActivity: 'Write a sweet sticky note and leave it on someone’s bedroom door.',
    classmateActivity: 'Give two genuine compliments to classmates today during school.',
    worldActivity: 'Smile and say "good morning" or "hello" to a neighbor outside.',
  ),
  DailyWord(
    word: 'CREATE',
    phonetic: 'kree - AYT',
    definition: 'To make something brand new using your imagination!',
    emoji: '🎨',
    themeColor: Color(0xFFFF9770),
    parentActivity: 'Build a tiny town together using recycled boxes, cups, or LEGO blocks.',
    classmateActivity: 'Draw a collaborative picture with a friend, switching colors every minute.',
    worldActivity: 'Use twigs, leaves, and mud outside to build a miniature fairy or bug house.',
  ),
  DailyWord(
    word: 'ENERGY',
    phonetic: 'EN - er - jee',
    definition: 'The power inside you that keeps you moving and active!',
    emoji: '⚡',
    themeColor: Color(0xFFFFD670),
    parentActivity: 'Do 10 jumping jacks together before sitting down to eat.',
    classmateActivity: 'Lead your group in a quick 30-second stretch before quiet reading.',
    worldActivity: 'Run as fast as you can from one side of the grass field to the other!',
  ),
  DailyWord(
    word: 'GLEE',
    phonetic: 'GLEE',
    definition: 'A feeling of big joy, excitement, and happiness!',
    emoji: '🥳',
    themeColor: Color(0xFFE9FF70),
    parentActivity: 'Put on your favorite upbeat song and do a silly victory dance.',
    classmateActivity: 'Cheer excitedly when a classmate answers a tough question right.',
    worldActivity: 'Jump into a pile of leaves or pop bubbles outside with total joy.',
  ),
  DailyWord(
    word: 'FOCUS',
    phonetic: 'FOH - kus',
    definition: 'Paying close attention to one thing at a time!',
    emoji: '🎯',
    themeColor: Color(0xFF70D6FF),
    parentActivity: 'Complete a 20-piece puzzle together without looking at devices.',
    classmateActivity: 'Look directly at your teacher or friend when they are speaking to you.',
    worldActivity: 'Stare at an ant or insect for 30 seconds and observe everything it does.',
  ),
  DailyWord(
    word: 'COOPERATE',
    phonetic: 'koh - OP - er - ayt',
    definition: 'Working together as a team to get something done!',
    emoji: '🧩',
    themeColor: Color(0xFF80FFDB),
    parentActivity: 'Clean up the dinner table by creating an assembly line together.',
    classmateActivity: 'Work with a partner to carry a heavy box or pack up sports equipment.',
    worldActivity: 'Help someone carry groceries or hold open a heavy door outside.',
  ),
  DailyWord(
    word: 'WHISPER',
    phonetic: 'WHIS - per',
    definition: 'Speaking in a super quiet, soft voice!',
    emoji: '🤫',
    themeColor: Color(0xFF5390D9),
    parentActivity: 'Play a game of "Telephone" around the living room using secret whispers.',
    classmateActivity: 'Share a funny secret word with your desk neighbor in a quiet whisper.',
    worldActivity: 'Walk quietly through a quiet park path and whisper so you don’t scare birds.',
  ),
  DailyWord(
    word: 'BOUNCE',
    phonetic: 'BOWNSS',
    definition: 'To spring up and down after hitting something!',
    emoji: '🏀',
    themeColor: Color(0xFF7209B7),
    parentActivity: 'Bounce a tennis ball back and forth off a kitchen wall 10 times.',
    classmateActivity: 'See who can bounce a basketball the most times in a row without dropping it.',
    worldActivity: 'Find a safe grassy area and try hopping like a frog or kangaroo!',
  ),
  DailyWord(
    word: 'NOURISH',
    phonetic: 'NUR - ish',
    definition: 'Giving your body good food and water to grow healthy and strong!',
    emoji: '🥗',
    themeColor: Color(0xFF4895EF),
    parentActivity: 'Prepare a colorful fruit plate with at least 3 different colors.',
    classmateActivity: 'Drink a full cup of water at lunch and encourage your friends to do the same.',
    worldActivity: 'Water a plant or tree outside to give it the nourishment it needs to grow.',
  ),
  DailyWord(
    word: 'SHINE',
    phonetic: 'SHYN',
    definition: 'To give off bright light or stand out in a great way!',
    emoji: '🌟',
    themeColor: Color(0xFFF72585),
    parentActivity: 'Use a flashlight in a dark hallway to project hand-shadow shapes on the wall.',
    classmateActivity: 'Showcase a special talent or drawing during show-and-tell.',
    worldActivity: 'Find something shiny in nature (like a wet pebble or mica rock) that catches the sun.',
  ),
  DailyWord(
    word: 'HARMONY',
    phonetic: 'HAR - muh - nee',
    definition: 'When different parts fit together in a peaceful, beautiful way!',
    emoji: '🎶',
    themeColor: Color(0xFFB5179E),
    parentActivity: 'Sing a simple song together where each person hums or sings a different note.',
    classmateActivity: 'Help make sure everyone feels included in playing a game at recess.',
    worldActivity: 'Listen quietly outside and identify 3 different sounds blending together.',
  ),
  DailyWord(
    word: 'GARDEN',
    phonetic: 'GAR - den',
    definition: 'A special place where flowers, plants, and vegetables grow!',
    emoji: '🌻',
    themeColor: Color(0xFF38B000),
    parentActivity: 'Plant seeds in a small cup or wipe down houseplant leaves with a damp cloth.',
    classmateActivity: 'Draw a dream garden on paper featuring giant mythical flowers.',
    worldActivity: 'Visit a outdoor garden or park flowerbed and smell two different flowers.',
  ),
  DailyWord(
    word: 'SPARKLE',
    phonetic: 'SPAR - kul',
    definition: 'To shine with tiny flashes of bright light!',
    emoji: '✨',
    themeColor: Color(0xFFFFB703),
    parentActivity: 'Add glitter glue or foil stars to a craft project at home.',
    classmateActivity: 'Give someone a compliment that makes their eyes sparkle with joy.',
    worldActivity: 'Look for morning dew drops or sunlight sparkling on lake or puddle water.',
  ),
  DailyWord(
    word: 'TENDER',
    phonetic: 'TEN - der',
    definition: 'Soft, delicate, and full of loving care!',
    emoji: '🧸',
    themeColor: Color(0xFFFFC6FF),
    parentActivity: 'Tuck in a stuffed animal carefully and give it a cozy goodnight blanket.',
    classmateActivity: 'Offer a comforting high-five or hug to a classmate who feels down.',
    worldActivity: 'Gently hold a fallen tree leaf without tearing or snapping it.',
  ),
  DailyWord(
    word: 'MARVEL',
    phonetic: 'MAR - vul',
    definition: 'To feel filled with wonder and amazement!',
    emoji: '🌌',
    themeColor: Color(0xFF7209B7),
    parentActivity: 'Look at photos of space or ocean creatures and talk about how cool they are.',
    classmateActivity: 'Share an amazing animal fact with your tablemates.',
    worldActivity: 'Look up at the clouds for two minutes and marvel at the strange shapes they make.',
  ),
  DailyWord(
    word: 'ZEST',
    phonetic: 'ZEST',
    definition: 'Great enthusiasm, energy, and excitement for life!',
    emoji: '🍋',
    themeColor: Color(0xFFFFEE32),
    parentActivity: 'Grate real lemon zest for dinner and taste a tiny drop together!',
    classmateActivity: 'Start your classroom chore or morning routine with extra enthusiasm today.',
    worldActivity: 'Take a brisk, high-energy walk outside while taking deep fresh air breaths.',
  ),
  DailyWord(
    word: 'RESOLVE',
    phonetic: 'ri - ZOLV',
    definition: 'Making a strong firm decision to solve a problem!',
    emoji: '🧩',
    themeColor: Color(0xFF00B4D8),
    parentActivity: 'Talk about a small disagreement today and brainstorm a fair solution.',
    classmateActivity: 'Work out who gets the first turn at a game using "Rock, Paper, Scissors".',
    worldActivity: 'Fix a small broken structure outside, like rebuilding a fallen twig tower.',
  ),
  DailyWord(
    word: 'BLOOM',
    phonetic: 'BLOOM',
    definition: 'To open up and grow into a healthy flower!',
    emoji: '🌸',
    themeColor: Color(0xFFFF85A1),
    parentActivity: 'Put a celery stick in colored water and watch the leaves change over time.',
    classmateActivity: 'Encourage a shy classmate to share an idea during group time.',
    worldActivity: 'Find a flower bud outside that hasn’t opened yet and check back on it tomorrow.',
  ),
  DailyWord(
    word: 'CHEERFUL',
    phonetic: 'CHEER - ful',
    definition: 'Feeling happy, bright, and full of good spirits!',
    emoji: '☀️',
    themeColor: Color(0xFFFFD000),
    parentActivity: 'Sing a happy song aloud while making breakfast or packing backpacks.',
    classmateActivity: 'Greet three people in the hallway today with a big bright smile.',
    worldActivity: 'Draw a cheerful sunshine face with sidewalk chalk on the driveway.',
  ),
  DailyWord(
    word: 'WISDOM',
    phonetic: 'WIZ - dum',
    definition: 'Knowing what is good, right, and helpful from experience!',
    emoji: '🦉',
    themeColor: Color(0xFF4361EE),
    parentActivity: 'Ask a parent or grandparent to tell a story about when they were your age.',
    classmateActivity: 'Listen carefully to advice from your teacher or class helper today.',
    worldActivity: 'Observe an old big oak tree outside and think about all the weather it has seen.',
  ),
  DailyWord(
    word: 'SWIFT',
    phonetic: 'SWIFT',
    definition: 'Moving very fast and smoothly!',
    emoji: '🦅',
    themeColor: Color(0xFF48CAE4),
    parentActivity: 'Time how fast you can clean up five scattered toys off the floor.',
    classmateActivity: 'Play a game of tag at recess and practice making swift direction changes.',
    worldActivity: 'Watch birds or clouds move swiftly across the sky overhead.',
  ),
  DailyWord(
    word: 'FORGIVE',
    phonetic: 'for - GIV',
    definition: 'Choosing to let go of anger when someone makes a mistake!',
    emoji: '🕊️',
    themeColor: Color(0xFFE2AFFC),
    parentActivity: 'Say "It’s okay, I forgive you" when a family member makes a minor spill or mistake.',
    classmateActivity: 'Accept an apology quickly and invite your classmate back to play.',
    worldActivity: 'Blow a dandelion seed or leaf into the wind as a symbol of letting go of bad feelings.',
  ),
  DailyWord(
    word: 'NOVEL',
    phonetic: 'NOV - ul',
    definition: 'Something new, unusual, and interesting!',
    emoji: '💡',
    themeColor: Color(0xFFFF9E00),
    parentActivity: 'Try eating a meal while sitting in a completely new place at home.',
    classmateActivity: 'Invent a brand-new game with new rules during free play.',
    worldActivity: 'Walk down a path in the park that you have never walked down before.',
  ),
  DailyWord(
    word: 'DELIGHT',
    phonetic: 'di - LYT',
    definition: 'A high degree of pleasure, joy, or satisfaction!',
    emoji: '🍨',
    themeColor: Color(0xFFF15BB5),
    parentActivity: 'Surprise someone in the house with a small treat or happy handwritten drawing.',
    classmateActivity: 'Share a silly funny riddle with your group that makes everyone laugh.',
    worldActivity: 'Watch ducks swim or splash around in a pond or puddle with delight.',
  ),
  DailyWord(
    word: 'FORTITUDE',
    phonetic: 'FOR - ti - tood',
    definition: 'Mental and emotional strength when facing a challenge!',
    emoji: '🛡️',
    themeColor: Color(0xFF52B788),
    parentActivity: 'Keep trying to tie your shoes or tie a knot even if it takes 5 tries.',
    classmateActivity: 'Stay calm and keep trying even when a building block tower falls over.',
    worldActivity: 'Walk up a steep hill without stopping or complaining along the way.',
  ),
  DailyWord(
    word: 'GLIDE',
    phonetic: 'GLYD',
    definition: 'To move smoothly and effortlessly without effort!',
    emoji: '🦢',
    themeColor: Color(0xFF90E0EF),
    parentActivity: 'Slide across a smooth wood floor in your socks like an ice skater.',
    classmateActivity: 'Pretend to glide through space like an astronaut during gym class.',
    worldActivity: 'Watch a paper airplane or bird glide on the wind currents outside.',
  ),
  DailyWord(
    word: 'HONEST',
    phonetic: 'ON - est',
    definition: 'Telling the truth and being trustworthy and fair!',
    emoji: '⭐',
    themeColor: Color(0xFFFFB703),
    parentActivity: 'Admit right away if you accidentally made a mess or spilled something.',
    classmateActivity: 'Play by the exact rules of a game even when no one is watching.',
    worldActivity: 'If you find a lost item on the playground, turn it in to lost-and-found.',
  ),
  DailyWord(
    word: 'IMAGINE',
    phonetic: 'ih - MAJ - in',
    definition: 'Forming a picture or idea in your mind of things not present!',
    emoji: '🦄',
    themeColor: Color(0xFFC77DFF),
    parentActivity: 'Close your eyes and describe what your dream playground would look like.',
    classmateActivity: 'Pretend your desk is a spaceship traveling to a new planet.',
    worldActivity: 'Look at a rock or tree trunk and imagine what creature might live underneath.',
  ),
  DailyWord(
    word: 'JUBILANT',
    phonetic: 'JOO - bih - lunt',
    definition: 'Feeling or expressing great joy and triumph!',
    emoji: '🎉',
    themeColor: Color(0xFFFF4D6D),
    parentActivity: 'Give high-fives and do a happy jump when finishing a chore together.',
    classmateActivity: 'Cheer loudly for everyone on your team after a game.',
    worldActivity: 'Raise your arms high in the air at the top of a playground slide!',
  ),
  DailyWord(
    word: 'KEEN',
    phonetic: 'KEEN',
    definition: 'Having a sharp mind or very sharp senses!',
    emoji: '🦅',
    themeColor: Color(0xFF2EC4B6),
    parentActivity: 'Play "I Spy" at home and pick very small, subtle items to spot.',
    classmateActivity: 'Notice when a classmate gets a haircut or new shoes and compliment them.',
    worldActivity: 'Listen closely outdoors and identify 4 quiet sounds you normally miss.',
  ),
  DailyWord(
    word: 'LOYAL',
    phonetic: 'LOY - ul',
    definition: 'Standing by your friends and family through thick and thin!',
    emoji: '🐶',
    themeColor: Color(0xFFE76F51),
    parentActivity: 'Help a family member complete a task without being asked twice.',
    classmateActivity: 'Sit with a friend who is sitting all by themselves at lunch.',
    worldActivity: 'Take care of your home pet or neighborhood animals consistently.',
  ),
  DailyWord(
    word: 'MOTIVATE',
    phonetic: 'MOH - ti - vayt',
    definition: 'Giving someone enthusiasm and reason to do something great!',
    emoji: '📣',
    themeColor: Color(0xFFF4A261),
    parentActivity: 'Cheer on a family member while they exercise or clean.',
    classmateActivity: 'Say "You can do it!" to a classmate struggling with a task.',
    worldActivity: 'Challenge yourself to do 5 extra steps or jumps on the track.',
  ),
  DailyWord(
    word: 'NURTURE',
    phonetic: 'NER - cher',
    definition: 'Helping someone or something grow, develop, and succeed!',
    emoji: '🌱',
    themeColor: Color(0xFF2A9D8F),
    parentActivity: 'Help feed and take care of house pets or houseplants today.',
    classmateActivity: 'Help a younger student or classmate learn a new game.',
    worldActivity: 'Place clean water in a bird bath or dish outside for neighborhood birds.',
  ),
  DailyWord(
    word: 'OPTIMISM',
    phonetic: 'OP - tih - miz - um',
    definition: 'Expecting good things to happen and staying hopeful!',
    emoji: '🌈',
    themeColor: Color(0xFFE9C46A),
    parentActivity: 'Talk about 3 good things you are excited about for tomorrow.',
    classmateActivity: 'When outdoor recess gets rained out, suggest a fun indoor game instead.',
    worldActivity: 'Look for a rainbow after a rainy weather spell outdoors.',
  ),
  DailyWord(
    word: 'POLITE',
    phonetic: 'puh - LYT',
    definition: 'Having good manners and showing respect to others!',
    emoji: '🎩',
    themeColor: Color(0xFF264653),
    parentActivity: 'Remember to say "Please", "Thank you", and "Excuse me" all day.',
    classmateActivity: 'Hold the door open for your class line as everyone goes outside.',
    worldActivity: 'Say a polite "Thank you!" to a store worker or bus driver.',
  ),
  DailyWord(
    word: 'QUIET',
    phonetic: 'KWY - et',
    definition: 'Making very little or no noise at all!',
    emoji: '🤫',
    themeColor: Color(0xFF8ECAE6),
    parentActivity: 'Have a 5-minute silent reading or coloring time together in cozy chairs.',
    classmateActivity: 'Practice moving your chair and tiptoeing without making a sound.',
    worldActivity: 'Sit under a shade tree outside and listen quietly to nature breeze sounds.',
  ),
  DailyWord(
    word: 'RADIANT',
    phonetic: 'RAY - dee - unt',
    definition: 'Shining brightly or showing intense happiness!',
    emoji: '☀️',
    themeColor: Color(0xFFFFB703),
    parentActivity: 'Put on a bright yellow or orange shirt that makes you feel sunny.',
    classmateActivity: 'Share a big beaming smile with someone who looks tired.',
    worldActivity: 'Stand in a safe patch of warm sunlight and feel its radiant warmth.',
  ),
  DailyWord(
    word: 'SERENE',
    phonetic: 'suh - REEN',
    definition: 'Calm, peaceful, and untroubled!',
    emoji: '🧘',
    themeColor: Color(0xFFBEE9E8),
    parentActivity: 'Take three deep, slow belly breaths together before sleeping.',
    classmateActivity: 'Rest your head quietly on your desk for 1 minute during downtime.',
    worldActivity: 'Watch ripples slowly smooth out on calm pond water.',
  ),
  DailyWord(
    word: 'THRIVE',
    phonetic: 'THRYV',
    definition: 'To grow, develop, and succeed really well!',
    emoji: '🌿',
    themeColor: Color(0xFF52B788),
    parentActivity: 'Eat a healthy dinner and get a full night of restful sleep to thrive tomorrow.',
    classmateActivity: 'Celebrate how much your reading or math skills have grown this year.',
    worldActivity: 'Find a plant growing strong and green right out in nature.',
  ),
  DailyWord(
    word: 'UNIQUE',
    phonetic: 'yoo - NEEK',
    definition: 'Being the only one of its kind; special and different!',
    emoji: '🦄',
    themeColor: Color(0xFFD8BBFF),
    parentActivity: 'Talk about 2 special things that make each family member unique.',
    classmateActivity: 'Celebrate a unique outfit or artwork made by a classmate.',
    worldActivity: 'Find a rock or leaf with a totally unique shape that no other rock has.',
  ),
  DailyWord(
    word: 'VIBRANT',
    phonetic: 'VY - brunt',
    definition: 'Full of energy, life, and bright colors!',
    emoji: '🎨',
    themeColor: Color(0xFFFF595E),
    parentActivity: 'Color a picture using the brightest markers in your box.',
    classmateActivity: 'Wear bright colorful socks to school and show your friends.',
    worldActivity: 'Look for bright vibrant red or yellow flowers blooming outdoors.',
  ),
  DailyWord(
    word: 'WONDER',
    phonetic: 'WON - der',
    definition: 'A feeling of surprise and admiration caused by something beautiful!',
    emoji: '🌌',
    themeColor: Color(0xFF1982C4),
    parentActivity: 'Look at the moon or stars tonight and talk about outer space.',
    classmateActivity: 'Ask your class a "What if..." question to stir imagination.',
    worldActivity: 'Examine a tiny spiderweb or snail shell closely with wonder.',
  ),
  DailyWord(
    word: 'XENIAL',
    phonetic: 'ZEE - nee - ul',
    definition: 'Being warm, welcoming, and hospitable to guests or strangers!',
    emoji: '🏠',
    themeColor: Color(0xFF8AC926),
    parentActivity: 'Welcome a neighbor or visitor with a cold glass of water or a warm wave.',
    classmateActivity: 'Invite a new student to join your table during lunch time.',
    worldActivity: 'Wave warmly to someone walking their dog in your neighborhood.',
  ),
  DailyWord(
    word: 'YOUTH',
    phonetic: 'YOO-th',
    definition: 'The time of being young, active, and full of potential!',
    emoji: '🌱',
    themeColor: Color(0xFFFFCA3A),
    parentActivity: 'Play a classic childhood playground game together like Hopscotch.',
    classmateActivity: 'Incorporate a fun game from when you were younger at recess.',
    worldActivity: 'Run freely in an open field and feel the joy of being young!',
  ),
  DailyWord(
    word: 'ZEAL',
    phonetic: 'ZEEL',
    definition: 'Great energy or enthusiasm in pursuit of a cause or objective!',
    emoji: '🚀',
    themeColor: Color(0xFFFF69EB),
    parentActivity: 'Tackle household chores with high energy and speed music!',
    classmateActivity: 'Dunk basketballs or run laps at PE class with full enthusiasm.',
    worldActivity: 'Sprint up a playground hill with great zeal!',
  ),
  DailyWord(
    word: 'AMBITION',
    phonetic: 'am - BISH - un',
    definition: 'A strong desire to achieve something great!',
    emoji: '🏆',
    themeColor: Color(0xFFFF9F1C),
    parentActivity: 'Draw a picture of what job you want to do when you grow up.',
    classmateActivity: 'Set a goal to read 3 books this week and track it together.',
    worldActivity: 'Practice throwing or kicking a ball until you hit a target 5 times.',
  ),
  DailyWord(
    word: 'BOUNDLESS',
    phonetic: 'BOUND - liss',
    definition: 'Having no limits or boundaries; endless!',
    emoji: '🌌',
    themeColor: Color(0xFF0077B6),
    parentActivity: 'List all the things you love until you run out of breath!',
    classmateActivity: 'Brainstorm infinite silly ideas for a creative writing story.',
    worldActivity: 'Look out across a wide open beach, lake, or field stretching far away.',
  ),
  DailyWord(
    word: 'CHARM',
    phonetic: 'CHARM',
    definition: 'A pleasing quality that attracts and delights people!',
    emoji: '🍀',
    themeColor: Color(0xFF70E000),
    parentActivity: 'Write a sweet note to a family member saying why they are charming.',
    classmateActivity: 'Say "Good morning!" with a warm smile to your teacher.',
    worldActivity: 'Find a tiny charming flower growing through a sidewalk crack.',
  ),
  DailyWord(
    word: 'DARING',
    phonetic: 'DAIR - ing',
    definition: 'Adventurous and willing to take bold risks!',
    emoji: '🦸',
    themeColor: Color(0xFFD90429),
    parentActivity: 'Try balancing on one foot with your eyes closed for 10 seconds.',
    classmateActivity: 'Try out a new piece of playground equipment you haven’t used before.',
    worldActivity: 'Cross a small creek by carefully stepping on dry stones.',
  ),
  DailyWord(
    word: 'EAGER',
    phonetic: 'EE - ger',
    definition: 'Wanting to do or have something very much!',
    emoji: '🙋',
    themeColor: Color(0xFFFFB703),
    parentActivity: 'Help set the dinner table before anyone even asks!',
    classmateActivity: 'Raise your hand eagerly when the teacher asks for a volunteer.',
    worldActivity: 'Wait eagerly at the front door when it’s time to head out to the park.',
  ),
  DailyWord(
    word: 'FESTIVE',
    phonetic: 'FES - tiv',
    definition: 'Joyful, colorful, and suitable for a celebration!',
    emoji: '🎈',
    themeColor: Color(0xFFF72585),
    parentActivity: 'Hang colorful paper banners or ribbons in your room.',
    classmateActivity: 'Organize a mini dance break at recess with your classmates.',
    worldActivity: 'Decorate sidewalk pavement using colorful chalk designs.',
  ),
  DailyWord(
    word: 'GENEROUS',
    phonetic: 'JEN - er - us',
    definition: 'Willing to give more of something than expected!',
    emoji: '🎁',
    themeColor: Color(0xFF4361EE),
    parentActivity: 'Give someone the bigger slice of fruit or snack without complaining.',
    classmateActivity: 'Lend your favorite gel pens or markers to a classmate in need.',
    worldActivity: 'Leave seeds or breadcrumbs out for birds in the park.',
  ),
  DailyWord(
    word: 'HEARTY',
    phonetic: 'HAR - tee',
    definition: 'Warm, friendly, energetic, and wholesome!',
    emoji: '🍲',
    themeColor: Color(0xFFFB8500),
    parentActivity: 'Eat a warm, filling bowl of soup or oatmeal together.',
    classmateActivity: 'Give a friend a big high-five and a hearty laugh.',
    worldActivity: 'Take a deep breath of fresh air on a crisp morning outdoor walk.',
  ),
  DailyWord(
    word: 'INSPIRE',
    phonetic: 'in - SPYR',
    definition: 'To fill someone with the urge or ability to do something creative!',
    emoji: '💡',
    themeColor: Color(0xFF7209B7),
    parentActivity: 'Tell a story about someone heroic or creative you admire.',
    classmateActivity: 'Draw a picture alongside a friend to inspire each other’s ideas.',
    worldActivity: 'Look at a cool building or bridge outside and design your own version on paper.',
  ),
  DailyWord(
    word: 'JOYFUL',
    phonetic: 'JOY - ful',
    definition: 'Feeling, causing, or showing great happiness!',
    emoji: '😃',
    themeColor: Color(0xFFFFD166),
    parentActivity: 'Sing along loudly to your favorite family song in the car or kitchen.',
    classmateActivity: 'Play a game of freeze tag with friends at recess.',
    worldActivity: 'Blow bubble solutions into the breeze and chase them in the park.',
  ),
  DailyWord(
    word: 'KINDRED',
    phonetic: 'KIN - dred',
    definition: 'Similar in spirit, character, or feeling!',
    emoji: '👯',
    themeColor: Color(0xFF06D6A0),
    parentActivity: 'Talk about a favorite hobby you share with a family member.',
    classmateActivity: 'Find a friend who loves the exact same book or toy as you.',
    worldActivity: 'Spot two animals in nature resting or playing together.',
  ),
  DailyWord(
    word: 'LUMINOUS',
    phonetic: 'LOO - muh - nuss',
    definition: 'Full of light, bright, or glowing in the dark!',
    emoji: '🌙',
    themeColor: Color(0xFF118AB2),
    parentActivity: 'Turn off the lights and play with glow sticks or nightlights.',
    classmateActivity: 'Draw a picture using ultra-bright neon markers or highlighters.',
    worldActivity: 'Look up at the moon or fireflies outside at dusk.',
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random _random = Random();

  late DailyWord _current;
  late bool _isWordOfTheDay;

  @override
  void initState() {
    super.initState();
    _current = _wordOfTheDay();
    _isWordOfTheDay = true;
  }

  /// Picks a word deterministically based on today's date, so everyone who
  /// opens the app on the same day sees the same "word of the day," and it
  /// automatically changes tomorrow without any extra code.
  DailyWord _wordOfTheDay() {
    final now = DateTime.now();
    final dayOfYear = int.parse(
      '${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}',
    );
    final index = dayOfYear % wordBank.length;
    return wordBank[index];
  }

  /// Picks a new random word (never repeating the one currently shown).
  void _shuffleWord() {
    if (wordBank.length <= 1) return;
    DailyWord next;
    do {
      next = wordBank[_random.nextInt(wordBank.length)];
    } while (next.word == _current.word);

    setState(() {
      _current = next;
      _isWordOfTheDay = false;
    });
  }

  /// Jumps back to today's official word of the day.
  void _resetToToday() {
    setState(() {
      _current = _wordOfTheDay();
      _isWordOfTheDay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final current = _current;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9EC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('✨ ', style: TextStyle(fontSize: 24)),
            Text(
              'Word Explorer',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2D3142),
              ),
            ),
            Text(' ✨', style: TextStyle(fontSize: 24)),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'New word',
            icon: const Icon(Icons.shuffle_rounded,
                size: 30, color: Color(0xFF2D3142)),
            onPressed: _shuffleWord,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Status label: today's word vs. an explored word
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: (_isWordOfTheDay
                            ? const Color(0xFF06D6A0)
                            : const Color(0xFF9B5DE5))
                        .withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _isWordOfTheDay
                        ? "⭐ TODAY'S WORD"
                        : '🔀 EXPLORING A NEW WORD',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      color: _isWordOfTheDay
                          ? const Color(0xFF04785C)
                          : const Color(0xFF5E2A9E),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Main Word Banner
              Container(
                decoration: BoxDecoration(
                  color: current.themeColor,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: current.themeColor.withValues(alpha: 0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      current.emoji,
                      style: const TextStyle(fontSize: 80),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      current.word,
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                    ),
                    Text(
                      '"${current.phonetic}"',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        current.definition,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // New word / back to today's word controls
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _shuffleWord,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        side: const BorderSide(
                            color: Color(0xFF2D3142), width: 2),
                      ),
                      icon: const Icon(Icons.shuffle_rounded,
                          color: Color(0xFF2D3142)),
                      label: const Text(
                        'New Word',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D3142),
                        ),
                      ),
                    ),
                  ),
                  if (!_isWordOfTheDay) ...[
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: _resetToToday,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: const BorderSide(
                              color: Color(0xFF06D6A0), width: 2),
                        ),
                        icon: const Icon(Icons.star_rounded,
                            color: Color(0xFF04785C)),
                        label: const Text(
                          "Today's Word",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF04785C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Today's Adventures! 🚀",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3142),
                ),
              ),

              const SizedBox(height: 16),

              // Activity 1: Parents
              _buildActivityCard(
                title: 'With Mom & Dad',
                badgeText: 'Home Fun',
                description: current.parentActivity,
                icon: Icons.family_restroom_rounded,
                cardColor: const Color(0xFFFFD166),
                textColor: const Color(0xFF5C4000),
              ),

              const SizedBox(height: 16),

              // Activity 2: Classmates
              _buildActivityCard(
                title: 'With Classmates',
                badgeText: 'School Fun',
                description: current.classmateActivity,
                icon: Icons.groups_rounded,
                cardColor: const Color(0xFF06D6A0),
                textColor: const Color(0xFF004D38),
              ),

              const SizedBox(height: 16),

              // Activity 3: Physical World
              _buildActivityCard(
                title: 'Outside World',
                badgeText: 'Nature Fun',
                description: current.worldActivity,
                icon: Icons.park_rounded,
                cardColor: const Color(0xFF118AB2),
                textColor: Colors.white,
              ),

              const SizedBox(height: 24),

              // Interactive "I Did It!" Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF477E),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 5,
                ),
                onPressed: () {
                  _showCelebrationDialog(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star_rounded, color: Colors.yellow, size: 32),
                    SizedBox(width: 10),
                    Text(
                      'I Used The Word Today!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required String title,
    required String badgeText,
    required String description,
    required IconData icon,
    required Color cardColor,
    required Color textColor,
  }) {
    return Container(
      key: ValueKey('$title-$description'),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white.withValues(alpha: 0.3),
                child: Icon(icon, color: textColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    badgeText.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: textColor.withValues(alpha: 0.7),
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor.withValues(alpha: 0.95),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  void _showCelebrationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        backgroundColor: const Color(0xFFFFF9EC),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🎉🌟⭐', style: TextStyle(fontSize: 50)),
            const SizedBox(height: 12),
            const Text(
              'SUPERSTAR!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: Color(0xFFFF6B6B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'You earned a word badge for practicing today!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF2D3142)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4ECDC4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Keep Exploring!',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
