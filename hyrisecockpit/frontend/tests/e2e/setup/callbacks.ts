/* declare functions which can be executed, when requests are sent */

export function useCallbacks(
  renewFunction: () => void
): { handleDatabaseCreation: (xhr: any) => void } {
  function handleDatabaseCreation(xhr: any): void {
    renewFunction();
    console.log(xhr, new Date());
  }
  return { handleDatabaseCreation };
}
