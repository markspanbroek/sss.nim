from sss/cImports as c import nil

type
  Key* = distinct array[32, byte]
  Share* = c.sss_Keyshare

proc `$`*(key: Key): string {.borrow.}

template asArray*(key: Key): array[32, byte] =
  array[32, byte](key)

func randomKey*(): Key =
  assert(c.randombytes(addr result, uint(sizeof(result))) == 0)

func shares*(key: Key, threshold, amount: static uint8): array[amount, Share] =
  c.sss_create_keyshares(addr result[0], key.asArray, amount, threshold)

func combine*(shares: openArray[Share]): Key =
  let sharesPtr = unsafeAddr shares[0]
  let sharesLen = uint8(len(shares))
  c.sss_combine_keyshares(result.asArray, sharesPtr, sharesLen)
