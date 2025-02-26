# 🚀 Repository Setup Guide

This guide will help you download, extract, and set up this repository on your Windows system and copy it to a specific directory inside WSL (Windows Subsystem for Linux). After copying, it will make all `.sh` files executable.

---

## 📌 Steps

### 🖥️ 1. Download the repository as a ZIP file

- Go to the [GitHub page of the repository](https://github.com/giuseppesiviero/wsl.git).
- Click on the green **"Code"** button.
- Select **"Download ZIP"** and save the file to your desired location on your Windows system.

### 📂 2. Extract the ZIP file

- Locate the downloaded ZIP file.
- Right-click on it and select **"Extract All..."**.
- Choose a destination folder on your Windows system to extract the contents.

### 🛠️ 3. Open WSL

- Open your WSL terminal by typing the following command in the Windows Command Prompt:

  ```sh
  wsl
  ```

  Alternatively, you can open the WSL terminal application directly.

### 📁 4. Create a target directory in WSL

- In your WSL terminal, run the following command:

  ```sh
  mkdir -p /path/to/target/directory
  ```

  Replace `/path/to/target/directory` with the actual path where you want to copy the repository in your WSL environment.

### 📤 5. Copy the extracted files to the WSL directory

- In your WSL terminal, run the following command to copy the files from your Windows system to the WSL directory:

  ```sh
  cp -r /mnt/c/path/to/extracted/folder/* /path/to/target/directory/
  ```

  Replace `/mnt/c/path/to/extracted/folder` with the path to the extracted folder on your Windows system, and `/path/to/target/directory` with the target directory in WSL.

### 🔧 6. Make all `.sh` files executable

- Navigate to the target directory in your WSL terminal:

  ```sh
  cd /path/to/target/directory
  ```

- Make all `.sh` files executable by running:

  ```sh
  chmod +x *.sh
  ```

---

## 🎯 Final Comments

✅ By following these steps, you will have successfully set up the repository in your WSL environment.

⚠️ **Make sure to verify the file permissions and test the scripts before running them.** If you encounter any issues, check the WSL file paths and permissions.

🎉 Happy coding!

