# buildkite-plugin-template

This is a [template repository](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) from which to make new Buildkite plugins. After making a new repo from this template, address all the `TEMPLATE` comments in the files to make it your own.

## Usage
Add the following to your `pipeline.yml`:

```yaml
steps:
  - label: "Your step"
    plugins:
      - instacart/template#v1.0.0:
```
