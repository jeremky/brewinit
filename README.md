# brewinit

This script installs [Homebrew](https://brew.sh/) along with the CLI and macOS apps listed in dedicated files.

The script also disables the automatic creation of `.DS_Store` files on network shares.

## Usage

1. Download or clone this repository

   ```bash
   git clone https://github.com/jeremky/brewinit.git
   cd brewinit
   ```

2. In `config`, edit `cli.cfg` (CLI apps) and `apps.cfg` (macOS apps, installed as casks) to suit your needs

   > Lines starting with `#` are ignored

3. Run the script

   ```bash
   ./brewinit.sh
   ```

> [!IMPORTANT]
> The script will ask for your sudo password for the `.DS_Store` step
