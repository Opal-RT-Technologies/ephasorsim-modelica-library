import argparse
import zip

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('dest', help='name of archive')
    parser.add_argument('contents', nargs="+", help='targets to include in zip archive')

    args = parser.parse_args()

    zip.create_zip(args.dest, args.contents)
