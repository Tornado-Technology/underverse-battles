/**
 * @author https://stackoverflow.com/questions/27936772/how-to-deep-merge-instead-of-shallow-merge
 */
export const isObject = (item: any): boolean => {
  return (item && typeof item === 'object' && !Array.isArray(item));
}

export function mergeDeep(target: object, ...sources: object[]) {
  if (!sources.length) {
    return target;
  }

  const source = sources.shift();

  if (isObject(target) && isObject(source)) {
    for (const key in source) {
      if (isObject(source[key])) {
        if (!target[key]) {
          Object.assign(target, { [key]: {} });
        }
        mergeDeep(target[key], source[key]);
        continue;
      }

      Object.assign(target, { [key]: source[key] });
    }
  }

  return mergeDeep(target, ...sources);
}
