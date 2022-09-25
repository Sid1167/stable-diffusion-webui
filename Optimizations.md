A number of optimization can be enabled by [commandline arguments](Run-with-Custom-Parameters):

| commandline argument            | explanation                                                                                                                                                                                                                                                                                                                                                                                                                          |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `--opt-split-attention`         | Cross attention layer optimization significantly reducing memory use for almost no cost (some report improved preformance with it).  Black magic. <br/>On by default for `torch.cuda`, which includes both NVidia and AMD cards.                                                                                                                                                                                                     |
| `--disable-opt-split-attention` | Disables the optimization above.                                                                                                                                                                                                                                                                                                                                                                                                     |
| `--opt-split-attention-v1`      | Uses an older version of the optimization above that is not as memory hungry (it will use less VRAM, but will be more limiting in the maximum size of pictures you can make).                                                                                                                                                                                                                                                        |
| `--medvram`                     | Makes the Stable Diffusion model consume less VRAM by splitting it into three parts - cond (for transforming text into numerical representation), first_stage (for converting a picture into latent space and back), and unet (for actual denoising of latent space) and making it so that only one is in VRAM at all times, sending others to CPU RAM. Lowers performance, but only by a bit - except if live previews are enabled. |
| `--lowvram`                     | An even more thorough optimization of the above, splitting unet into many modules, and only one module is kept in VRAM. Devastating for performance.                                                                                                                                                                                                                                                                                 |
| `*do-not-batch-cond-uncond`     | Prevents batching of positive and negative prompts during sampling, which essentially lets you run at 0.5 batch size, saving a lot of memory. Decreases performance. Not a command line option, but an optimization implicitly enabled by using `--medvram` or `--lowvram`.                                                                                                                                                          |
| `--always-batch-cond-uncond`    | Disables the optimization above. Only makes sense together with `--medvram` or `--lowvram`                                                                                                                                                                                                                                                                                                                                           |
| `--opt-channelslast`            | Changes torch memory type for stable diffusion to channels last. Effects not closely studied.                                                                                                                                                                                                                                                                                                                                        |