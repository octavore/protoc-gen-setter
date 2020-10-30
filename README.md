# protoc-gen-setter

## Usage

```proto
syntax = "proto3";

package mypackage;

option go_package = "github.com/ketchuphq/ketchup/proto/modelspb";

import "google/protobuf/descriptor.proto";
import "vendor/setter.proto";

message Timestamp {
    option (setter.all_fields) = true;
    int64 created_at = 1;
    int64 updated_at = 2;
}

message Page {
    Timestamp timestamps = 1 [(setter.field).include = true];

    oneof type {
      option (setter.oneof_field).include = true;
      ContentString short = 11;
      ContentText text = 12;
      ContentMultiple multiple = 13;
    }
}
```