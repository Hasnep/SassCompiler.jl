# SassCompiler.jl

A wrapper script around the [`sass` Node.js package](https://www.npmjs.com/package/sass), which is just [Dart Sass](https://sass-lang.com/dart-sass) compiled to JavaScript.

This was thrown together in a few minutes, so no guarantees about it being bug-free or even functional. 🤷

## Installation

From the Julia REPL, type `]` to enter the Pkg REPL, then run:

```text
add https://github.com/Hasnep/SassCompiler.jl.git
```

Or run from the Julia REPL:

```julia
import Pkg
Pkg.add(url = "https://github.com/Hasnep/SassCompiler.jl.git")
```

## Usage

SassCompiler.jl exports one function called `compile_sass` which has two methods:

- `compile_sass(sass_string)` compiles a Sass string to a CSS string,
- `compile_sass(input_sass_file_path, output_css_file_path)` compiles a Sass file to a CSS file.

## Examples

### Compiling a Sass string to a CSS string

```julia
using SassCompiler

sass_string = """
nav {
  a {
    color: red;
  }
}
"""

expected_output_css = """
nav a {
  color: red;
}
"""

@assert compile_sass(sass_string) == expected_output_css
```

### Compiling a Sass file to a CSS file

```julia
using SassCompiler

input_file_path = joinpath(pwd(), "styles.scss")
output_file_path = joinpath(pwd(), "styles.css")

write(
    input_file_path,
    """
nav {
  a {
    color: red;
  }
}
""",
)

expected_output_css = """
nav a {
  color: red;
}
"""

compile_sass(input_file_path, output_file_path)

@assert read(output_file_path, String) == expected_output_css
```
