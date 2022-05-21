import { Client } from "pg";

export const doesUserExist = async (
  userId: number,
  client: Client
): Promise<boolean> => {
  const dbres = await client.query("SELECT * FROM users WHERE user_id = $1", [
    userId,
  ]);
  return dbres.rowCount > 0;
};
