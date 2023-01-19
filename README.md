# REST API
- Routing
- Validation
- Migration
- Models
- Rate Limiter
- Logger
- Graceful Shutdown
- Background Tasks
- Tokens
- Permissions
- Cors
- Metrics (expvar, httpsnoop)
- Makefile

#### Personal education via book "Lets`s Go Further"

## File and folder names

- The `bin` directory will contain our compiled application binaries, ready for deployment to a production server.
- The `cmd/api` directory will contain the application-specific code for our Greenlight API application. This will include the code for running the server, reading and writing HTTP requests, and managing authentication.
- The `internal` directory will contain various ancillary packages used by our API. It will contain the code for interacting with our database, doing data validation, sending emails and so on. Basically, any code which isn’t application-specific and can potentially be reused will live in here. Our Go code under `cmd/api` will <em>import</em> the packages in the `internal` directory (but never the other way around).
- The `migrations` directory will contain the SQL migration files for our database. The remote directory will contain the configuration files and setup scripts for our
production server.
- The `go.mod` file will declare our project dependencies, versions and module path.
- The `Makefile` will contain <em>recipes</em> for automating common administrative tasks — like auditing our Go code, building binaries, and executing database migrations.

## How to use

### Install

Download dependency

```bash
go mod download
```

Install the package
```bash
go install -v ./...
```

Install migration tools (macOS)
```bash
brew install golang-migrate
```

### Migration

Up migration
```bash
make migration/up
```

Creating migration files
```bash
make migration/new name=create_example_table
```

### Run project
Run
```bash
make run/api
```

### Other

Print makefile help messages

```bash
make help
```

### Quality audit

#### Audit tools:

- `go fmt ./...` command to format all .go files in the project directory, according to the Go standard.
- `go vet ./...` command to check all `.go` files in the project directory. Runs a variety of analyzers which carry out static analysis of your code and warn you about things which might be wrong but won’t be picked up by the compiler.
- `go test -race -vet=off ./...` command to run all tests in the project directory.
- Third-party `staticcheck` tool to carry out some additional static analysis checks.

Run audit

```bash
make audit
```

#### Vendor tools:

- `go mod tidy` command will make sure the go.mod and go.sum files list all the necessary dependencies for our project (and no unnecessary ones).
- `go mod verify` command will verify that the dependencies stored in your module cache (located on your machine at $GOPATH/pkg/mod) match the cryptographic hashes in the go.sum file.
- `go mod vendor` command will then copy the necessary source code from your module cache into a new vendor directory in your project root.

```bash
make vendor

```