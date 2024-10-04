# pip mirror

```shell
-i https://pypi.tuna.tsinghua.edu.cn/simple some-package
```

```python
import os
os.environ['TORCH_HOME'] = '/data/wyx/Projects/weights/torch'
torch.hub.load('facebookresearch/dinov2', 'dinov2_vits14_reg', skip_validation=True)
```

# Hugging Face Mirror

```cardlink
url: https://hf-mirror.com/
title: "HF-Mirror - Huggingface 镜像站"
description: "加速访问Hugging Face的门户。作为一个公益项目，我们致力于提供稳定、快速的镜像服务，帮助国内用户无障碍访问Hugging Face的资源。"
host: hf-mirror.com
favicon: https://hf-mirror.com/favicon.ico
```
```shell
export HF_ENDPOINT=https://hf-mirror.com
```

```shell
CUDA_VISIBLE_DEVICES=0,1 python -m torch.distributed.launch --nproc_per_node=2 --master_port=29503 main.py \
```

```python
pred_logits = model(query_img_i, support_img, support_mask, None, [bry-tly, brx-tlx])['out']
pred_logits = pred_logits/pred_logits.norm(dim=1)
save_image(pred_logits[0].unsqueeze(1), './pred_logits.png')
save_image(pred_mask.float(), './pred_mask.png')
print(torch.nonzero(pred_mask == 1).squeeze().detach().cpu().numpy())
print(pred_logits[:,0,:,:][pred_mask == 1].detach().cpu().numpy(), pred_logits[:,1,:,:][pred_mask == 1].detach().cpu().numpy(), (pred_logits[:,0,:,:][pred_mask == 1] - pred_logits[:,1,:,:][pred_mask == 1]).abs().detach().cpu().numpy())
```
# Matplotlib Scripts
```python
from torchvision.utils import save_image
save_image(low_masks[0][1], './mask.png')

import matplotlib.pyplot as plt
plt.imshow(similarity_map[0][0].detach().cpu())
plt.axis('off')
plt.savefig('./similarity_map_0.png')

import matplotlib.pyplot as plt
idx = 2
feature_idx = 0

plt.figure(figsize=(20,5))
plt.subplot(1,4,1)
plt.imshow(similarity_map_list[feature_idx ][idx][0].detach().cpu())
plt.subplot(1,4,2)
plt.imshow(similarity_map_list[feature_idx ][idx][1].detach().cpu())
plt.subplot(1,4,3)
plt.imshow((similarity_map_list[feature_idx ][idx][0]+similarity_map_list[feature_idx ][idx][1]).detach().cpu())
plt.subplot(1,4,4)
plt.imshow(gt[idx].detach().cpu())
plt.savefig(f'./{idx}_similarity_map_{feature_idx }_up_down__damaged_.png')
```

```python
import numpy as np
import matplotlib.pyplot as plt
attn_output = np.random.rand(1025, 1, 1024)
attn_output = attn_output[1:, 0, :]
sub_image_size = 32
gap = 5
total_size = sub_image_size * 32 + gap * 31

canvas = np.ones((total_size, total_size))
for i in range(1024):
    row = i // 32
    col = i % 32
    start_row = row * (sub_image_size + gap)
    start_col = col * (sub_image_size + gap)
    canvas[start_row:start_row + sub_image_size, start_col:start_col + sub_image_size] = attn_output[:, i].reshape(32, 32)

plt.imshow(canvas, cmap='viridis')
plt.axis('off')
plt.savefig('./attn_output_c0.png')
plt.show()

```

```python
clip = torch.load('/data1/ykl/weights/clip/ViT-B-16.pt')
clip_dict = clip.state_dict()

clip.state_dict()['transformer.resblocks.1.attn.in_proj_weight']

for i in list(clip_dict.keys()):
    if 'resblocks.1.' in i:       
        new_v = torch.randn_like(clip_dict[i])
        clip_dict[i] = new_v
 
 clip.load_state_dict(clip_dict)
```

