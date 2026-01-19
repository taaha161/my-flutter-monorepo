#!/bin/bash

# Script to run tests for all packages

echo "Running tests for all packages..."

cd packages/widgets
echo "Testing widgets package..."
flutter test || echo "Widgets package tests failed"

cd ../state_management
echo "Testing state_management package..."
flutter test || echo "State management package tests failed"

cd ../network
echo "Testing network package..."
flutter test || echo "Network package tests failed"

cd ../shared
echo "Testing shared package..."
flutter test || echo "Shared package tests failed"

cd ../utils
echo "Testing utils package..."
flutter test || echo "Utils package tests failed"

cd ../..
echo "All tests completed!"
