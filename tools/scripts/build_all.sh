#!/bin/bash

# Script to build all example apps

echo "Building all example apps..."

cd examples/counter_app
echo "Building counter_app..."
flutter build apk --release || echo "Failed to build counter_app"

cd ../todo_app
echo "Building todo_app..."
flutter build apk --release || echo "Failed to build todo_app"

cd ../demo_app
echo "Building demo_app..."
flutter build apk --release || echo "Failed to build demo_app"

cd ../..
echo "Build process completed!"
