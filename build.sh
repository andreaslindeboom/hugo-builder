#!/bin/bash
hugo --source=build/source --destination=../tmp
tar czf build/target/built-package.tar.gz -C build/tmp .
rm -rf build/tmp
