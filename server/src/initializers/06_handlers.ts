import { readdirSync } from 'fs';
import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

const path = `${__dirname}/../packet/handlers`;

for (const file of readdirSync(path)) {
  if (!file.endsWith('.js'))
    continue;

  await import(`file://${path}/${file}`);
}