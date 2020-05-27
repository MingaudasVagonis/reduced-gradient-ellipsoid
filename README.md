# Reduced Gradient Descent

Calculating the maximum semi-ellipsoid volume using Reduced Gradient Descent method with total surface area given as a constraint.

Reduced Gradient Descent and Newton methods are implemented from scratch.
The method is designed to work with 3 variables and one constraint but can easily be modified to support more.

 - [**Algorithm**](#algorithm)  
 - [**Examples**](#examples)  

## Algorithm

Reduced gradient is calculated as follows, with B - basic variable vector, NB - non-basic variable vector.

**Insert img**

The step for basic variables is calculated according to the negative reduced gradient.

**Insert img**

By solving the system of constraint equations we get non basic variables.

**Insert img**

## Examples

The following examples use the ellipsoid volume formula divided in half
**Insert img**
and the total ellipsoid surface area formula divided in half as a constraint.
**Insert img**

**With surface area equal to 100**
Start X | Start volume | Time (s) | Iterations | Result X | Result
--- | --- | --- | --- | --- | ---
(2 3 4) | 50.24 | 0.333 | 79 | (3.9898    3.9898    3.9913) | 132.999
(1 2 8) | 33.49 | 0.336 | 81 | (3.9898    3.9898    3.9913) | 132.999
(0.8 0.8 0.9) | 1.21 | 0.350 | 80 | (3.9898    3.9898    3.9913) | 132.999
(0.5 0.6 7) | 4.39 | 0.346 | 80 | (3.9898    3.9898    3.9913) | 132.999

*Plot with starting point (2 3 4)*
**Insert img**

**With surface area equal to 24.5**
Start X | Start volume | Time (s) | Iterations | Result X | Result
--- | --- | --- | --- | --- | ---
(1 2 3) | 12.56 | 0.368 | 12 | (1.9727    1.9777    1.9751) | 16.1304
(1 2 5) | 10.47 | 0.375 | 5 | (1.9761    1.9761    1.9767) | 16.1585
(0.5 0.5 10) | 5.23 | 0.364 | 7 | (1.9776    1.9776    1.9746) | 16.1649
(0.7 0.2 0.8) | 0.23 | 0.334 | 10 | (1.9764    1.9737    1.9749) | 16.1263

*Plot with starting point (0.7 0.2 0.8)*
**Insert img**
