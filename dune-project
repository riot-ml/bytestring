(lang dune 3.11)
(using mdx 0.4)

(name bytestring)

(generate_opam_files true)
(cram enable)

(source
 (github riot-ml/riot))

(authors "Leandro Ostera <leandro@abstractmachines.dev>")

(maintainers "Leandro Ostera <leandro@abstractmachines.dev>")

(license MIT)

(package
  (name bytestring)
  (synopsis "Efficient, immutable, pattern-matchable, UTF friendly byte strings")
  (description "The Bytestring package implements efficient, immutable, pattern-matchable, UTF friendly byte strings backed up by a rope implementation with mutable iterator instances and a transient interface in the spirit of Clojure transient data.")
  (authors 
    "Leandro Ostera <leandro@abstractmachines.dev>"
    "Felipe Oliveira Carvalho <felipekde@gmail.com>")
  (depends
    (rio (= :version))
    (ocaml (>= "5.1.1"))
    (ppxlib (>= 0.31.0))
    (qcheck (and :with-test (>= "0.21.3")))
    (sedlex (>= "3.2"))
    (spices (>= "0.0.2"))
    dune
    )
  (tags (bytes strings "pattern matching" "binary strings" rope transient iterators utf8)))
