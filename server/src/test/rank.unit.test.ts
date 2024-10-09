import  { getRank, rankList } from '../content/rankList.js';
import { expect } from 'chai';
import Rank from '../data/rank.js';
import 'mocha';

describe('Rank', () => {
  describe('Class', () => {
    it('Should return true', () => {
      const rank = new Rank(0, 14, 10, 1);
      expect(rank.belongs(10)).true;
      expect(rank.belongs(0)).true;
    });

    it('Should return false', () => {
      const rank = new Rank(0, 14, 4, 0);
      expect(rank.belongs(-1)).false;
      expect(rank.belongs(11)).false;
    });

    it('Testing Infinity values', () => {
      const rank = new Rank(68, Infinity, 10, 1);
      expect(rank.belongs(Infinity)).true;
      expect(rank.belongs(128)).true;
    });

    it('Testing min', () => {
      const rank = new Rank(68, 128, 10, 5);
      expect(rank.min(10)).equals(10);
      expect(rank.min(12)).equals(5);
    });
  });

  describe('Rank List', () => {
    it('Testing detecting', () => {
      expect(getRank(-1)).equals(undefined);
      expect(getRank(0)).equals(rankList.not);
      expect(getRank(14)).equals(rankList.not);
      expect(getRank(360)).equals(rankList.godOfHyperDeath);
    });

    it('Testing detecting + clamping', () => {
      expect(getRank(0).min(10)).equals(2);
      expect(getRank(14).min(54)).equals(2);
      expect(getRank(360).min(102)).equals(18);
    });
  });
});