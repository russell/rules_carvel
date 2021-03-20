#!/bin/bash

bazel build :vendir_doc :kbld_doc
cp -L bazel-bin/vendir_readme.md vendir/README.md
cp -L bazel-bin/kbld_readme.md kbld/README.md
chmod 644 vendir/README.md kbld/README.md
