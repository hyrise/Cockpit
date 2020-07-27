import {
  Entity,
  getNumberOfEntities,
  getRequestRoute,
  Request,
} from "../../tests/e2e/setup/helpers";

import { Express } from "express";
import { useMocks } from "../../tests/e2e/setup/mocks";

export function useMocking(
  server: Express,
  numbers: Partial<Record<Entity, number>>
): {
  callActions: (req: { body: Record<string, any> }) => void;
  mockGetRoute: (request: Request, withBody?: boolean) => void;
  mockPostRoute: (request: Request) => void;
  mockDeleteRoute: (request: Request) => void;
  mockPutRoute: (request: Request) => void;
  resetMocks: (newNumbers: Partial<Record<Entity, number>>) => void;
} {
  let mocks = useMocks(getNumberOfEntities(numbers));

  function mockGetRoute(request: Request, withBody = false): void {
    server.get(getRequestRoute(request, "get"), (req, res) => {
      logRequest(req, res);
      const response = mocks.getMockedResponse(request);
      res.send(withBody ? { body: response } : response);
    });
  }

  function mockPostRoute(request: Request): void {
    server.post(getRequestRoute(request, "post"), (req, res) => {
      logRequest(req, res);
      const callback = mocks.getMockedPostCallback(request);
      const id = getIdOfRequest(request, req);
      if (callback && id) callback(id);
      res.send({});
    });
  }

  function mockDeleteRoute(request: Request): void {
    server.delete(getRequestRoute(request, "delete"), (req, res) => {
      logRequest(req, res);
      const callback = mocks.getMockedDeleteCallback(request);
      const id = getIdOfRequest(request, req, true);
      if (callback && id) callback(id);
      res.send({});
    });
  }

  function mockPutRoute(request: Request): void {
    server.put(getRequestRoute(request, "put"), (req, res) => {
      logRequest(req, res);
      const response = mocks.getMockedResponse(request);
      res.send(response);
    });
  }

  function callActions(req: { body: Record<string, any> }): void {
    if (req.body.method === "POST")
      mocks.getMockedPostCallback(req.body.request)(req.body.id);
    if (req.body.method === "DELETE")
      mocks.getMockedDeleteCallback(req.body.request)(req.body.id);
  }

  function resetMocks(newNumbers: Partial<Record<Entity, number>>): void {
    mocks = useMocks(getNumberOfEntities(newNumbers));
  }

  return {
    callActions,
    mockGetRoute,
    mockPostRoute,
    mockDeleteRoute,
    mockPutRoute,
    resetMocks,
  };
}

const requestToId: Partial<Record<
  Request,
  { id: string; idInUrl?: boolean }
>> = {
  database: { id: "id" },
  benchmark_tables: { id: "folder_name" },
  plugin: { id: "name" },
  workload: { id: "folder_name", idInUrl: true },
};

/** Map request data to entity ID */
function getIdOfRequest(
  request: Request,
  data: { body: Record<string, any>; url: string },
  idInUrl = false
): string | null {
  const id = requestToId[request];
  if (!id) return null;
  if (idInUrl && id.idInUrl) {
    /* id is integrated in url at last position */
    const splittedUrl = data.url.split("/");
    return splittedUrl[splittedUrl.length - 1];
  }
  return data.body[id.id];
}

/** Log request to console */
function logRequest(req, res): void {
  if (!process.env.QUIET) {
    console.log(
      `${new Date().toLocaleTimeString()} - ${req.method} - ${
        res.statusCode
      } - ${req.url}`
    );
  }
}
