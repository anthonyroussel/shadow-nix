#!/usr/bin/env python3
import json
import sys
import yaml

from urllib.request import urlopen

FILE = "upstream-info.json"

BASE_URL = "https://storage.googleapis.com/shadow-update/launcher"

CHANNELS = [
    "prod",
    "preprod",
    "testing"
]


def main() -> int:
    result = {}

    for channel in CHANNELS:
        url = f"{BASE_URL}/{channel}/linux/ubuntu_18.04/latest-linux.yml"
        with urlopen(url) as response:
            body = response.read()
            result[channel] = yaml.safe_load(body)

    with open(FILE, 'w') as f:
        f.write(json.dumps(result, indent=2))
        f.write('\n')


if __name__ == '__main__':
    sys.exit(main())
