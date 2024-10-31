import Rank from '../data/rank.js';

export const rankList = {
  not: new Rank(-Infinity, 14, 4, 0),
  newcomer: new Rank(15, 34, 6, 2),
  candidate: new Rank(35, 69, 8, 4),
  warrior: new Rank(70, 99, 10, 6),
  royalGuard: new Rank(100, 139, 12, 8),
  royalOfficer: new Rank(140, 189, 14, 10),
  veteran: new Rank(190, 249, 16, 12),
  king: new Rank(250, 334, 18, 14),
  godOfHyperDeath: new Rank(335, Infinity, 20, 16),
};

export const getRank = (rating: number): Rank => {
  return Object.values(rankList).find((rank) => rank.belongs(rating));
}
