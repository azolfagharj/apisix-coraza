🛡️ **APISIX + Coraza WASM** Integration Docker Image

This image combines [Apache APISIX](https://github.com/apache/apisix) with the [Coraza Proxy-WASM plugin](https://github.com/corazawaf/coraza-proxy-wasm) for enhanced Web Application Firewall (WAF) support via WASM.

🔧 Normally, APISIX doesn't include the Coraza WASM plugin by default due to permissions and runtime integration complexities.
To simplify the process, this Docker image includes the Coraza plugin at build time, making it easier to use out of the box.

---

### 🚀 How to use
##Step 1: Download Official Docker compose git
Official Instalation : [Installing APISIX](https://apisix.apache.org/docs/apisix/installation-guide/#installing-apisix)

##Step 2: Edit example/docker-compose.yml
replace:
```
image: apache/apisix:${APISIX_IMAGE_TAG:xxxxxxxxx}
```
with:
```
image: azolfagharj/apisix-coraza
```

##Step 3 : Edit example/apisix_conf/config.yaml

By default, the container behaves just like the official APISIX image.
However, to enable the WAF plugin, you must add the following section to your `config.yaml` file:

```yaml
wasm:
  plugins:
    - name: coraza-filter
      priority: 7999
      file: /usr/local/apisix/proxywasm/coraza-proxy-wasm.wasm
```
##Step 4 : Continue like official document


---

### 🏷️ Version Tag Format

Docker image tags follow this format:

```
apisix-coraza:aX.X.X-cY.Y.Y
```

- `aX.X.X`: Refers to the version of **Apache APISIX**
- `cY.Y.Y`: Refers to the version of the **Coraza Proxy-WASM plugin**

📌 For example:

```
apisix-coraza:a3.12.0-c0.5.0
```

means:

- **APISIX version:** 3.12.0
- **Coraza Proxy-WASM version:** 0.5.0

---
For more details and advanced usage:
🔗 [Apache APISIX GitHub](https://github.com/apache/apisix)
🔗 [Coraza Proxy-WASM GitHub](https://github.com/corazawaf/coraza-proxy-wasm)

---
📄 **Licensing Notice**
This image includes software licensed under the Apache License 2.0:
- [Apache APISIX](https://github.com/apache/apisix/blob/master/LICENSE)
- [Coraza Proxy-WASM](https://github.com/corazawaf/coraza-proxy-wasm/blob/main/LICENSE)

You may redistribute and use this image under the terms of the Apache License 2.0.

