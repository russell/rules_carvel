"""
"""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_file")

def _kbld_impl(ctx):
    input_file = ctx.file.file
    out_file = ctx.actions.declare_file("%s.yaml" % ctx.attr.name)

    ctx.actions.run_shell(
        inputs = [input_file],

        outputs = [out_file],
        tools = [ctx.executable.kbld],

        progress_message = "Resolving dependencies",

        command = ctx.executable.kbld.path + " -f '%s' > '%s'" %
                  (input_file.path, out_file.path),
    )

    return [DefaultInfo(files = depset([out_file]))]

kbld = rule(
    implementation = _kbld_impl,

    attrs = {
        "file": attr.label(
            mandatory = True,
            allow_single_file = True,
            doc = "",
        ),
        "secrets": attr.bool(
            default = False,
            mandatory = False,
        ),
        "kbld": attr.label(
            default = Label("//kbld:kbld_tool"),
            cfg = "host",
            executable = True,
            allow_single_file = True,
        ),
    },
    doc = """
Run KBLD command on a file
""",
)

def kbld_repositories():
    http_file(
        name = "kbld",
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
