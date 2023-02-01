# Client Contributing
Here is a guidelines about client code contributions, for translations see [Translate](TRANSLATING.md).
This article is about the client. For server contributions see [Contributing-Server](CONTRIBUTING-SERVER.md)

## Basic Guidelines

### Use an IDE.
GameMaker Studio 2 with same version declared in the `client/UnderverseBattles.yyp`. 
Also, you can use GMEdit without its new features.

### Always test your changes.
Do not submit something without at least running the game to see if it compiles.  
If you are submitting a new block, make sure it has a name and description, and that it works correctly in-game. If you are changing existing block mechanics, test them out first. Do not use methods that do not work or conflict with different platforms, and if necessary, use the operating system constants `is_desktop`, `is_mobile`, `is_html`.

### Do not make formatting changes.
Yes, there are spaces, extra new lines, blank indents, and other minor errors.
If you implement Pull Request with *actual code* changes,
feel free to fix the formatting in the immediate vicinity of your changes,
but please don't waste everyone's time with meaningless changes.

### Say yes to JSDocs
When declaring function specify its return and input values via [JSDocs](https://manual.yoyogames.com/The_Asset_Editors/Code_Editor_Properties/JSDoc_Script_Comments.htm),
example argument1: `/// @param {Real} argumnet1`.<br>
Don't leave bare functions, they are very long to deal with later, comment parameters or add description to functions if needed.

### Name things correctly
Never abbreviate, write the titles in full.
It is not convenient and informative when your player instance variable is called `plr`, in which case it should be called `player_instance`.
And it's important to remember that any asset is a noun as well as variables, but methods are verbs,
and all events start with `on` Try not to forget about the importance of good naming of methods and other content.

### Do not make large changes before discussing them first.
If you are interested in adding a major mechanic/feature or changing a large amount of code,
contact me (TornadoTech) first via [Discord](https://discord.gg/2Nuas5NKj8).
For most changes, this is not necessary.
I just want to know if you're doing something big,
so I can offer advice and/or make sure you're not wasting your time on it.

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
- They are converted to `.ogg`.
- You've compressed them as much as possible without losing any quality
- You have set them to the correct audio group
- You have set the default settings for this group (See table below)

| Audio group | Conversion | Attributes     | Output | Sample Rate | Quality | BitRate |
|-------------|------------|----------------|--------|-------------|---------|---------|
| sound       | Reqired    | Compressed(NS) | Mono   | 32000       | 8 bit   | 64      |
| music       | Reqired    | Compressed(NS) | Stereo | 44100       | 16 bit  | 128     |
| menu_music  | Reqired    | Compressed(NS) | Stereo | 44100       | 16 bit  | 128     |

### Follow the code formatting guidelines.
This means:
- Spaces around parentheses: `if (condition) {`, `var string = object.to_string()`
- Same-line braces.
- 4 spaces indentation
- Use `snake_case` for all names, except `constructor` functions. Constructors are called `PascalCase`.
- Do not use braceless `if/else` statements. `if (condition) statement else statement2` should **never** be done.
- In very specific situations, having braceless if-statements on one line is allowed: `if (condition) return;` would be valid.

### Use game solutions when possible.
Instead of using `DsList`, `DsMap`, `DsGrid` collections.<br>
Use `struct`, `array`, `constructor` and other equivalents form `scripts`.
- `DsMap` -> `Struct`
- `DsList` -> `Array<T>`
- `DsGrid` -> `Array<Array<T>>`
