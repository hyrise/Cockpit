/* declare functions which should be executed, before requests are sent */

import { Entity, DatabaseState } from "./helpers";

export function useCallbacks(
  addFunction: (entity: Entity, id: string) => void,
  removeFunction: (entity: Entity, id: string) => void,
  changeFunction: (state: DatabaseState, value: boolean) => void,
  renewFunction: () => void
): {
  addDatabase: (id: string) => void;
  removeDatabase: (id: string) => void;
  activatePlugin: (id: string) => void;
  deactivatePlugin: (id: string) => void;
  startWorkload: () => void;
  stopWorkload: () => void;
  loadTable: (id: string) => void;
  removeTable: (id: string) => void;
} {
  // DATABASES
  function addDatabase(id: string): void {
    addFunction("databases", id);
    renewFunction();
  }

  function removeDatabase(id: string): void {
    removeFunction("databases", id);
    renewFunction();
  }

  // PLUGINS
  function activatePlugin(id: string): void {
    addFunction("activated_plugins", id);
    renewFunction();
  }

  function deactivatePlugin(id: string): void {
    removeFunction("activated_plugins", id);
    renewFunction();
  }

  // WORKLOADS
  function startWorkload(): void {
    changeFunction("workloadRunning", true);
    renewFunction();
  }

  function stopWorkload(): void {
    changeFunction("workloadRunning", false);
    renewFunction();
  }

  function loadTable(id: string): void {
    addFunction("loaded_benchmarks", id);
    renewFunction();
  }

  function removeTable(id: string): void {
    removeFunction("loaded_benchmarks", id);
    renewFunction();
  }

  return {
    addDatabase,
    removeDatabase,
    activatePlugin,
    deactivatePlugin,
    startWorkload,
    stopWorkload,
    loadTable,
    removeTable
  };
}
