for subvolume in /var/lib/docker/btrfs/subvolumes/*; do
    btrfs subvolume delete $subvolume
done

docker volume prune
#docker volume prune --all
docker system prune --all

rm -rf /var/lib/docker/image
service docker restart
