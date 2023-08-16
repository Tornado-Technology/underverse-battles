# Client Contributing
These are the guidelines on client code contributions.<br>
For translations see [Translate](TRANSLATING.md).<br>
For server contributions see [Contributing to Server](CONTRIBUTING-SERVER.md)

## Basic Guidelines

### Use an IDE.
GameMaker Studio 2's version must be as stated in the `client/UnderverseBattles.yyp` file.
Alternatively, if you use [GMEdit](https://yellowafterlife.itch.io/gmedit), do not use these [features](https://github.com/YellowAfterlife/GMEdit/wiki).

### Always test your changes.
Do not submit your changes without at least running the game once to check if it compiles and works correctly in-game.
When you submit new commits or pull requests (PR), make sure it has a name and description. When you are changing existing block mechanics, test them out first. Do not use methods that would conflict or not work with different platforms, and if necessary, use the operating system constants `is_desktop`, `is_mobile`, `is_html`.

### Do not make formatting changes.
Yes, there are occurrences of trailing spaces, extra new lines, blank indents, and other minor errors.
If you implement PR with *actual code* changes,
feel free to fix the formatting in the immediate vicinity of your changes,
but please don't waste everyone's time with meaningless changes.

### Say yes to JSDocs.
When declaring a function specify its return and input values via [JSDocs](https://manual.yoyogames.com/The_Asset_Editors/Code_Editor_Properties/JSDoc_Script_Comments.htm),
example argument1: `/// @param {Real} argumnet1`.<br>
Don't leave bare functions, they are very long to deal with later. Comment parameters and add description to functions when needed.

### Name things correctly.
Never abbreviate the names of variables and functions, except for the use of recognized acronyms and abbreviations (GUI, IP, TCP, info, config). Write the names in full.
It is not convenient and informative when your player instance variable is called `plr`, in which case it should be called `player_instance`.
It's important to remember that any asset name is a noun as well as variables and constructors. Function, method and event names are verbs,
wherein event names start with `on`. Do not forget the importance of good naming of any content.

### Do not make large changes before discussing them first.
If you are interested in adding a major mechanic/feature or changing a large amount of code,
contact me (TornadoTech) first via [Discord](https://discord.gg/2Nuas5NKj8).
This is not necessary for most changes.
I should know if you're going to make something major and important, so I can give advice and make sure you don't waste your time.

## Style Guidelines

### Assets formatting guidelines.
Name the Assets correctly, with nouns (or verbs in the case of scripts) and use the prefixes from the table below according to type.
Do not use or add assets such as: `Sequence`, `Path`, `Timeline`. They are too uncomfortable to handle and there is a replacement for all of them such as `cutscene_create`.

| Assets Name      |  Prefix  | Folder           |
|------------------|:--------:|------------------|
| GMScript         | **----** | Scripts          |
| GMSprite         |   spr    | Sprites          |
| GMObject         |   obj    | Objects          |
| GMSound          | snd, sfx | Sounds           |
| GMShader         |   shd    | Shaders          |
| GMRoom           |   room   | Rooms            |
| GMFont           |   font   | Fonts            |
| GMAnimationCurve |   anim   | Animation Curves |
| DLL              | **----** | Extensions       |

### Audio formatting guidelines.
When adding sound files, make sure:
- They are converted to `.ogg`
- You've compressed the files without losing any quality
- You've set them to the correct audio group
- You've set the default settings for this group (See table below)

| Audio group | Conversion | Attributes     | Output | Sample Rate | Quality | BitRate |
|-------------|------------|----------------|--------|-------------|---------|---------|
| sound       | Reqired    | Compressed(NS) | Mono   | 32000       | 8 bit   | 64      |
| music       | Reqired    | Compressed(NS) | Stereo | 44100       | 16 bit  | 128     |
| menu_music  | Reqired    | Compressed(NS) | Stereo | 44100       | 16 bit  | 128     |

### Follow the code formatting guidelines.
This means:
- Spaces around parentheses: `if (condition) {`, `var string = object.to_string();`
- Write `;` at the end of lines
- Do not use `and`, `or`, `not`. Instead use `&&`, `||`, `!` respectively.
- Same-line braces
- 4 spaces indentation
- Use `snake_case` for all names, except `constructor` functions. Constructors are called `PascalCase`
- Do not use braceless `if/else` statements. `if (condition) statement else statement2` should **never** be done
- In very specific situations, having braceless if-statements on one line is allowed: `if (condition) return;` would be valid

### Use game solutions if possible.
Instead of using `DsList`, `DsMap`, `DsGrid` collections.<br>
Use `struct`, `array`, `constructor` and other equivalents form `scripts`.
- `DsMap` -> `Struct`
- `DsList` -> `Array<T>`
- `DsGrid` -> `Array<Array<T>>`