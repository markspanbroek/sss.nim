# Generated @ 2021-05-28T21:01:36+02:00
# Command line:
#   /home/user/.asdf/installs/nim/1.4.8/nimble/pkgs/nimterop-0.6.13/nimterop/toast --compile=./sources/randombytes.c --compile=./sources/hazmat.c --pnim --noHeader ./sources/randombytes.h ./sources/hazmat.h

{.push hint[ConvFromXtoItselfNotNeeded]: off.}


{.experimental: "codeReordering".}
{.compile: "./sources/randombytes.c".}
{.compile: "./sources/hazmat.c".}
const
  sss_KEYSHARE_LEN* = 33
type
  sss_Keyshare* = array[sss_KEYSHARE_LEN, uint8] ## ```
                                                 ##   One share of a cryptographic key which is shared using Shamir's
                                                 ##    the sss_create_keyshares function.
                                                 ## ```
proc randombytes*(buf: pointer; n: uint): cint {.importc, cdecl.}
  ## ```
                                                                 ##   _WIN32 
                                                                 ##     
                                                                 ##    Write n bytes of high quality random bytes to buf
                                                                 ## ```
proc sss_create_keyshares*(`out`: ptr sss_Keyshare; key: array[32, uint8];
                           n: uint8; k: uint8) {.importc, cdecl.}
  ## ```
                                                                 ##   Share the secret given in key into n shares with a treshold value given
                                                                 ##    in k. The resulting shares are written to out.
                                                                 ##   
                                                                 ##    The share generation that is done in this function is only secure if the key
                                                                 ##    that is given is indeed a cryptographic key. This means that it should be
                                                                 ##    randomly and uniformly generated string of 32 bytes.
                                                                 ##   
                                                                 ##    Also, for performance reasons, this function assumes that both n and k
                                                                 ##    arepublic* values.
                                                                 ##   
                                                                 ##    If you are looking for a function thatjust* creates shares of arbitrary
                                                                 ##    data, you should use the sss_create_shares function in sss.h.
                                                                 ## ```
proc sss_combine_keyshares*(key: array[32, uint8]; shares: ptr sss_Keyshare;
                            k: uint8) {.importc, cdecl.}
  ## ```
                                                        ##   Combine the k shares provided in shares and write the resulting key to
                                                        ##    key. The amount of shares used to restore a secret may be larger than the
                                                        ##    threshold needed to restore them.
                                                        ##   
                                                        ##    This function doesnot* doany* checking for integrity. If any of the
                                                        ##    shares not original, this will result in an invalid resored value.
                                                        ##    All values written to key should be treated as secret. Even if some of the
                                                        ##    shares that were provided as input were incorrect, the resulting keystill*
                                                        ##    allows an attacker to gain information about the real key.
                                                        ##   
                                                        ##    This function treats shares and key as secret values. k is treated as
                                                        ##    a public value (for performance reasons).
                                                        ##   
                                                        ##    If you are looking for a function that combines shares of arbitrary
                                                        ##    data, you should use the sss_combine_shares function in sss.h.
                                                        ## ```
{.pop.}
