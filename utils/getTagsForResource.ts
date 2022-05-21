import { Client } from "pg";

export async function getTagsForResource(client: Client, resourceId: number) {
  const tagsForRes = await client.query(
    `
    SELECT tag_assignments.tag_id, tags.name as tag_name
    FROM tag_assignments 
    JOIN tags ON tags.tag_id = tag_assignments.tag_id
    JOIN resources ON tag_assignments.resource_id = resources.resource_id
    WHERE tag_assignments.resource_id = $1`,
    [resourceId]
  );

  return tagsForRes.rows;
}
