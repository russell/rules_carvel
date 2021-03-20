load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@io_bazel_stardoc//stardoc:stardoc.bzl", "stardoc")
load("//kbld:kbld.bzl", "kbld")

buildifier(
    name = "buildifier",
)

stardoc(
    name = "kbld_doc",
    input = "//kbld:kbld.bzl",
    out = "kbld_readme.md",
    symbol_names = ["kbld"],
    deps = ["//kbld:kbld_lib"],
)

stardoc(
    name = "vendir_doc",
    input = "//vendir:vendir.bzl",
    out = "vendir_readme.md",
    symbol_names = ["vendir"],
    deps = ["//vendir:vendir_lib"],
)
