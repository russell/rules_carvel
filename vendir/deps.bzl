load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def vendir_repositories():
    http_file(
        name = "vendir_linux",
        downloaded_file_path = "vendir",
        urls = ["https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.17.0/vendir-linux-amd64"],
        executable = True,
    )

    http_file(
        name = "vendir_osx",
        downloaded_file_path = "vendir",
        urls = ["https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.17.0/vendir-darwin-amd64"],
        executable = True,
    )


    maybe(
        http_archive,
        name = "bazel_skylib",
        urls = [
            "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
            "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        ],
        sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    )
