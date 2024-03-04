# Time-Gravity
Objective: Explore the intricate relationship between time and gravity, a key area at the crossroads of General Relativity and Quantum Mechanics.

tachyon_formulation.m

This MATLAB code snippet is designed to explore and visualize the concepts of relativistic energy and momentum for both normal particles (those with real mass) and hypothetical particles known as tachyons (those posited to have imaginary mass). It employs MATLAB's symbolic toolbox to define and manipulate equations symbolically before numerical evaluation. Here's a detailed breakdown:

Symbolic Variable Definition
The syms command is used to define symbolic variables. These are placeholders for values that can be manipulated algebraically. The variables m0, c, v, and mu are defined as real numbers, representing the rest mass, the speed of light, velocity, and the mass of a tachyon, respectively. Additional symbolic variables E_normal, P_normal, E_tachyon, and P_tachyon are defined for storing equations of energy and momentum.
Constants Initialization
c is assigned the value of the speed of light in meters per second (m/s).
m0 is set to 1 kg, representing a hypothetical rest mass for a normal particle.
mu is defined as m0 multiplied by the imaginary unit 1i, giving an imaginary mass for tachyons.
Equations
The energy (E_normal) and momentum (P_normal) for normal particles are calculated using the well-known relativistic formulas, which are valid when the velocity v is less than the speed of light c.
For tachyons, E_tachyon and P_tachyon are defined with equations that theoretically describe such particles' energy and momentum. These equations are similar in form to the normal particle equations but are derived under the assumption that the particle's velocity exceeds the speed of light, hence the square root of a negative number (which is where the imaginary mass comes into play).
Velocity Range and Result Arrays
A range of velocities from 0 to twice the speed of light is created with linspace. This range is used to evaluate how the energy and momentum of both particle types vary with velocity.
Arrays to hold the calculated energy and momentum values for each velocity in the range are initialized with zeros.
Computation Loop
The code iterates over the velocity range, calculating the energy and momentum for normal particles and tachyons at each velocity point. The if condition checks if the current velocity is less than the speed of light (for normal particles) or not (for tachyons).
The subs function substitutes the symbolic variables with numerical values for evaluation, and double is used to convert symbolic expressions to numeric double-precision values.
Plotting
Finally, the code plots the energy and momentum against velocity (normalized to the speed of light) for both normal particles and tachyons. The subplot function is used to create a 2-row figure, with the top plot showing energy and the bottom plot showing momentum. Normal particle curves are plotted in blue, while tachyon curves are in red dashed lines, with absolute values taken for the tachyon plots to ensure they are real and positive.
The code thus provides a graphical comparison between the theoretical behaviors of normal particles and tachyons in terms of relativistic energy and momentum, showcasing the differences in physics that would apply if particles faster than light with imaginary mass existed.

![image](https://github.com/DeepDynaSim/Time-Gravity/assets/35817872/4ceb8ebc-d10a-44d0-9d71-b8ee062acf6f)

frequencyshift_animation.m

This MATLAB code snippet is designed to visualize the concept of gravitational redshift through an animation. Gravitational redshift is a relativistic effect observed when light moves away from a massive body, such as a planet or a star; the light's frequency decreases (shifts towards the red end of the spectrum) as it climbs out of the gravitational well. Here's an in-depth explanation of the code:

Constants and Initial Setup
Constants related to Earth (mass M, radius R), the gravitational constant G, the speed of light c, and the original frequency of the photon f0 (chosen to be in the visible light spectrum) are defined.
The acceleration due to gravity g at the surface of the Earth is calculated using Newton's law of gravitation.
Distance and Frequency Shift Calculation
A linear space s from 0 to 20 million kilometers is created to represent the distance a photon travels away from the surface of the Earth.
The formula fs = f0 * exp(-g .* s ./ (c^2 * (1 + s ./ R))) calculates the frequency of the photon at different distances, taking into account the gravitational redshift effect. The exponential factor represents the relativistic calculation of frequency shift due to gravity, where c^2 in the denominator emphasizes the relativistic nature of the phenomenon. The (1 + s ./ R) term adjusts for the changing gravitational potential with distance.
The frequencies fs are normalized to [0, 1] for color mapping purposes. This normalization allows for a visual representation of the frequency shift as a color change from violet to red.
Visualization Setup
The figure is prepared with specific dimensions, and a blue circle represents Earth. The axis is set to accommodate the maximum distance in millions of kilometers, and the y-axis is arbitrary since this is a 2D visualization.
Animation Loop
An animation loop iterates over each distance value in s, plotting a point that represents the photon at its current distance from Earth.
The color of the photon is interpolated based on its normalized frequency shift, transitioning from violet (higher frequency) to red (lower frequency) to visually demonstrate the gravitational redshift. The color interpolation formula is designed to smoothly transition between these colors based on the calculated frequency shift.
After plotting each frame, the current figure is captured and stored in an array of frames for the animation. The figure is then cleared (clf) to redraw the next frame, ensuring that only one photon position is shown at any time.
The massive body (Earth) is redrawn at each iteration to maintain its visibility in the animation.
Video Creation
After completing the animation loop, the frames are compiled into a video using MATLAB's VideoWriter functionality. The video is saved with a specified filename and format (MPEG-4).
This visualization provides an intuitive understanding of how light is affected by gravity, specifically how its frequency decreases (redshifts) as it moves away from a massive body. By animating the photon's journey and color change, the code effectively demonstrates the principle of gravitational redshift in a visually engaging manner.

https://github.com/DeepDynaSim/Time-Gravity/assets/35817872/9e97d7df-d17c-435b-8baa-08fdf8743152

