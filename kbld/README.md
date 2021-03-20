<!-- Generated with Stardoc: http://skydoc.bazel.build -->

<a name="#kbld"></a>

## kbld

<pre>
kbld(<a href="#kbld-name">name</a>, <a href="#kbld-kbld">kbld</a>, <a href="#kbld-srcs">srcs</a>)
</pre>


Run KBLD command on a file


**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| kbld |  -   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | optional | //kbld:kbld_tool |
| srcs |  The Kubernetes file to resolve images in.   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | required |  |


