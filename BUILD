load("@com_github_bazelbuild_buildtools//buildifier:def.bzl", "buildifier")
load("@io_bazel_stardoc//stardoc:stardoc.bzl", "stardoc")
load("@com_github_russell_rules_stately//stately:stately.bzl", "project_installed_files")
load("//kbld:kbld.bzl", "kbld")

buildifier(
    name = "buildifier",
)

stardoc(
    name = "kbld_doc",
    input = "//kbld:kbld.bzl",
    out = "README.md",
    symbol_names = ["kbld"],
    deps = ["//kbld:kbld_lib"],
)

project_installed_files(
    name="deploy_kbld_doc",
    srcs = [":kbld_doc"],
    output = "kbld"
)
