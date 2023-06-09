import  { getRank, rankList } from '../content/rankList.js';
import { expect } from 'chai';
import Rank from '../data/rank.js';
import 'mocha';

describe('Rank', () => {
  describe('Class', () => {
    it('Should return true', () => {
      const rank = new Rank(0, 10, 1);
      expect(rank.belongs(10)).to.be.true;
      expect(rank.belongs(0)).to.be.true;
    });

    it('Should return false', () => {
      const rank = new Rank(0, 10, 1);
      expect(rank.belongs(-1)).to.be.false;
      expect(rank.belongs(11)).to.be.false;
    });

    it('Testing Infinity values', () => {
      const rank = new Rank(68, Infinity, 1);
      expect(rank.belongs(Infinity)).to.be.true;
      expect(rank.belongs(128)).to.be.true;
    });

    it('Testing clamp', () => {
      const rank = new Rank(68, 128, 5);
      expect(rank.clamp(10, 10)).to.be.equals(10);
      expect(rank.clamp(69, 12)).to.be.equals(5);
    });
  });

  describe('Rank List', () => {
    it('Testing detecting', () => {
      expect(getRank(-1)).to.be.equals(undefined);
      expect(getRank(0)).to.be.equals(rankList.not);
      expect(getRank(14)).to.be.equals(rankList.not);
      expect(getRank(360)).to.be.equals(rankList.godOfHyperDeath);
    });

    it('Testing detecting + clamping', () => {
      expect(getRank(0).clamp(0, 10)).to.be.equals(2);
      expect(getRank(14).clamp(14, 54)).to.be.equals(2);
      expect(getRank(360).clamp(360, 102)).to.be.equals(18);
    });
  });
});