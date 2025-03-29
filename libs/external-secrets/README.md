# external-secrets

Ensure you have `vendir` installed on your system. You can download it from the official Carvel website:

- [Download Vendir](https://carvel.dev/vendir/)

Follow the installation instructions provided for your operating system.

## Updating `vendir.yml`

1. Open the `vendir.yml` file located in the repository.
2. Update the configuration to point to the desired version of the upstream chart. For example, modify the `version` or `path` fields as needed.

## Running `vendir sync`

After updating the `vendir.yml` file, run the following command to sync the changes:

```bash
vendir sync
```

This command will fetch the updated resources as specified in the `vendir.yml` file.
