import { eventBus } from "./plugins/eventBus";
import { DatabaseController, Database } from "./types/database";
import { useDatabaseService } from "./services/databaseService";
import { ref } from "@vue/composition-api";

export function useDatabaseController(): DatabaseController {
  let databases: Record<string, Database> = {}; // TODO: use array???
  let databasesUpdated = ref(false);
  const databaseService = useDatabaseService();

  eventBus.$on("DATABASE_ADDED", () => {
    updateDatabases();
  });

  updateDatabases();

  function updateDatabases(): void {
    databaseService.getDatabases().then(currentDatabases => {
      databaseService
        .getDatabasesCPUInformation()
        .then(databasesWithCPUInformation => {
          databaseService
            .getDatabasesStorageInformation()
            .then(databasesWithStorageInformation => {
              currentDatabases.forEach(databaseObject => {
                if (!getDatabaseById(databaseObject.id)) {
                  databases[databaseObject.id] = getDatabaseInformation(
                    databaseObject,
                    databasesWithCPUInformation,
                    databasesWithStorageInformation
                  );
                }
              });
            });
        });
      databasesUpdated.value = true;
    });
  }

  function getDatabaseInformation(
    database: any,
    databasesCPUInformation: any[],
    databasesStorageInformation: any[]
  ): Database {
    const cpuInformation = databasesCPUInformation.find(
      object => object.id === database.id
    );
    const storageInformation = databasesStorageInformation.find(
      object => object.id === database.id
    );

    return {
      id: database.id,
      color: databaseService.setDatabaseColor(),
      systemDetails: {
        host: database.host,
        mainMemoryCapacity: cpuInformation.mainMemoryCapacity,
        memoryFootprint: storageInformation.memoryFootprint,
        numberOfCPUs: cpuInformation.numberOfCPUs,
        numberOfWorkers: database.numberOfWorkers
      },
      tables: storageInformation.tables
    };
  }

  function getDatabaseById(id: string): Database | undefined {
    return databases[id];
  }

  return { databases, databasesUpdated };
}
