return {
    lintCommand = "markdownlint -s ",
    lintStdin = true,
    lintFormats = {
        "%f:%l %m",
        "%f:%l:%c %m",
        "%f: %l: %m"
    }
}
