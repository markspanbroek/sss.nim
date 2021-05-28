Shamir Secret Sharing
=====================

Split a random key into a number of shares. Using a number of these shares the
key can be restored.

This is a nim wrapper around the [c library][1] by dsprenkels. Only the
hazardous low level API is wrapped, so only use this when [you know what
you're doing][2].

Examples
--------

Generate a uniform random key:

```nim
let key = randomKey()
```

Create 3 shares of the key, of which 2 are sufficient to restore the key:

```nim
let shares = key.shares(2, 3)
```

Restore the key by combining 2 shares:

```nim
let restored = combine(shares[0..1])
```

Updating to a newer version
---------------------------

Follow these steps when updating the wrapper to a newer version of sss:

   1. update the git submodule in `sources/` to point to the new version
   2. run `build.sh`
   3. update the version in `sss.nimble`
   4. commit the changes

[1]: https://github.com/dsprenkels/sss
[2]: https://github.com/dsprenkels/sss#technical-details
