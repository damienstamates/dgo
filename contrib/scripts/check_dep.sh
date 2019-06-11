#!/bin/bash

expected="context
github.com/damienstamates/dgo/protos/api
github.com/damienstamates/dgo/y
github.com/gogo/protobuf/proto
github.com/pkg/errors
google.golang.org/grpc/codes
google.golang.org/grpc/status
math/rand
sync"

got=$(go list -f '{{ join .Imports "\n" }}' github.com/damienstamates/dgo)

if [ "$got" != "$expected" ]; then
  echo "Imports for Go client didn't match."
  echo -e "\nExpected, Got\n"
  diff -y <(echo "$expected") <(echo "$got")
  exit 1
fi
