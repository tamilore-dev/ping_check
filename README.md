# ping_check.sh

A small Bash script that checks whether a website or IP address is reachable.

## What it does

1. Takes a domain or IPv4 address as input
2. Checks the input looks valid (using a regex)
3. Pings the host twice
4. Prints whether the network is UP or DOWN

## Requirements

- Linux or macOS
- Bash
- `ping` (installed by default on most systems)

## Usage

```bash
chmod +x ping_check.sh
./ping_check.sh <website or IP address>
```

## Examples

```bash
./ping_check.sh google.com
# Starting network check for: google.com...
# Network is UP (google.com is reachable)

./ping_check.sh 192.168.1.1
./ping_check.sh not-a-real-site
# Error: Please input a valid website or IP address.
```

Running it with no argument prints a usage message.

## What I learned

- Input validation with regex in Bash
- Guard clauses for early exits
- Using `ping` exit codes inside an `if` statement
- Writing reusable functions in shell scripts
