##### 模块化import

1. use header map 设为NO
2. always search user paths 设为NO
3. 设置header search path 和 user header search path



##### <> 与 “”

1. <>是全局的引用，即由编译器设置好的路径
2. 双引号用于本地的头文件（需要指明文件的相对路径，比如： #import "headers/header.h"）

> Objective-C has this in common with C/C++; the quoted form is for "local" includes of files (you need to specify the relative path from the current file, e.g. `#include "headers/my_header.h"`), while the angle-bracket form is for "global" includes -- those found somewhere on the include path passed to the compiler (e.g. `#include <math.h>`).
>
> <https://stackoverflow.com/questions/1044360/import-using-angle-brackets-and-quote-marks>

##### use header map

> Enable the use of Header Maps, which provide the compiler with a mapping from textual header names to their locations, bypassing the normal compiler header search path mechanisms. This allows source code to include headers from various locations in the file system without needing to update the header search path build settings.

允许使用Header Maps，它为编译器提供从文本头名称到其位置的映射，绕过正常的编译器头搜索路径机制。 这允许源代码包含来自文件系统中各个位置的标头，而无需更新标头搜索路径构建设置

##### header search path 与 user header search paths

> Header Search Paths：
>  This is a list of paths to folders to be searched by the compiler for included or imported header files when compiling C, Objective-C, C++, or Objective-C++. Paths are delimited by whitespace, so any paths with spaces in them need to be properly quoted.
>
> User Header Search Paths:
>
> Enable the use of *Header Maps*, which provide the compiler with a mapping from textual header names to their locations, bypassing the normal compiler header search path mechanisms. This allows source code to include headers from various locations in the file system without needing to update the header search path build settings.

##### always search user paths

> If enabled, both `#include <header.h>`-style and `#include "header.h"`-style directives search the paths in [User Header Search Paths (USER_HEADER_SEARCH_PATHS)](https://help.apple.com/xcode/mac/8.0/#/itcaec37c2a6?sub=deved642222b) before [Header Search Paths (HEADER_SEARCH_PATHS)](https://help.apple.com/xcode/mac/8.0/#/itcaec37c2a6?sub=dev3c9f85d97). As a consequence, user headers, such as your own `String.h` header, have precedence over system headers when using `#include <header.h>`. This is done using the `-iquote` flag for the paths provided in `User Header Search Paths`. If disabled and your compiler fully supports separate user paths, user headers are only accessible with `#include "header.h"`-style preprocessor directives.



来源：

<https://help.apple.com/xcode/mac/8.0/#/itcaec37c2a6?sub=deved642222b>