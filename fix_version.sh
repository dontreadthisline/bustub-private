#!/bin/bash

ROOT_DIR="third_party"

# 查找所有 CMakeLists.txt 文件
find "$ROOT_DIR" -type f -name "CMakeLists.txt" | while read -r file; do
    if grep -q 'cmake_minimum_required *( *VERSION *3\.0 *)' "$file"; then
        echo "[Updating] $file"
        # 使用 sed 进行就地替换（适配 macOS 和 GNU sed）
        sed -i.bak -E 's/cmake_minimum_required[[:space:]]*\([[:space:]]*VERSION[[:space:]]*3\.0[[:space:]]*\)/cmake_minimum_required(VERSION 3.5...3.20)/g' "$file"
    fi
done
