import unittest
import sss

proc `==`(a, b: Key): bool {.borrow.}

test "creates a uniform random key":
  let key1, key2 = randomKey()
  check key1 != key2

test "creates shares of a uniform random key":
  let shares = randomKey().shares(2, 3)
  check len(shares) == 3

test "restores with sufficient shares":
  let key = randomKey()
  let shares = key.shares(2, 3)
  check combine(shares[0..1]) == key

test "fails to restore with insufficient shares":
  let key = randomKey()
  let shares = key.shares(2, 3)
  check combine(shares[0..0]) != key

