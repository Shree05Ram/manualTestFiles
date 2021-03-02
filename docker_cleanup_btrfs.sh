for subvolume in /var/lib/docker/btrfs/subvolumes/*; do
    btrfs subvolume delete $subvolume
done

docker volume prune --all #if the cmd fails then use "docker volume prune" command
docker system prune --all

rm -rf /var/lib/docker/image
service docker restart
