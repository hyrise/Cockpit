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
import { equals } from "./helpers/methods";

export function useDatabaseController(): DatabaseController {
  const databases = ref<Database[]>([]);
  const databasesUpdated = ref(false);
  const databaseService = useDatabaseService();

  updateDatabases();

  eventBus.$on("DATABASE_ADDED", () => {
    databasesUpdated.value = false;
    updateDatabases();
  });

  eventBus.$on("STORAGE_DATA_CHANGED", (data: any) => {
    if (!allDatabasesExist(Object.keys(data))) {
      updateDatabases();
    } else {
      updateDatabaseStorageInformation(data);
    }
  });

  eventBus.$on("CPU_DATA_CHANGED", (data: any) => {
    if (!allDatabasesExist(Object.keys(data))) {
      updateDatabases();
    } else {
      updateDatabaseCPUInformation(data);
    }
  });

  function updateDatabases(): void {
    const updatedDatabases: Database[] = [];
    databaseService.fetchDatabases().then(currentDatabases => {
      databaseService
        .fetchDatabasesCPUInformation()
        .then(databasesWithCPUInformation => {
          databaseService
            .fetchDatabasesStorageInformation()
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

  function updateDatabaseCPUInformation(data: any): void {
    databaseService.getCPUInformation(data).forEach(cpuInfo => {
      const database = getDatabaseById(cpuInfo.id)!;
      if (
        database.systemDetails.mainMemoryCapacity !== cpuInfo.mainMemoryCapacity
      )
        database.systemDetails.mainMemoryCapacity = cpuInfo.mainMemoryCapacity;

      if (database.systemDetails.numberOfCPUs !== cpuInfo.numberOfCPUs)
        database.systemDetails.numberOfCPUs = cpuInfo.numberOfCPUs;
    });
  }

  function updateDatabaseStorageInformation(data: any): void {
    databaseService.getStorageInformation(data).forEach(storageInfo => {
      const database = getDatabaseById(storageInfo.id)!;
      if (
        database.systemDetails.memoryFootprint !== storageInfo.memoryFootprint
      )
        database.systemDetails.memoryFootprint = storageInfo.memoryFootprint;

      if (!equals(database.tables, storageInfo.tables))
        database.tables = storageInfo.tables;
    });
  }

  function allDatabasesExist(currentDatabases: string[]): boolean {
    return currentDatabases.reduce(
      (allDatabasesExist: boolean, database) =>
        allDatabasesExist && Boolean(getDatabaseById(database)),
      true
    );
  }

  return {
    databasesUpdated,
    availableDatabasesById: computed(() =>
      databases.value.map(database => database.id)
    ),
    getDatabasesByIds
  };
}
