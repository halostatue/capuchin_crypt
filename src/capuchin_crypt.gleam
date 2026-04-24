//// An in-memory persistent cache for Gleam. Expensive to update, cheap to
//// read. If you think you need this, think again — you probably don't.

/// Erase the value referenced by `key`.
///
/// Returns `True` if there was a value, `False` otherwise.
@external(erlang, "capuchin_crypt_ffi", "crypt_erase")
@external(javascript, "./capuchin_crypt_ffi.mjs", "crypt_erase")
pub fn erase(key: String) -> Bool

/// Retrieve the value referenced by `key`.
@external(erlang, "capuchin_crypt_ffi", "crypt_get")
@external(javascript, "./capuchin_crypt_ffi.mjs", "crypt_get")
pub fn get(key: String) -> Result(a, Nil)

/// Retrieve the value referenced by `key` or `default` if not present.
pub fn get_default(key key: String, or default: a) -> a {
  case get(key) {
    Ok(a) -> a
    Error(Nil) -> default
  }
}

/// Stores the `value` as referenced by `key`.
///
/// This returns the stored value.
@external(erlang, "capuchin_crypt_ffi", "crypt_put")
@external(javascript, "./capuchin_crypt_ffi.mjs", "crypt_put")
pub fn put(key: String, value: a) -> a

/// Stores the `value` as referenced by `key` only if no value is already
/// present.
///
/// This returns the stored value.
pub fn put_new(key: String, value: a) -> Result(a, a) {
  case get(key) {
    Ok(existing) -> Error(existing)
    Error(Nil) -> Ok(put(key, value))
  }
}
