import { Result$Error, Result$Ok } from "./gleam.mjs";

const crypt = new Map();

export function crypt_erase(key) {
  if (crypt.has(key)) {
    crypt.delete(key);
    return true;
  }

  return false;
}

export function crypt_get(key) {
  if (crypt.has(key)) {
    return Result$Ok(crypt.get(key));
  }

  return Result$Error(undefined);
}

export function crypt_put(key, value) {
  crypt.set(key, value);
  return value;
}
