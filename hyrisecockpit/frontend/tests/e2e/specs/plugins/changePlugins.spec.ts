import { useBackendMock } from '../../setup/backendMock';
import { clickElement } from '../helpers';
import { getGetAlias, getPostAlias, getDeleteAlias } from '../../setup/helpers';
import { getSelector as getViewSelector } from '../views/helpers';
import { getSelector as getDatabaseSelector } from '../databases/helpers';
import {
  getSelector,
  assertCorrectActivePlugins,
  assertCorrectPlugins,
  assertCorrectPluginLog,
  assertCorrectPluginSettings,
  assertRequestValues,
} from './helpers';
import { testElementNoExistence } from '../abstractTests';

let backend = useBackendMock({ plugins: 3 });

let databases: any = [];
let availablePlugins: any = [];
let databasesActivePlugins: any = [];
let databasesPluginLogs: any = [];
let databasesPluginSettings: any = [];

describe('When observing the plugins overview', () => {
  beforeEach(() => {
    backend.start();
    cy.visit('/');
    cy.wait('@' + getGetAlias('database'));
    cy.get('@' + getGetAlias('database')).should((xhr: any) => {
      databases = xhr.response.body;
    });
    cy.wait('@' + getGetAlias('available_plugins'));
    cy.get('@' + getGetAlias('available_plugins')).should((xhr: any) => {
      availablePlugins = xhr.response.body;
    });
    cy.wait('@' + getGetAlias('plugin'));
    cy.get('@' + getGetAlias('plugin')).should((xhr: any) => {
      databasesActivePlugins = xhr.response.body;
    });
    cy.wait('@' + getGetAlias('plugin_log'));
    cy.get('@' + getGetAlias('plugin_log')).should((xhr: any) => {
      databasesPluginLogs = xhr.response.body;
    });
    cy.wait('@' + getGetAlias('plugin_settings'));
    cy.get('@' + getGetAlias('plugin_settings')).should((xhr: any) => {
      databasesPluginSettings = xhr.response.body.body.plugin_settings;
    });
  });

  // test activate plugin
  describe('and activate a new plugin', () => {
    it('will show this plugin as activated', () => {
      clickElement(getViewSelector('pluginOverviewButton'));

      cy.get(getSelector('pluginOverview')).within(() => {
        databases.forEach((database: any, idx: number) => {
          const deactivePlugins = availablePlugins.reduce(
            (deactivePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id,
              );
              if (!pluginData.plugins.includes(plugin)) {
                deactivePlugins.push({ plugin: plugin, idx: idx });
              }
              return deactivePlugins;
            },
            [],
          );

          backend.reload('plugin', deactivePlugins[0].plugin, 'POST');

          cy.get('button')
            .eq(idx + 1)
            .click();
          cy.get('input[type=checkbox]')
            .eq(deactivePlugins[0].idx)
            .check({ force: true });

          cy.wait('@' + getPostAlias('plugin'));
          cy.get('@' + getPostAlias('plugin')).should((xhr: any) => {
            assertRequestValues(
              database.id,
              deactivePlugins[0].plugin,
              xhr.request.body,
            );
          });
          cy.numberOfRequests(getPostAlias('plugin')).should('eq', 1);
          cy.wait('@' + getGetAlias('plugin'));
          cy.get('@' + getGetAlias('plugin')).should((xhr: any) => {
            databasesActivePlugins = xhr.response.body;
            assertCorrectActivePlugins(
              database.id,
              availablePlugins,
              databasesActivePlugins,
            );
          });
          cy.get('button')
            .eq(idx + 1)
            .click();
          backend.reload('plugin', deactivePlugins[0].plugin, 'DELETE');
        });
      });
    });
  });
  // test deactivate plugin
  describe('and deactivate a new plugin', () => {
    it('will show this plugin as deactivated', () => {
      clickElement(getViewSelector('pluginOverviewButton'));

      cy.get(getSelector('pluginOverview')).within(() => {
        databases.forEach((database: any, idx: number) => {
          const activePlugins = availablePlugins.reduce(
            (activePlugins: Object[], plugin: any, idx: number) => {
              const pluginData = databasesActivePlugins.find(
                (db: any) => db.id === database.id,
              );
              if (pluginData.plugins.includes(plugin)) {
                activePlugins.push({ plugin: plugin, idx: idx });
              }
              return activePlugins;
            },
            [],
          );

          backend.reload('plugin', activePlugins[0].plugin, 'DELETE');

          cy.get('button')
            .eq(idx + 1)
            .click();
          cy.get('input[type=checkbox]')
            .eq(activePlugins[0].idx)
            .uncheck({ force: true });

          cy.wait('@' + getDeleteAlias('plugin'));
          cy.get('@' + getDeleteAlias('plugin')).should((xhr: any) => {
            assertRequestValues(
              database.id,
              activePlugins[0].plugin,
              xhr.request.body,
            );
          });
          cy.numberOfRequests(getDeleteAlias('plugin')).should('eq', 1);
          cy.wait('@' + getGetAlias('plugin'));
          cy.get('@' + getGetAlias('plugin')).should((xhr: any) => {
            databasesActivePlugins = xhr.response.body;
            assertCorrectActivePlugins(
              database.id,
              availablePlugins,
              databasesActivePlugins,
            );
          });
          cy.get('button')
            .eq(idx + 1)
            .click();
          backend.reload('plugin', activePlugins[0].plugin, 'POST');
        });
      });
    });
  });
});
