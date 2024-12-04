# Running Script to install 'gh auth login' for Linux or windows
- Use the sh script file for the installation
```
chmod 755 gh-auth-login.sh
./gh-auth-login.sh
gh version
ls gh_${VERSION}_linux_amd64/share/man/man1/
```
# Configure token in GitHub
- You need GitHub username and token to login
- On GitHub Profile -> down to settings
- Settings -> Developer Settings -> Classic token
- When Creating add permissions to the token and copy the token.

# Login from CLI
```
git config --global user.name "github name"
git config --global user.email "github email"
git config --list          = to see user config
gh auth login
```
- insert GitHub username
- insert GitHub token