load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def kbld_repositories():
    http_file(
        name = "kbld_linux",
        downloaded_file_path = "kbld",
        urls = ["https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.29.0/kbld-linux-amd64"],
        sha256 = "28492a398854e8fec7dd9537243b07af7f43e6598e1e4557312f5481f6840499",
        executable = True,
    )

    http_file(
        name = "kbld_osx",
        downloaded_file_path = "kbld",
        urls = ["https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.29.0/kbld-darwin-amd64"],
        executable = True,
    )
