import CharacterInfo from '../../data/characterInfo.js';

const characterInfoList = {
  InkSans: new CharacterInfo(
    0,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  ErrorSans: new CharacterInfo(
    1,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  ClassicSans: new CharacterInfo(
    2,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  FellSans: new CharacterInfo(
    3,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  SwapSans: new CharacterInfo(
    4,
    120,
    100,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  SwapPapyrus: new CharacterInfo(
    5,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  XTaleChara: new CharacterInfo(
    6,
    60,
    100,
    100,
    15,
    [5, 10, 50],
    [0, 10, 25, 40, 60]
  ),
  Cross: new CharacterInfo(
    7,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60],
    [
      new CharacterInfo(
        7,
        120,
        100,
        100,
        20,
        [10, 15, 20],
        [0, 10, 25, 40, 60]
      )
    ]
  ),
  Green: new CharacterInfo(
    8,
    60,
    100,
    100,
    25,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  Jevil: new CharacterInfo(
    -1,
    100,
    100,
    100,
    20,
    [10, 15, 20],
    [0, 10, 25, 40, 60]
  ),
  Tornado: new CharacterInfo(
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