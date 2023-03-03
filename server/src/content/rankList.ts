import Rank from '../data/rank.js';

export const rankList = {
  not: new Rank(0, 14, 2),
  newcomer: new Rank(15, 34, 4),
  candidate: new Rank(35, 69, 6),
  warrior: new Rank(70, 99, 8),
  royalGuard: new Rank(100, 139, 10),
  royalOfficer: new Rank(140, 189, 12),
  veteran: new Rank(190, 249, 14),
  king: new Rank(250, 344, 16),
  godOfHyperDeath: new Rank(335, Infinity, 18),
};

export const getRank = (rating: number): Rank => {
  return Object.values(rankList).find((rank) => rank.belongs(rating));
}
