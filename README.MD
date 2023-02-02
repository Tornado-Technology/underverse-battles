![Logo](header.png)
[![Discord](https://img.shields.io/discord/790467429792481280.svg?logo=discord&logoColor=white&logoWidth=20&labelColor=7289DA&label=Discord&color=17cf48)](https://discord.gg/2Nuas5NKj8)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

### What is this?
Underverse Battles© — MMO BulletHell game based on Undertale, made with GameMaker Studio 2 and NodeJS(TypeScript)

## Building
All stable versions are available for download at [Releases](https://github.com/UnderverseBattles/underverse-battles/releases)

### Client - Android or Windows x64
- Download GameMaker Studio 2
- Open `client/UnderverseBattles.yyp`
- Set project config (`development` for testing or `Default` for release)
- Run compilation `f5`

### Server
- Download NodeJS 16+
- Open `server` folder
- Install dependencies `npm install`
- Compile project `npm run build`
- Run server (`npm run development` for testing or `npm run production` for release)