## Automatic Install
**Tested on Ubuntu Server 22.04 & WSL**

**Run Install Script:**
```bash <(curl -s https://raw.githubusercontent.com/xero-nova/blockheads-linux-server/main/install.sh)```

## Manual Install
**Tested on Ubuntu Server 22.04 & WSL**

1. Install Packages:
```sudo apt-get install libgnustep-base1.28 libdispatch0 patchelf -y```

2. Download Server:
```wget https://majicdave.com/share/blockheads_server171.tar.gz```

3. Extract Server:
```tar xzf blockheads_server171.tar.gz && chmod +x blockheads_server171```

4. Apply Patches:
 
```patchelf --replace-needed libgnustep-base.so.1.24 libgnustep-base.so.1.28 blockheads_server171```

```patchelf --replace-needed libobjc.so.4.6 libobjc.so.4 blockheads_server171```

```patchelf --replace-needed libgnutls.so.26 libgnutls.so.30 blockheads_server171```

```patchelf --replace-needed libgcrypt.so.11 libgcrypt.so.20 blockheads_server171```

```patchelf --replace-needed libffi.so.6 libffi.so.8 blockheads_server171```

```patchelf --replace-needed libicui18n.so.48 libicui18n.so.70 blockheads_server171```

```patchelf --replace-needed libicuuc.so.48 libicuuc.so.70 blockheads_server171```

```patchelf --replace-needed libicudata.so.48 libicudata.so.70 blockheads_server171```

```patchelf --replace-needed libdispatch.so libdispatch.so.0 blockheads_server171```

5. Create new server!
```./blockheads_server -help```
