/* declare functions which should be executed, before requests are sent */

import { Entity } from "./helpers";

export function useCallbacks(
  addFunction: (entity: Entity, id: string) => void,
  removeFunction: (entity: Entity, id: string) => void,
  renewFunction: () => void
): {
  handleAddDatabase: (id: string) => void;
  handleRemoveDatabase: (id: string) => void;
} {
  // DATABASES
  function handleAddDatabase(id: string): void {
    addFunction("databases", id);
    renewFunction();
  }

  function handleRemoveDatabase(id: string): void {
    removeFunction("databases", id);
    renewFunction();
  }

  return { handleAddDatabase, handleRemoveDatabase };
}
