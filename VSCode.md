# VSCode Debug

Debug python on bash scripts

```cardlink
url: https://github.com/yuanzhoulvpi2017/vscode_debug_transformers
title: "GitHub - yuanzhoulvpi2017/vscode_debug_transformers"
description: "Contribute to yuanzhoulvpi2017/vscode_debug_transformers development by creating an account on GitHub."
host: github.com
favicon: https://github.githubassets.com/favicons/favicon.svg
image: https://opengraph.githubassets.com/6ec5d5cf0e89f09e7911135e4d8d8f48b597008d32fd0b747f395466c859f0c9/yuanzhoulvpi2017/vscode_debug_transformers
```

```python
import debugpy
try:
    # 5678 is the default attach port in the VS Code debug configurations. Unless a host and port are specified, host defaults to 127.0.0.1
    debugpy.listen(("localhost", 9501))
    print("Waiting for debugger attach")
    debugpy.wait_for_client()
except Exception as e:
    print("Debugger attach failed")
```

```json
        {
            "name": "Sh File Debug",
            "type": "debugpy",
            "request": "attach",
            "connect": {
                "host": "localhost",
                "port": 9501
            }
        },
```
