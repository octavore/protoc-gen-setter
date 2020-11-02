# protoc-gen-setter

## Usage

### CLI

```shell
protoc example.proto --go_out=. --go_opt=paths=source_relative --setter_out
```

### Proto

NB: You probably want to just copy the `setter.proto` file somewhere in your project and reference it there 🤷‍♂️.

```proto
syntax = "proto3";

package example.proto3;

option go_package = "github.com/octavore/protoc-gen-setter/example/proto3";

import "google/protobuf/descriptor.proto";
import "setterpb/setter.proto";

message Timestamp {
    option (setter.all_fields) = true;
    int64 created_at = 1;
    int64 updated_at = 2;
}

message Page {
    Timestamp timestamps = 1 [(setter.field).include = true];

    oneof type {
      option (setter.oneof_field).include = true;
      string text = 11;
      int64 number = 12;
    }
}
```

## Development

```
make prepare
make test  # build example protos
```

## Credits

Inspired by https://github.com/confluentinc/proto-go-setter but uses `google.golang.org/protobuf` exclusively instead of `gogo/protobuf`.

## License

MIT