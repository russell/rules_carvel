load("@bazel_skylib//:bzl_library.bzl", "bzl_library")

package(default_visibility = ["//visibility:public"])

exports_files(
    ["runner.bash.template"],
    visibility = ["//visibility:public"],
)

alias(
    name = "vendir_tool",
    actual = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@vendir_linux//file",
        "@bazel_tools//src/conditions:darwin": "@vendir_osx//file",
    }),
)

bzl_library(
    name = "vendir_lib",
    srcs = ["defs.bzl"],
    deps = [
        "@bazel_skylib//lib:shell.bzl",
    ],
)
