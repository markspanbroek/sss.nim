import nimterop/[build, cimport]
import os

const
  src = currentSourcePath.parentDir/"build"

static:
  gitPull(
    "https://github.com/dsprenkels/sss.git",
    checkout = "v0.1.0",
    outdir = src
  )
  gitPull( # no submodule support in nimterop
    "https://github.com/dsprenkels/randombytes",
    checkout = "d78159c",
    outdir = src/"randombytes"
  )

static:
  cCompile(src/"randombytes.c")
  cCompile(src/"hazmat.c")

cImport(src/"randombytes.h")
cImport(src/"hazmat.h")
