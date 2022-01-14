module SassCompiler

import NodeJS

export compile_sass

__init__() = run(`$(NodeJS.npm_cmd()) install sass`)

function compile_sass(sass_string)
    compile_script = """
    const sass = require("sass");
    const result = sass.compileString(`$sass_string`);
    console.log(result["css"]);
    """
    return read(`$(NodeJS.nodejs_cmd()) --eval "$compile_script"`, String)
end

function compile_sass(input_sass_file_path, output_css_file_path)
    raw_scss = open(io -> read(io, String), input_sass_file_path, "r")
    compiled_css = compile_sass(raw_scss)
    open(io -> write(io, compiled_css), output_css_file_path, "w")
    return compiled_css
end

end # module
