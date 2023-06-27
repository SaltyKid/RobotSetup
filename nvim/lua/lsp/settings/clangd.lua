return {
    cmd = {
        "clangd", -- NOTE: 只支持clangd 13.0.0 及其以下版本，新版本会有问题
        -- 后台建立索引，并持久化到disk
        "--background-index",
        -- 开启clang-tidy
        "--clang-tidy",
        -- 指定clang-tidy的检查参数， 摘抄自cmu15445. 全部参数可参考 https://clang.llvm.org/extra/clang-tidy/checks
        "--clang-tidy-checks=bugprone-*, clang-analyzer-*, google-*, modernize-*, performance-*, portability-*, readability-*, -bugprone-too-small-loop-variable, -clang-analyzer-cplusplus.NewDelete, -clang-analyzer-cplusplus.NewDeleteLeaks, -modernize-use-nodiscard, -modernize-avoid-c-arrays, -readability-magic-numbers, -bugprone-branch-clone, -bugprone-signed-char-misuse, -bugprone-unhandled-self-assignment, -clang-diagnostic-implicit-int-float-conversion, -modernize-use-auto, -modernize-use-trailing-return-type, -readability-convert-member-functions-to-static, -readability-make-member-function-const, -readability-qualified-auto, -readability-redundant-access-specifiers,",
        --"--clang-tidy-checks=**",
        -- 代码完成建议粒度  detailed 完成类型信息   bundled  合并相似完成项
        "--completion-style=bundled",
        --"--fallback-style=file:/home/linyuzhou/.config/clangd/",
        "--fallback-style=Google",
        -- 跨文件重名变量
        "--cross-file-rename=true",
        -- PCH 存储位置  disk 磁盘  memory 内存
        "--pch-storage=disk",
        -- 添加 #include  iwyu   /  never 从不
        -- "--header-insertion=iwyu",
        "--header-insertion=never",
        -- 输入建议中，已包含头文件的项与还未包含头文件的项会以圆点加以区分
        "--header-insertion-decorators",
        -- compelie_commands.json 文件的目录位置
        "--compile-commands-dir=build",
        "--query-driver=/usr/bin/clang,/usr/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
        -- 启用这项时，补全函数时，将会给参数提供占位符，键入后按 Tab 可以切换到下一占位符
        "--function-arg-placeholders=false",
        -- log 信息  error 、 info(high level excution tracing) 、 verbose(low level details)
        "--log=verbose",
        --"--ranking-model=decision_forest",
        "-j=32",
        "--pretty",
    }
}
