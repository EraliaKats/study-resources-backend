import { Client } from "pg";

export async function getResourceVotes(client: Client, resourceId: number) {
  const votesTrueRes = await client.query(
    `
    SELECT *
    FROM votes
    WHERE resource_id = $1 AND is_upvote = true;`,
    [resourceId]
  );

  const votesFalseRes = await client.query(
    `
    SELECT *
    FROM votes
    WHERE resource_id = $1 AND is_upvote = false;`,
    [resourceId]
  );

  const totalVote = votesTrueRes.rowCount - votesFalseRes.rowCount;
  return {
    upVotes: votesTrueRes.rowCount,
    downVotes: votesFalseRes.rowCount,
    totalVotes: totalVote,
  };
}
