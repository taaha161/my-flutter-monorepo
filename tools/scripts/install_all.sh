#!/bin/bash

# Script to install dependencies for all packages and examples

echo "Installing dependencies for all packages..."

# Install package dependencies
cd packages/widgets && flutter pub get && cd ../..
cd packages/state_management && flutter pub get && cd ../..
cd packages/network && flutter pub get && cd ../..
cd packages/shared && flutter pub get && cd ../..
cd packages/utils && flutter pub get && cd ../..

echo "Installing dependencies for example apps..."

# Install example app dependencies
cd examples/counter_app && flutter pub get && cd ../..
cd examples/todo_app && flutter pub get && cd ../..
cd examples/demo_app && flutter pub get && cd ../..

echo "All dependencies installed!"
