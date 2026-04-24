import capuchin_crypt
import gleeunit

pub fn main() {
  gleeunit.main()
}

pub fn put_and_get_test() {
  assert 42 == capuchin_crypt.put("test:put", 42)
  assert Ok(42) == capuchin_crypt.get("test:put")
}

pub fn get_missing_key_test() {
  assert Error(Nil) == capuchin_crypt.get("test:missing")
}

pub fn get_default_present_test() {
  assert "hello" == capuchin_crypt.put("test:default", "hello")
  assert "hello"
    == capuchin_crypt.get_default(key: "test:default", or: "fallback")
}

pub fn get_default_missing_test() {
  assert "fallback"
    == capuchin_crypt.get_default(key: "test:default:missing", or: "fallback")
}

pub fn erase_missing_test() {
  assert capuchin_crypt.erase("test:erase:missing") == False
}

pub fn erase_present_test() {
  assert 42 == capuchin_crypt.put("test:erase:present", 42)
  assert capuchin_crypt.erase("test:erase:present") == True
  assert Error(Nil) == capuchin_crypt.get("test:erase:present")
}

pub fn put_overwrites_test() {
  capuchin_crypt.put("test:overwrite", "first")
  capuchin_crypt.put("test:overwrite", "second")
  assert Ok("second") == capuchin_crypt.get("test:overwrite")
}

pub fn put_new_empty_test() {
  capuchin_crypt.erase("test:put_new")
  assert Ok("value") == capuchin_crypt.put_new("test:put_new", "value")
}

pub fn put_new_existing_test() {
  capuchin_crypt.put("test:put_new2", "original")
  assert Error("original")
    == capuchin_crypt.put_new("test:put_new2", "rejected")
  assert Ok("original") == capuchin_crypt.get("test:put_new2")
}

pub fn put_returns_value_test() {
  assert capuchin_crypt.put("test:return", 99) == 99
}
