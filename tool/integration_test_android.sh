#!/usr/bin/env bash

# Before running this script start an Android emulator.

package_dir=$(pwd)
pushd example || exit
declare -a TEST_FILES=($(find integration_test -type f -name "*_test.dart"))
for TEST_FILE in "${TEST_FILES[@]}"; do
  (
    flutter run "$TEST_FILE" \
      --vmservice-out-file=../coverage/vm-service-url.txt &
    sleep 20
    dart pub global run coverage:collect_coverage \
      --uri="$(cat ../coverage/vm-service-url.txt)" \
      --out ../coverage/coverage.json
    dart pub global run coverage:format_coverage \
      --lcov \
      --in ../coverage \
      --out ../coverage/lcov.source.info \
      --packages=.packages \
      --report-on="$package_dir"/lib \
      --base-directory="$package_dir"
    if [[ -s ../coverage/lcov.info ]]; then
      cp ../coverage/lcov.info ../coverage/lcov.base.info
      lcov --add-tracefile ../coverage/lcov.base.info \
        --add-tracefile ../coverage/lcov.source.info \
        --output-file ../coverage/lcov.info
    else
      cp ../coverage/lcov.source.info ../coverage/lcov.info
    fi
  )
done
popd || exit
rm ./coverage/vm-service-url.txt
rm ./coverage/coverage.json
rm ./coverage/lcov.base.info
rm ./coverage/lcov.source.info
