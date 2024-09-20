import CharacterInfo from '../data/characterInfo.js';

export const characterInfoList = {
  inkSans: new CharacterInfo(
    0,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  errorSans: new CharacterInfo(
    1,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  classicSans: new CharacterInfo(
    2,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  fellSans: new CharacterInfo(
    3,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  swapSans: new CharacterInfo(
    4,
    120,
    120,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  swapPapyrus: new CharacterInfo(
    5,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  xChara: new CharacterInfo(
    6,
    60,
    100,
    100,
    15,
    [5, 10, 15],
    [0, 10, 25, 40, 60]
  ),
  cross: new CharacterInfo(
    7,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60],
    10,
    1,
  ),
  crossXEvent: new CharacterInfo(
    7.1,
    120,
    100,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60],
    10,
    1,
  ),
  green: new CharacterInfo(
    8,
    80,
    100,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  dream: new CharacterInfo(
    9,
    120,
    120,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  nightmare: new CharacterInfo(
    10,
    120,
    120,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  papyrus: new CharacterInfo(
    11,
    120,
    120,
    100,
    25,
    [10, 15, 15],
    [0, 10, 25, 40, 60]
  ),
  xAnastasia: new CharacterInfo(
    12,
    90,
    150,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  jevil: new CharacterInfo(
    13,
    120,
    100,
    100,
    30,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  tornado: new CharacterInfo(
    -3,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  )
}

export const characterInfoGetById = (id: number): CharacterInfo => {
  return Object.values(characterInfoList).find((characterInfo) => characterInfo.id === id);
}
