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
    100,
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
  xtaleChara: new CharacterInfo(
    6,
    60,
    100,
    100,
    15,
    [5, 10, 50],
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
    4,
    1,
    [
      new CharacterInfo(
        7,
        120,
        100,
        100,
        20,
        [10, 15, 20],
        [0, 10, 25, 40, 60],
        4,
        1,
      )
    ]
  ),
  green: new CharacterInfo(
    8,
    60,
    100,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  jevil: new CharacterInfo(
    -1,
    100,
    100,
    100,
    20,
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