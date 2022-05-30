#!/usr/bin/env python3
import argparse
import json
import sys
import yaml
import pprint

from git import Actor, Repo
from urllib.request import urlopen


FILE = 'upstream-info.json'
BASE_URL = 'https://storage.googleapis.com/shadow-update/launcher'
CHANNELS = ['testing', 'preprod', 'prod']


def fetch_upstream_versions():
    result = {}

    for channel in CHANNELS:
        url = f'{BASE_URL}/{channel}/linux/ubuntu_18.04/latest-linux.yml'
        with urlopen(url) as response:
            body = response.read()
            result[channel] = yaml.safe_load(body)

    return result


def read_current_file(path):
    with open(path, 'r') as f:
        return json.load(f)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('--commit-upstream-infos', action='store_true')
    parser.add_argument('--author-name', default='github-actions[bot]')
    parser.add_argument('--author-email', default='github-actions[bot]@users.noreply.github.com')
    parser.add_argument('--channels', nargs='+', default=CHANNELS, choices=CHANNELS)
    return parser.parse_args()


def main() -> int:
    args = parse_args()

    repo = Repo.init('.')
    active_branch = repo.active_branch
    actor = Actor(args.author_name, args.author_email)

    upstream_versions = fetch_upstream_versions()
    file_versions = read_current_file(FILE)


    for channel in CHANNELS:
        old = file_versions[channel]
        new = upstream_versions[channel]

        if old == new:
            continue

        commit_message = '{}: {} -> {}'.format(channel, old['version'], new['version'])

        new_content = file_versions
        new_content[channel] = new

        if args.commit_upstream_infos:
            target_branch = f"updates/{channel}-{old['version']}_{new['version']}"
            repo.git.checkout('main')
            try:
                repo.git.branch("-D", target_branch)
            except:
                pass

            repo.git.checkout('-b', target_branch)
            index = repo.index

            with open(FILE, 'w') as f:
                f.write(json.dumps(new_content, indent=2))
                f.write('\n')

            index.add(FILE)
            index.commit(commit_message, author=actor)
            repo.remote().push(target_branch)

        print(commit_message)


if __name__ == '__main__':
    sys.exit(main())
