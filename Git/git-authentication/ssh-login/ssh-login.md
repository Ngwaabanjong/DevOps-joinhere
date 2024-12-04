## Step 1: Install Git To begin:
- Make sure you have Git installed on your OS system. 
- Open a terminal and run the following commands:
```
sudo apt update
sudo apt install git
```

## Step 2: Configure Git Username and Email:
- To commit to remote repository your Git username and email needs to be configured. 
- Run below commands, replacing **Your Name** with your desired name and **your-email@example.com** with your GitHub associated email address:
```
git config --global user.name "Your Name"
git config --global user.email "your-email@example.com"
git config --list
```

## Step 3: Generate an SSH Key Pair:
- To securely authenticate with your GitHub account without entering your credentials every time, you’ll need to generate an SSH key pair. 
- Press enter 2X to store the keys on the default location.
- Run the following command in the terminal:
```
ssh-keygen -t rsa -b 4096 -C "<your-email@example.com>"
```

## Step 4: Add SSH Key to the SSH Agent:
- The SSH agent manages your keys.
- Run the following commands:
```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

## Step 5: Copy Your SSH Public Key to clipboard Now:
- When the output displays your public key copy from RSA to your Email.
- Run the following command:
```
cat ~/.ssh/id_rsa.pub
```

## Step 6: Add SSH Key to GitHub Account:
- Open your web browser and login to github.com.
- On Settings => “SSH and GPG keys => New SSH key
- Give your SSH Keys a title (osname-ssh-key) => paste the copied public key below in the key field. 
- Click: add key to save on GitHub account.
- Copy the copy for your reference.
- Now, test the connection and wait for the success message.
- Run the following command on your CLI:
```
ssh -T git@github.com
```

