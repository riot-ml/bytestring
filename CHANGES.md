# Changes

## 0.0.8

* First implementation of efficient immutable byte strings with cheap view and
  concat operations. Thanks to @felipecrv for contributing! 👏

* Iterators and Transient builders for efficiently examining, destructuring,
  and constructing byte strings from different sources.

* Preliminary Bytestrings syntax support (via a ppx) for constructions and
  efficient pattern matching using the `%b` sigil.
