import { eventBus } from "./plugins/eventBus";
import {
  DatabaseController,
  Database,
  DatabaseCPUResponse,
  DatabaseStorageResponse,
  DatabaseResponse
} from "./types/database";
import { useDatabaseService } from "./services/databaseService";
import { ref, reactive, computed } from "@vue/composition-api";

export function useDatabaseController(): DatabaseController {
  const databases = ref<Database[]>([]);
  const databasesUpdated = ref(false);
  const databaseService = useDatabaseService();

  eventBus.$on("DATABASE_ADDED", () => {
    databasesUpdated.value = false;
    updateDatabases();
  });

  updateDatabases();

  function updateDatabases(): void {
    const updatedDatabases: Database[] = [];
    databaseService.getDatabases().then(currentDatabases => {
      databaseService
        .getDatabasesCPUInformation()
        .then(databasesWithCPUInformation => {
          databaseService
            .getDatabasesStorageInformation()
            .then(databasesWithStorageInformation => {
              currentDatabases.forEach(database => {
                updatedDatabases.push(
                  getDatabaseInformation(
                    database,
                    databasesWithCPUInformation,
                    databasesWithStorageInformation
                  )
                );
              });
              databases.value = updatedDatabases;
              databasesUpdated.value = true;
            });
        });
    });
  }

  function getDatabaseInformation(
    database: DatabaseResponse,
    databasesCPUInformation: DatabaseCPUResponse[],
    databasesStorageInformation: DatabaseStorageResponse[]
  ): Database {
    const cpuInformation = databasesCPUInformation.find(
      object => object.id === database.id
    );
    const storageInformation = databasesStorageInformation.find(
      object => object.id === database.id
    );
    return reactive({
      id: database.id,
      color: databaseService.getDatabaseColor(),
      systemDetails: {
        host: database.host,
        mainMemoryCapacity: cpuInformation!.mainMemoryCapacity,
        memoryFootprint: storageInformation!.memoryFootprint,
        numberOfCPUs: cpuInformation!.numberOfCPUs,
        numberOfWorkers: database.numberOfWorkers
      },
      tables: storageInformation!.tables
    } as Database);
  }

  function getDatabaseById(id: string): Database | undefined {
    return databases.value.find(database => database.id === id);
  }

  function getDatabasesByIds(ids: string[]): Database[] {
    return ids.reduce((availableDatabases, id) => {
      availableDatabases.push(getDatabaseById(id)!);
      return availableDatabases;
    }, [] as Database[]);
  }

  return {
    databasesUpdated,
    availableDatabasesById: computed(() =>
      databases.value.map(database => database.id)
    ),
    getDatabasesByIds
  };
}
