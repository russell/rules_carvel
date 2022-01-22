load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def vendir_repositories():
    http_file(
        name = "vendir_linux",
        downloaded_file_path = "vendir",
        urls = ["https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-linux-amd64"],
        executable = True,
        sha256 = "b7bfd227aa2e6df602f8e79edf725bb0a944b68d207005f42f46f061c4ecd55a",
    )

    http_file(
        name = "vendir_osx",
        downloaded_file_path = "vendir",
        urls = ["https://github.com/vmware-tanzu/carvel-vendir/releases/download/v0.24.0/vendir-darwin-amd64"],
        executable = True,
        sha256 = "f3a738d1fe55803ad5faba495f662c48efa230976ccad7a159587dcf9b020f63",
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
