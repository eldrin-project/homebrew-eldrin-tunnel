# Eldrin Tunnel

[![Release](https://img.shields.io/github/v/release/eldrin-project/homebrew-eldrin-tunnel?label=version)](https://github.com/eldrin-project/homebrew-eldrin-tunnel/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

SSH tunnel client for exposing local services to the internet. Think ngrok, but simpler and self-hosted.

## 🚀 Quick Start

### macOS & Linux (Homebrew)

```bash
brew tap eldrin-project/eldrin-tunnel
brew install eldrin-tunnel
```

### Windows (winget)

```powershell
winget install EldrinProject.EldrinTunnel
```

### Windows (Scoop)

```powershell
scoop bucket add eldrin-tunnel https://github.com/eldrin-project/homebrew-eldrin-tunnel
scoop install eldrin-tunnel
```

### Linux (Snap)

```bash
sudo snap install eldrin-tunnel
```

## 📋 Usage

### Anonymous Tunnels (Free)
```bash
# Expose local port 3000
eldrin-tunnel --port 3000
```

### Authenticated Tunnels (Registered Users)
```bash
# Login first
eldrin-tunnel --login user@example.com

# Create tunnel with custom subdomain
eldrin-tunnel --port 3000 --url myapp
# Creates: https://myapp.tunnel.eldrin.link
```

### Tunnel Restoration
The client automatically saves tunnel info and can restore the same URL after network changes:

```bash
# Start tunnel at home
eldrin-tunnel --port 3000
# URL: https://abc123.tunnel.eldrin.link

# Close laptop, go to office, restart tunnel
eldrin-tunnel --port 3000
# Same URL: https://abc123.tunnel.eldrin.link ✨
```

## 🌟 Features

- **🔒 Secure**: SSH-based tunneling with authentication
- **🔄 Restoration**: Same URL after network changes/restarts
- **📱 Cross-platform**: Windows, macOS, Linux
- **⚡ Fast**: Direct SSH connection, no WebSocket overhead
- **🆓 Free tier**: Anonymous tunnels with 1-hour expiration
- **💎 Premium**: Persistent tunnels, custom subdomains

## 📚 Documentation

Visit [eldrin.link](https://eldrin.link) for full documentation.

## 🛠️ Development

This repository contains release binaries and package manager manifests. For issues and contributions, visit the main project repository.

## 📦 Package Manager Setup

### Repository Structure
```
├── Formula/
│   └── eldrin-tunnel.rb           # Homebrew formula
├── bucket/
│   └── eldrin-tunnel.json         # Scoop manifest  
├── winget/
│   └── EldrinProject.EldrinTunnel.yaml  # winget manifest
└── README.md                      # This file
```

### Automated Updates
This repository is automatically updated via GitHub Actions when new releases are tagged in the main project. The workflow:

1. **Builds** binaries for all platforms (macOS, Linux, Windows)
2. **Calculates** SHA256 checksums for all packages
3. **Generates** package manager manifests from templates
4. **Commits** updated manifests to this repository
5. **Publishes** Snap package to Snap Store

### Manual Package Manager Submissions

#### Homebrew ✅
- **Status**: Automated via this repository
- **Installation**: `brew tap eldrin-project/eldrin-tunnel && brew install eldrin-tunnel`

#### Scoop ✅  
- **Status**: Automated via this repository
- **Installation**: `scoop bucket add eldrin-tunnel https://github.com/eldrin-project/homebrew-eldrin-tunnel && scoop install eldrin-tunnel`

#### Snap ✅
- **Status**: Automated via GitHub Actions
- **Installation**: `sudo snap install eldrin-tunnel`

#### winget ⏳
- **Status**: Manifest generated, manual submission required
- **Installation**: `winget install EldrinProject.EldrinTunnel` (after submission)

## 📋 TODO: winget Submission

### Initial Submission Steps

1. **Fork the winget-pkgs repository**:
   ```bash
   # Go to: https://github.com/microsoft/winget-pkgs
   # Click "Fork" to create your copy
   ```

2. **Clone your fork**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/winget-pkgs.git
   cd winget-pkgs
   ```

3. **Create directory structure** (for version 1.0.0):
   ```bash
   mkdir -p manifests/e/EldrinProject/EldrinTunnel/1.0.0
   ```

4. **Copy the manifest**:
   ```bash
   # Copy winget/EldrinProject.EldrinTunnel.yaml to:
   cp path/to/winget/EldrinProject.EldrinTunnel.yaml \
     manifests/e/EldrinProject/EldrinTunnel/1.0.0/
   ```

5. **Split the manifest** (winget requires separate files):
   ```bash
   cd manifests/e/EldrinProject/EldrinTunnel/1.0.0/
   
   # Split the combined YAML into three files:
   # - EldrinProject.EldrinTunnel.yaml (version manifest)
   # - EldrinProject.EldrinTunnel.locale.en-US.yaml (locale)
   # - EldrinProject.EldrinTunnel.installer.yaml (installer)
   ```

6. **Validate the manifest**:
   ```bash
   # Install winget validation tools
   winget validate manifests/e/EldrinProject/EldrinTunnel/1.0.0/
   ```

7. **Submit Pull Request**:
   ```bash
   git add manifests/e/EldrinProject/EldrinTunnel/
   git commit -m "Add EldrinProject.EldrinTunnel version 1.0.0"
   git push origin main
   
   # Create PR at: https://github.com/microsoft/winget-pkgs/compare
   ```

### Future Automation (After Initial Approval)

Once the initial package is approved, future updates can be automated using:

- **winget-pkgs-automation**: GitHub Action for automatic PR creation
- **Komac**: Community tool for winget package maintenance
- **Manual PRs**: Continue manual submission for each version

### Validation Checklist

Before submitting to winget-pkgs:

- [ ] Package name follows Microsoft naming conventions
- [ ] All URLs are accessible and valid
- [ ] SHA256 checksums are correct
- [ ] License information is accurate
- [ ] Description is clear and concise
- [ ] Installer works on clean Windows systems
- [ ] No trademark or copyright violations

### References

- [winget-pkgs Contributing Guide](https://github.com/microsoft/winget-pkgs/blob/master/CONTRIBUTING.md)
- [Manifest Schema Documentation](https://docs.microsoft.com/en-us/windows/package-manager/package/)
- [winget Command Line Tool](https://docs.microsoft.com/en-us/windows/package-manager/winget/)

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.