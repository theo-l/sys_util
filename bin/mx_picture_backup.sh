#!/bin/bash
set -eu

source_dir='/run/user/1000/gvfs/mtp:host=%5Busb%3A003%2C004%5D/Internal\\ storage/Camera'

mx_picture_backup() {
    for pic in $(ls $source_dir); do
        echo -e "$pic "
    done
}
mx_picture_backup

