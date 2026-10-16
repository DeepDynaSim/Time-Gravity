# Time, Gravity and Relativistic Energy

**DeepDynaSim collection | Computational physics | Educational MATLAB visualizations**

Explore gravitational redshift, photon-frequency visualization and relativistic energy-momentum relations using a compact set of MATLAB examples.

## Choose a resource

| Resource | Focus |
| --- | --- |
| [frequencyshift_graph.m](frequencyshift_graph.m) | Frequency-shift plots |
| [frequencyshift_animation.m](frequencyshift_animation.m) | Photon-frequency animation |
| [tachyon_formulation.m](tachyon_formulation.m) | Normal-particle and hypothetical tachyon energy-momentum comparison |
| [Lecture notes](Understanding%20Time%2C%20Gravity%2C%20and%20Energy.pdf) | Conceptual background |
| [Example video](GravitationalRedshift2DVisualization_VioletToRed.mp4) | Existing redshift visualization |

## Getting started

Open the cloned repository root in MATLAB. Inspect physical constants, units, velocity/distance ranges and video-output settings before running a script. The symbolic energy-momentum example requires Symbolic Math Toolbox.

```matlab
edit frequencyshift_graph.m
```

These examples support teaching and numerical exploration. Tachyons are hypothetical in the comparison script. Review the model assumptions and approximations in the notes when interpreting the redshift visualizations.

## Implemented models and units

### Frequency-shift scripts

`frequencyshift_graph.m` and `frequencyshift_animation.m` use the same exponential prescription:

```text
g = G*M/R^2
f(s) = f0 * exp(-g*s / (c^2*(1+s/R)))
     = f0 * exp(-(G*M/c^2)*(1/R - 1/(R+s)))
```

This describes the implemented approximation; the scripts do not solve spacetime geodesics or derive an exact relativistic metric solution. `G`, `M`, `R` and `c` use SI units. The distance array is `0 <= s <= 2e7` metres, which is **0 to 20,000 km**, not 20 million km.

| Script | Horizontal coordinate | Meaning | Output in the current folder |
|---|---|---|---|
| `frequencyshift_graph.m` | `s/1e3` | kilometres | `GravitationalRedshiftAnimation.mp4` |
| `frequencyshift_animation.m` | `s/1e6` | thousands of kilometres | `GravitationalRedshift2DVisualization_VioletToRed.mp4` |

The animation normalizes the frequency range to exaggerate the color contrast. Those colors are not a literal visible-spectrum prediction. The drawn Earth circle is a decorative scale choice and is not geometrically to scale with the horizontal coordinate. The mass remains fixed while the photon marker moves.

Both programs use MATLAB graphics and `VideoWriter`; MPEG-4 support is required. The animation additionally uses `viscircles` from Image Processing Toolbox. Existing output files with the same names may be replaced.

### `tachyon_formulation.m`

Symbolic Math Toolbox is required. The script compares subluminal expressions with a hypothetical imaginary-mass construction over `0 <= v <= 2*c`. It plots the absolute values of the complex tachyon quantities. This is a symbolic illustration, not evidence for faster-than-light particles or a validated physical dispersion model.

Array entries outside each branch's chosen velocity domain remain zero because of initialization; they are not predictions of zero energy or momentum. The formulas are singular at `v=c`. Respect the separate velocity domains when changing the plotting grid.

## Original example outputs

![image](https://github.com/DeepDynaSim/Time-Gravity/assets/35817872/4ceb8ebc-d10a-44d0-9d71-b8ee062acf6f)

https://github.com/DeepDynaSim/Time-Gravity/assets/35817872/9e97d7df-d17c-435b-8baa-08fdf8743152


## Related work and collaboration

Explore related repositories: [LorentzTransformations](https://github.com/DeepDynaSim/LorentzTransformations) · [RindlerSpace DopplerEffect](https://github.com/DeepDynaSim/RindlerSpace-DopplerEffect).

[DeepDynaSim](https://github.com/DeepDynaSim) is an engineering R&D and consulting company in İzmir, Türkiye, focused on physics-guided AI, simulation and control. For engineering collaboration: [support@deepdynasim.com](mailto:support@deepdynasim.com). For repository questions, use [Issues](https://github.com/DeepDynaSim/Time-Gravity/issues).

Reuse follows the existing [LICENSE](LICENSE); academic authorship and third-party attribution remain with their respective creators.
