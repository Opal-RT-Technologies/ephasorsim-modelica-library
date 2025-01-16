import os
import zipfile


def create_zip(dest, contents_to_zip):
    with zipfile.ZipFile(dest, 'w') as zf:
        for f in contents_to_zip:
            if os.path.isdir(f):
                for root, _, files in os.walk(f):
                    for file in files:
                        zf.write(os.path.join(root, file))
            else:
                zf.write(f)


def filter_zip(archive, contents_to_remove, original_prefix="old", dest=None):
    if not os.path.exists(archive):
        raise Exception(f'Archive {archive} not found')

    # Create a temporary zip file to store the modified contents
    archive_name = os.path.basename(archive)
    archive_path = os.path.dirname(archive)
    dest_path = archive_path if dest is None else dest

    new_archive = os.path.join(archive_path, archive_name)
    backup_archive = os.path.join(dest_path, f"{original_prefix}-" + archive_name)

    # print(f'original archive: {args.archive} -> backup: {backup_archive}')
    os.rename(archive, backup_archive)

    with zipfile.ZipFile(backup_archive, 'r') as zip_in, zipfile.ZipFile(new_archive, 'w') as zip_out:
        for item in zip_in.infolist():
            exclude = False
            for to_exclude in contents_to_remove:
                if item.filename.startswith(to_exclude):
                    exclude = True
                    break

            if not exclude:
                # Write to the new zip archive
                zip_out.writestr(item, zip_in.read(item.filename))


def extract_zip(archive, dest):
    with zipfile.ZipFile(archive, 'r') as zip_in:
        zip_in.extractall(dest)
