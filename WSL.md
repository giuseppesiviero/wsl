# Guide to Installing WSL 2 with Ubuntu 24.04

## Prerequisites
- Windows 10 (version 1903 or later, build 18362) or Windows 11
- Administrator privileges

## Install WSL 2 and Ubuntu 24.04

Open PowerShell as administrator and run the following command:

```powershell
wsl --install -d Ubuntu-24.04
```

This command will:
1. Enable WSL
2. Set WSL 2 as the default version
3. Install the latest WSL kernel update
4. Install Ubuntu 24.04

If you already have WSL installed, make sure it is up to date:

```powershell
wsl --update
```

## Verify the Installation
After installation, you can start Ubuntu by running:

```powershell
wsl
```

or

```powershell
wsl -d Ubuntu-24.04
```

Check the installed distributions and their WSL versions with:

```powershell
wsl -l -v
```

If you need to set Ubuntu 24.04 to use WSL 2, run:

```powershell
wsl --set-version Ubuntu-24.04 2
```

## Conclusion
You now have WSL 2 installed with Ubuntu 24.04! You can start using the Linux environment seamlessly integrated with Windows.

