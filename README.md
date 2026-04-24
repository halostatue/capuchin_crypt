# `capuchin_crypt`

[![Hex.pm][shield-hex]][hexpm] [![Hex Docs][shield-docs]][docs]
[![Apache 2.0][shield-licence]][licence] ![Erlang Compatible][shield-erl]
![JavaScript Compatible][shield-js]

- code :: <https://github.com/halostatue/capuchin_crypt>
- issues :: <https://github.com/halostatue/capuchin_crypt/issues>

An in-memory persistent cache for Gleam. Expensive to update, cheap to read. In
Erlang, this uses `persistent_term`; in JavaScript, values are stored in a
module level `Map`.

If you think you need this, think again — you probably don't. As the warning at
the top of [`persisten_term`][pterm] says:

> Persistent terms is an advanced feature and is not a general replacement for
> ETS tables. Before using persistent terms, make sure to fully understand the
> consequence to system performance when updating or deleting persistent terms.

This is something which is useful but fundamentally breaks the immutable data
model of Gleam. This can be valuable, but should be used primarily for utility
values that are expensive to compute but used frequently during execution
possibly in tight loops. This includes terms like regular expressions.

Again: if you think you need this, think again — you probably don't.

This library is named after the fantastic [Capuchin Crypt][cripta] in Rome.

## Installation

```sh
gleam add capuchin_crypt@1
```

## Example

```gleam
import capuchin_crypt

pub fn main() {
  capuchin_crypt.put(
    "something:expensive",
    something_expensive_worth_caching())
  )

  capuchin_crypt.get("something:expensive")
}
```

Further documentation can be found at <https://hexdocs.pm/capuchin_crypt>.

## Semantic Versioning

`capuchin_crypt` follows [Semantic Versioning 2.0][semver].

[cripta]: https://en.wikipedia.org/wiki/Capuchin_Crypt
[docs]: https://hexdocs.pm/capuchin_crypt
[hexpm]: https://hex.pm/packages/capuchin_crypt
[licence]: https://github.com/halostatue/capuchin_crypt/blob/main/LICENCE.md
[pterm]: https://www.erlang.org/doc/apps/erts/persistent_term.html
[semver]: https://semver.org/
[shield-docs]: https://img.shields.io/badge/hex-docs-lightgreen.svg?style=for-the-badge "Hex Docs"
[shield-erl]: https://img.shields.io/badge/target-erlang-f3e155?style=for-the-badge "Erlang Compatible"
[shield-hex]: https://img.shields.io/hexpm/v/capuchin_crypt?style=for-the-badge "Hex Version"
[shield-js]: https://img.shields.io/badge/target-javascript-f3e155?style=for-the-badge "JavaScript Compatible"
[shield-licence]: https://img.shields.io/hexpm/l/capuchin_crypt?style=for-the-badge&label=licence "Licence"
