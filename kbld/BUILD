load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

package(default_visibility = ["//visibility:public"])

alias(
    name = "kbld_tool",
    actual = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@kbld_linux//file",
        "@bazel_tools//src/conditions:darwin": "@kbld_osx//file",
    }),
)

bzl_library(
    name = "kbld_lib",
    srcs = ["kbld.bzl"],
)
