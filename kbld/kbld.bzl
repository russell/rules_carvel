"""
"""

def _kbld_impl(ctx):
    out_files = []

    for input_file in ctx.files.srcs:
        out_file = ctx.actions.declare_file("%s.yaml" % ctx.attr.name)
        out_files.append(out_file)
        ctx.actions.run_shell(
            inputs = [input_file],

            outputs = [out_file],
            tools = [ctx.executable.kbld],
            progress_message = "Resolving dependencies for %s" % input_file.short_path,
            command = ctx.executable.kbld.path + " -f '%s' > '%s'" % (input_file.path, out_file.path),
    )

    return [DefaultInfo(files = depset(out_files))]

kbld = rule(
    implementation = _kbld_impl,

    attrs = {
        "srcs": attr.label_list(
            mandatory = True,
            doc = "The Kubernetes file to resolve images in.",
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
