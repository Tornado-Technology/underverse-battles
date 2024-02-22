import Logger from "../../util/logging.js";
import { Account } from "./account.js";
import { Profile } from "./profile.js";

export default class ProfileStatistic {
    static async getRatingLeaderboard(count: number = 10): Promise<Object> {
        const leadersId = await Profile.find({}).sort({rating : -1}).limit(count).exec();

        if (!leadersId) {
            Logger.error("Database error in profile by using rating leaderboard");
            return {};
        }

        let leaderboard = {};
        for (let i = 0; i < leadersId.length; i++) {
            const account = await Account.findById(leadersId[i].accountId).exec();

            let nickname = `*Unknown ${i + 1}`;
            if (!account) {
                Logger.error("Database error in account by using rating leaderboard");
            } else {
                nickname = account.nickname;
            }

            leaderboard[nickname] = leadersId[i].rating;
        }
        return leaderboard;
    }
}