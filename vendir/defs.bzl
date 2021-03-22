"""
"""

load("@bazel_skylib//lib:shell.bzl", "shell")

def _vendir_impl(ctx):
    input_files = ctx.files.config

    args = [
    ]

    runner_out_file = ctx.actions.declare_file(ctx.label.name + ".bash")
    substitutions = {
        "@@ARGS@@": shell.array_literal(args),
        "@@PACKAGE@@": ctx.label.package,
        "@@VENDIR_SHORT_PATH@@": shell.quote(ctx.executable._vendir.short_path),
    }
    ctx.actions.expand_template(
        template = ctx.file._runner,
        output = runner_out_file,
        substitutions = substitutions,
        is_executable = True,
    )

    return [
        DefaultInfo(
            files = depset([runner_out_file]),
            runfiles = ctx.runfiles(files = [ctx.executable._vendir]),
            executable = runner_out_file,
        ),
    ]

vendir = rule(
    implementation = _vendir_impl,
    executable = True,
    attrs = {
        "config": attr.label(
            mandatory = True,
            allow_single_file = True,
            doc = "The config file for Vendir",
        ),
        "_vendir": attr.label(
            default = Label("//vendir:vendir_tool"),
            cfg = "host",
            executable = True,
            allow_single_file = True,
        ),
        "_runner": attr.label(
            default = "//vendir:runner.bash.template",
            allow_single_file = True,
        ),
    },
    doc = """
Generate the VENDIR project and show it
""",
)
