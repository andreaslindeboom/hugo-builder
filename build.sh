#!/bin/bash
hugo --source=src --destination=../tmp
tar czf dest/site.tar.gz -C tmp .
rm -rf tmp
