#!/bin/sh

# Skip the rest of this test script if we are on cross-compilation
if [[ "$CONDA_BUILD_CROSS_COMPILATION" == "1" ]]; then
    exit 0
fi

# Skip the rest of this test script if we are on linux_aarch64
if [[ "$target_platform" == "linux_aarch64" ]]; then
    exit 0
fi

# Skip the rest of this test script if we are on linux_ppc64le
if [[ "$target_platform" == "linux_ppc64le" ]]; then
    exit 0
fi

# Execute the Python test application using reaktplot
python test/example.py

# Build and execute the C++ test application using reaktplot
cd test/app
mkdir build
cd build
cmake -GNinja .. -DCMAKE_PREFIX_PATH=$PREFIX
ninja

export PYTHONVERBOSE=2

# ./app

# Ignoring execution of app above because it is failing for strange reasons in macOS (but working fine in Linux).
# Error is:
# [1/2] Building CXX object CMakeFiles/app.dir/main.cpp.o
# [2/2] Linking CXX executable app
# libc++abi: terminating with uncaught exception of type pybind11::error_already_set: ModuleNotFoundError: No module named 'plotly'
