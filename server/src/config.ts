// @ts-ignore
import { fileURLToPath } from 'url';
import { readFileSync, existsSync } from 'fs';
import minimist from 'minimist';
import { dirname } from 'path';
import { mergeDeep } from './util/deepMerge.js';
import App from './app.js';

const args = minimist(process.argv.slice(2));
const environment = args.env || 'development';

const versionsPath = `${dirname(fileURLToPath(import.meta.url))}/../versions.json`;
if (!existsSync(versionsPath)) {
  throw new Error(`File versions.json not found!`);
}

export const versions = JSON.parse(readFileSync(versionsPath).toString());

const commonConfig = {
  environment: 'common',
  meta: {
    name: 'UnderverseBattles server',
    description: 'The server for UnderverseBattles',
    version: 'v2.0.11',
    type: 'common',
    tags: [],
  },
  main: {
    ip: '127.0.0.1',
    port: '1337',
  },
  client: {
    // Requires logging into an account to work with the server
    necessaryLogin: true,
    pingInterval: 3000,
    verification: {
      enabled: false,
      timeout: 3000,
    },
  },
  database: {
    enabled: true,
    address: 'mongodb://127.0.0.1:27017/main',
  },
}

const productionConfig = {
  environment: 'common',
  meta: {
    name: 'UnderverseBattles server official',
    description: 'The official, always maintained server of the developers of UnderverseBattles',
    version: 'v2.0.11',
    type: 'production',
    tags: [
      'latest',
      'official',
      'stable',
    ],
  },
  main: {
    port: '1338',
  },
}

const developmentConfig = {
  environment: 'development',
  meta: {
    name: 'UnderverseBattles server for developers',
    description: 'The server is for testing the game, be careful, he-he!',
    version: 'v2.0.11',
    type: 'development',
    tags: [
      'development',
      'official',
      'unstable',
    ],
  },
  main: {
    port: '1337',
  },
  client: {
    verification: {
      enabled: false,
    }
  },
  database: {
    address: 'mongodb://127.0.0.1:27017/development',
  },
}

export type config = typeof commonConfig & typeof productionConfig & typeof developmentConfig;

// The place where you must register your custom config
const configs = [
  productionConfig,
  developmentConfig
];

const config: config = {...commonConfig};
const assignConfig = configs.find((conf) => conf.environment === environment);
if (!assignConfig) {
  throw new Error(`Config ${environment} doesn't exist`);
}

mergeDeep(config, assignConfig);
App.applyConfig(config);
