(module combinatorics
  (ordered-subset-fold
   ordered-subset-for-each
   ordered-subset-map
   unordered-subset-fold
   unordered-subset-for-each
   unordered-subset-map
   permutation-fold
   permutation-for-each
   permutation-map
   combination-fold
   combination-for-each
   combination-map)

  (import scheme)
  (import (chicken base))
  (import srfi-1)
  (import vector-lib)

  (include "combinatorics-core.scm"))
