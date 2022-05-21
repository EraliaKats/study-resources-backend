import { Client } from "pg";

export const doesResourceExist = async (
  resource_id: number,
  client: Client
): Promise<boolean> => {
  const dbres = await client.query(
    "SELECT * FROM resources WHERE resource_id = $1",
    [resource_id]
  );

  return dbres.rowCount > 0;
};
