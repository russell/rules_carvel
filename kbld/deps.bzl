load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def kbld_repositories():
    http_file(
        name = "kbld_linux",
        downloaded_file_path = "kbld",
        urls = ["https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.32.0/kbld-linux-amd64"],
        executable = True,
        sha256 = "de546ac46599e981c20ad74cd2deedf2b0f52458885d00b46b759eddb917351a",
    )

    http_file(
        name = "kbld_osx",
        downloaded_file_path = "kbld",
        urls = ["https://github.com/vmware-tanzu/carvel-kbld/releases/download/v0.32.0/kbld-darwin-amd64"],
        sha256 = "5fc8a491327294717611974c6ab3da2bda3f3809ef3147c1e8472ac62af3ee18",
        executable = True,
    )
