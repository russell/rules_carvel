package(default_visibility = ["//visibility:public"])

exports_files(["kbld.bzl"])

filegroup(
    name = "allfiles",
    srcs = glob([
        "**/kbld",
    ]),
)

alias(
    name = "kbld_tool",
    actual = select({
        "@bazel_tools//src/conditions:linux_x86_64": "@kbld//:kbld",
        "@bazel_tools//src/conditions:darwin": "@kbld_osx//:kbld",
    }),
)
