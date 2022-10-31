# swupdate-generate

This is a tool of generating a swu file.If there is a problem, run the `./swupdate-generate -h` command to obtain help.  

## Getting started

### 1. Set your own paths for deb package and cms/rsa key
Default path for `deb Package` and `CMS key`:
```
image_path=/tmp/images
key_path=/tmp/keys
```
If your paths are different，you can set temporary environment variables. For example:
```
export image_path=/home/ljd/swupdate_images
export key_path=/home/ljd/swupdate_keys
```
### 2. Follow these steps in order
- Generate a private key and a public key with RSA/CMS by using the tool to execute `./swupdate-generate -k/-K`.
- If you need to encrypt these deb packages by using the tool to execute `./swupdate-generate -e`.
- Sign sw-description with CMS by using the tool to execute `./swupdate-generate -s`.
- Generate a swu file through sw-description sw-description.sig and deb packages by using the tool to execute `./swupdate-generate -c`.

## Existing commands

- [-c] generate a swu file through sw-description sw-description.sig and our deb packages
- [-e] symmetrically encrypted update images
- [-h] print this help message and exit
- [-k] generate a private key and a public key with RSA
- [-K] generate a private key and a public key with CMS
- [-s] sign sw-description with CMS
